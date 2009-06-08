package com.trydone.forum.action.ajax;

import com.trydone.core.util.HtmlToText;
import com.trydone.core.util.HtmlUtils;
import net.jforum.JForumExecutionContext;
import net.jforum.dao.DataAccessDriver;
import net.jforum.dao.TopicDAO;
import net.jforum.entities.Post;
import net.jforum.entities.Topic;
import net.jforum.entities.User;
import net.jforum.exceptions.DatabaseException;
import net.jforum.repository.PostRepository;
import net.jforum.repository.TopicRepository;
import net.jforum.util.DbUtils;
import net.jforum.util.preferences.ConfigKeys;
import net.jforum.util.preferences.SystemGlobals;
import org.apache.log4j.Logger;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class PostAjaxAction {
    private static Logger logger = Logger.getLogger(PostAjaxAction.class);
    private static int maxLength = 30; //max descript length

    public List getPostsByForumId(int forumId, int start) {
        return getPostsByForumId(forumId, start, true);
    }

    public List getPostsByForumId(int forumId, int start, boolean autoCloseDatabase) {

        TopicDAO dao = DataAccessDriver.getInstance().newTopicDAO();
        boolean requery = true;
        List topics = new ArrayList();

        // Try to get the first's page of topics from the cache
        if (start == 0 && SystemGlobals.getBoolValue(ConfigKeys.TOPIC_CACHE_ENABLED)) {
            topics = TopicRepository.getTopics(forumId);
            requery = topics.size() == 0;
        }
        if (requery) {
            if (topics.size() == 0 || !TopicRepository.isLoaded(forumId)) {
                int topicsPerPage = SystemGlobals.getIntValue(ConfigKeys.POSTS_PER_PAGE);
                try {
                    topics = dao.selectAllByForumByLimit(forumId, start, topicsPerPage);
                    TopicRepository.addAll(forumId, topics);
                } catch (Exception e) {
                    logger.warn(e);
                } finally {
                    if (autoCloseDatabase) {
                        JForumExecutionContext.finish();     //  releaseConnection
                    }
                }
            }
        }
        return topics;
    }

    public List getPosts(int topicId, int start) {
        return getPosts(topicId, start, true);
    }

    public List getPosts(int topicId, int start, boolean autoCloseDatabase) {
        int count = SystemGlobals.getIntValue(ConfigKeys.POSTS_PER_PAGE);
        //  PostDAO dao = DataAccessDriver.getInstance().newPostDAO();
        List posts;
        if (SystemGlobals.getBoolValue(ConfigKeys.POSTS_CACHE_ENABLED)) {
            posts = PostRepository.selectAllByTopicByLimit(topicId, start, count);
        } else {
            //  posts = dao.selectAllByTopicByLimit(topicId, start, count);
            posts = new ArrayList();
            String sql = SystemGlobals.getSql("PostModel.selectAllByTopicByLimit");
            PreparedStatement p;
            ResultSet rs;
            try {
                Connection conn = JForumExecutionContext.getConnection();
                if (!conn.isClosed()) {
                    p = conn.prepareStatement(sql);
                    p.setInt(1, topicId);
                    p.setInt(2, start);
                    p.setInt(3, count);
                    rs = p.executeQuery();
                    while (rs.next()) {
                        posts.add(this.makePost(rs));
                    }
                    DbUtils.close(rs, p);
                }
            }
            catch (Exception e) {
                logger.warn(e);
            } finally {
                if (autoCloseDatabase) {
                    JForumExecutionContext.finish();
                }
            }
        }
        return posts;
    }

    public String getTextFormHtml(String html) {
        return new HtmlToText().getTextFromHtml(html);
    }

    private Post makePost(ResultSet rs) throws SQLException {
        Post post = new Post();
        post.setId(rs.getInt("post_id"));
        post.setTopicId(rs.getInt("topic_id"));
        post.setForumId(rs.getInt("forum_id"));
        post.setUserId(rs.getInt("user_id"));
        Timestamp postTime = rs.getTimestamp("post_time");
        post.setTime(new java.util.Date(postTime.getTime()));
        post.setUserIp(rs.getString("poster_ip"));
        post.setBbCodeEnabled(rs.getInt("enable_bbcode") > 0);
        post.setHtmlEnabled(rs.getInt("enable_html") > 0);
        post.setSmiliesEnabled(rs.getInt("enable_smilies") > 0);
        post.setSignatureEnabled(rs.getInt("enable_sig") > 0);
        post.setEditCount(rs.getInt("post_edit_count"));
        post.setSubject(rs.getString("post_subject"));
        //ost.setText(this.getPostTextFromResultSet(rs));
        post.setText(HtmlUtils.getText(this.getPostTextFromResultSet(rs), maxLength));   //cut more text
        post.setPostUsername(rs.getString("username"));
        post.hasAttachments(rs.getInt("attach") > 0);
        post.setModerate(rs.getInt("need_moderate") == 1);
        SimpleDateFormat df = new SimpleDateFormat(SystemGlobals.getValue(ConfigKeys.DATE_TIME_FORMAT));
        post.setFormatedTime(df.format(postTime));
        // post.setKarma(DataAccessDriver.getInstance().newKarmaDAO().getPostKarma(post.getId()));
        return post;
    }

    /**
     * Utility method to read the post text fromt the result set. This method may be useful when
     * using some "non-standart" way to store text, like oracle does when using (c|b)lob
     *
     * @param rs The resultset to fetch data from
     * @return The post text string
     * @throws SQLException SQLException
     */
    private String getPostTextFromResultSet(ResultSet rs) throws SQLException {
        return rs.getString("post_text");
    }


    public List fillTopicsData(PreparedStatement p, Connection conn) {
        List l = new ArrayList();

        ResultSet rs = null;
        try {
            rs = p.executeQuery();

            SimpleDateFormat df = new SimpleDateFormat(SystemGlobals.getValue(ConfigKeys.DATE_TIME_FORMAT));

            StringBuffer sbFirst = new StringBuffer(128);
            StringBuffer sbLast = new StringBuffer(128);

            while (rs.next()) {
                Topic t = this.getBaseTopicData(rs);

                // Posted by
                User u = new User();
                u.setId(rs.getInt("user_id"));
                t.setPostedBy(u);

                // Last post by
                u = new User();
                u.setId(rs.getInt("last_user_id"));
                t.setLastPostBy(u);

                t.setHasAttach(rs.getInt("attach") > 0);
                t.setFirstPostTime(df.format(rs.getTimestamp("topic_time")));
                t.setLastPostTime(df.format(rs.getTimestamp("post_time")));
                t.setLastPostDate(new java.util.Date(rs.getTimestamp("post_time").getTime()));

                l.add(t);

                sbFirst.append(rs.getInt("user_id")).append(',');
                sbLast.append(rs.getInt("last_user_id")).append(',');
            }

            rs.close();
            rs = null;
            p.close();
            p = null;

            // Users
            if (sbFirst.length() > 0) {
                sbLast.delete(sbLast.length() - 1, sbLast.length());

                String sql = SystemGlobals.getSql("TopicModel.getUserInformation");
                sql = sql.replaceAll("#ID#", sbFirst.toString() + sbLast.toString());

                Map users = new HashMap();

                p = conn.prepareStatement(sql);
                rs = p.executeQuery();

                while (rs.next()) {
                    users.put(new Integer(rs.getInt("user_id")), rs.getString("username"));
                }

                rs.close();
                rs = null;
                p.close();
                p = null;
                for (Iterator iter = l.iterator(); iter.hasNext();) {
                    Topic t = (Topic) iter.next();
                    t.getPostedBy().setUsername((String) users.get(new Integer(t.getPostedBy().getId())));
                    t.getLastPostBy().setUsername((String) users.get(new Integer(t.getLastPostBy().getId())));
                }
            }

            return l;
        }
        catch (SQLException e) {
            throw new DatabaseException(e);
        }
        finally {
            DbUtils.close(rs, p);
        }
    }

    private Topic getBaseTopicData(ResultSet rs) throws SQLException {
        Topic t = new Topic();

        t.setTitle(rs.getString("topic_title"));
        t.setId(rs.getInt("topic_id"));
        t.setTime(new Date(rs.getTimestamp("topic_time").getTime()));
        t.setStatus(rs.getInt("topic_status"));
        t.setTotalViews(rs.getInt("topic_views"));
        t.setTotalReplies(rs.getInt("topic_replies"));
        t.setFirstPostId(rs.getInt("topic_first_post_id"));
        t.setLastPostId(rs.getInt("topic_last_post_id"));
        t.setType(rs.getInt("topic_type"));
        t.setForumId(rs.getInt("forum_id"));
        t.setModerated(rs.getInt("moderated") == 1);
        t.setVoteId(rs.getInt("topic_vote_id"));

        return t;
    }
}
