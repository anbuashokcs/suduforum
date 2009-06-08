package com.trydone.core.database;

import net.jforum.util.preferences.ConfigKeys;
import net.jforum.util.preferences.SystemGlobals;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

/**
 * Every query and connection come from here.
 * Before you can get some connection from the pool, you must
 * call init() to initialize the connections. After that,
 * to get a conneciton, simple use
 * <p/>
 * <blockquote><pre>
 * 		Connection con = PooledConnection.getConnection();
 * </pre></blockquote>
 * <p/>
 * The name of the query is associated with a Prepared Statement string, which is inside
 * of a properties file, called [dbtype].sql, where the type is specified inside of
 * database.properties.<br>
 * <br>
 * Also manages the connection to the database. The configuration is a config file which
 * is read at the first <code>init()</code> call. You must init it before using the pool.<p>
 * <p/>
 * <code>PooledConnection</code> is for now a singleton.
 *
 * @author Paulo Silveira
 * @author Rafael Steil
 * @version $Id: PooledConnection.java,v 1.4 2006/01/05 07:48:16 pinke Exp $
 */

public class PooledConnection {


    private int maxConnections;
    private int pingDelay;
    private String connectionString;
    private String databaseUsername;
    private String databasePassword;

    private static final Logger logger = Logger.getLogger(PooledConnection.class);
    protected boolean isDatabaseUp;

    private static PooledConnection instance;

    /**
     * It is the connection pool
     */
    private static LinkedList connections = new LinkedList();

    /**
     * It has all the connections, even the ones in use.
     * This way, the garbage collector does not get them.
     */
    private static LinkedList allConnections = new LinkedList();

    // for sinalizing a release
    private Object releaseSignal = new Object();

    private static final boolean debug = true;

    /**
     * Private constructor that loads the driver and set the configuration from
     * the properties file. It will also initialize the Database driver.
     *
     * @throws Exception Exception
     */
    private PooledConnection() throws Exception {
        init();
    }

    public static PooledConnection getInstance() throws Exception {
        if (instance == null) {
            instance = new PooledConnection();
            logger.info("new dbconnect pool");
        }
        logger.info("All pools:" + allConnections.size() + ": free connections: " + connections.size());
        return instance;
    }

    /**
     * Inits ConnectionPool.
     * If the pool was already initialized, this action will take no effect.
     *
     * @throws Exception Exception
     */
    public void init() throws Exception {
        String driver = SystemGlobals.getValue(ConfigKeys.DATABASE_CONNECTION_DRIVER);

        int minConnections = SystemGlobals.getIntValue(ConfigKeys.DATABASE_POOL_MIN);
        minConnections = minConnections == 0 ? 5 : minConnections;

        this.maxConnections = SystemGlobals.getIntValue(ConfigKeys.DATABASE_POOL_MAX);
        maxConnections = maxConnections == 0 ? 10 : maxConnections;

        this.pingDelay = SystemGlobals.getIntValue(ConfigKeys.DATABASE_PING_DELAY);
        this.connectionString = SystemGlobals.getValue(ConfigKeys.DATABASE_CONNECTION_STRING);
        this.databasePassword = SystemGlobals.getValue(ConfigKeys.DATABASE_CONNECTION_PASSWORD);
        this.databaseUsername = SystemGlobals.getValue(ConfigKeys.DATABASE_CONNECTION_USERNAME);

        //(, "socity", "Socity111");
        try {
            Class.forName(driver);

            if (logger.isDebugEnabled()) {
                logger.info("*********************************************");
                logger.info("******** STARTING CONNECTION POOL ***********");
                logger.info("*********************************************");
                logger.info("database.connection.driver = " + driver);
                logger.info("minConnections = " + minConnections);
                logger.info("maxConnections = " + this.maxConnections);
                logger.info("pingDelay = " + this.pingDelay);
                logger.info("*********************************************");
            }

            for (int i = 0; i < minConnections; i++) {
                Connection conn = DriverManager.getConnection(this.connectionString, this.databaseUsername, this.databasePassword);
                if (conn == null) {
                    throw new RuntimeException("Con't connect database to getConnection!");

                }
                connections.addLast(conn);
                allConnections.add(conn);

                if (logger.isDebugEnabled()) {
                    Date now = new Date();
                    logger.info(now.toString() + " opening connection " + (i + 1));
                }
            }

            this.isDatabaseUp = true;
        }
        catch (ClassNotFoundException e) {
            this.isDatabaseUp = false;

            logger.error("Ouch... Cannot find database driver: " + driver);
            throw new IOException("Ouch... Cannot find database driver: " + driver);
        }
        //ping
        this.enableConnectionPinging();
    }

    /**
     * Gets a connection to the database.<p>
     * <p/>
     * So you need to release it, after use. It will not be a huge problem if you do not
     * release it, but this way you will get a better performance.<p>
     * Thread safe.
     *
     * @return <code>Connection</code> object
     * @throws SQLException java.sql.SQLException
     */
    public synchronized Connection getConnection() throws SQLException {
        Connection conn = null;

        // if there is enought Connections
        if (connections.size() > 0) {
            synchronized (connections) {
                conn = (Connection) connections.removeFirst();
            }

            // take a look if the connection has died!
            try {
                if (conn.isClosed()) {
                    synchronized (allConnections) {
                        allConnections.remove(conn);
                        conn = DriverManager.getConnection(this.connectionString, this.databaseUsername, this.databasePassword);

                        allConnections.add(conn);
                    }
                }
            } catch (SQLException e) {
                //if (debug) {
                logger.warn("Cannot reconnect a closed connection:" + this.connectionString + e);
                //}
               throw e;
            }
            return conn;
        }

        // Otherwise, create a new one if the Pool is now full
        if (allConnections.size() < this.maxConnections) {
            try {
                conn = DriverManager.getConnection(this.connectionString, this.databaseUsername, this.databasePassword);
            }
            catch (SQLException e) {
                //if (debug) {
                logger.warn("Cannot stabilish a NEW connection to the database:" + this.connectionString + e);
                //}

                throw e;
            }
            // registering the new connection
            synchronized (allConnections) {
                allConnections.add(conn);
            }
            return conn;
        }

        /*
         * Trying to get some Connections stuck inside some Queries.
         * The Query.finalize method will release them.
         * We need to wait sometime, so the GC will get the Connections for us
         */
        System.gc();
        synchronized (this.releaseSignal) {
            /*
                * Not inside a while, since we are giving it a maximum pingDelay,
                * and this method is already SYNC, there is no way that we will loose
                * the state if we receive a signal
                */
            if (connections.size() == 0) {
                try {
                    this.releaseSignal.wait(this.pingDelay);
                }
                catch (InterruptedException e) {
                    //if (debug)
                    logger.warn("Problems while waiting for connection. " + e);
                }
            }

            if (connections.size() == 0) {
                // TIMED OUT!!!!
                // if (debug) {
                logger.warn("Pool is empty, and th waiting for one timed out!"
                        + "If this is happening too much, your code is probably not releasing the Connections."
                        + "If you cant solve this, set your 'database.connection.pool.pingDelay' to a bigger number.");
                // }
            } else {
                synchronized (connections) {
                    conn = (Connection) connections.removeFirst();
                }

                return conn;
            }
        }

        return conn;
    }

    private boolean testConnection(Connection conn) {
        try {
            //TODO: execute a sql for test
            return !conn.isClosed();
        } catch (Exception e) {
            return false;
        }
    }

    private void pingConnections() {
        try {
            this.ReleaseAllConnections();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            this.init();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void enableConnectionPinging() {
        new Timer(true).schedule(new TimerTask() {
            public void run() {
                pingConnections();
            }
        }, Long.parseLong(String.valueOf(pingDelay)));
    }

    public void ReleaseAllConnections() throws Exception {
        if (allConnections == null || allConnections.size() == 0) {
            return;
        }

        synchronized (allConnections) {
            for (Iterator iter = allConnections.iterator(); iter.hasNext();) {
                try {
                    Connection conn = (Connection) iter.next();
                    connections.remove(conn);
                    conn.close();
                    iter.remove();

                    logger.info("Real closing connection...");
                }
                catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        allConnections = new LinkedList();
        connections = new LinkedList();
    }

    /**
     * Releases a connection, making it available to the pool once more.
     *
     * @param conn <code>Connection</code> object to release
     * @throws java.sql.SQLException
     */
    public void releaseConnection(Connection conn) throws SQLException {
        if (conn == null) {
            if (debug) {
                logger.warn("Cannot release a NULL connection!");
            }

            return;
        }

        // Sync because collection.contains() uses the fail fast iterator!
        synchronized (allConnections) {
            if (!allConnections.contains(conn) && debug) {
                logger.warn("Cannot release a connection that is not from this pool!");

                return;
            }

            try {
                if (conn.isClosed()) {
                    allConnections.remove(conn);

                    return;
                }
            }
            catch (SQLException e) {
                //if (logger.isDebugEnabled()) {
                logger.warn("Cannot get info about the conn: " + e);
                //}
            }
        }

        synchronized (this.releaseSignal) {
            synchronized (connections) {
                connections.addLast(conn);
            }

            this.releaseSignal.notify();
        }
    }

    /**
     * Returns the status
     *
     * @return The status
     */
    public synchronized String getStatus() {
        StringBuffer status = new StringBuffer();
        int i = 0;

        Iterator it = allConnections.iterator();
        while (it.hasNext()) {
            i++;
            status.append("Connection ");
            status.append(i);
            status.append(": ");

            Connection c = (Connection) it.next();
            if (c != null) {
                try {
                    status.append(c);
                    status.append(" closed: ");
                    status.append(c.isClosed());
                }
                catch (SQLException e) {
                    status.append(e);
                }
            } else {
                status.append("NULL!!!");
            }

            status.append("\n");
        }

        status.append("\nPOOL:\n\n");
        i = 0;

        it = connections.iterator();
        while (it.hasNext()) {
            i++;
            status.append("Connection ");
            status.append(i);
            status.append(": ");

            Connection c = (Connection) it.next();
            if (c != null) {
                try {
                    status.append(c);
                    status.append(" closed: ");
                    status.append(c.isClosed());
                }
                catch (SQLException e) {
                    status.append(e);
                }
            } else
                status.append("NULL!!!");

            status.append("\n");
        }

        return status.toString();
    }


    public String toString() {
        return "PooledConnection{" +
                "maxConnections=" + maxConnections +
                ", pingDelay=" + pingDelay +
                ", connectionString='" + connectionString + '\'' +
                ", databaseUsername='" + databaseUsername + '\'' +
                ", databasePassword='" + databasePassword + '\'' +
                ", isDatabaseUp=" + isDatabaseUp +
                ", releaseSignal=" + releaseSignal +
                '}';
    }

    public static void main(String[] args) {
        try {
            PooledConnection pc = new PooledConnection();
            Connection conn = pc.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
