package com.trydone.forum.sso;

import net.jforum.JForumExecutionContext;
import net.jforum.context.RequestContext;
import net.jforum.entities.UserSession;
import net.jforum.sso.SSO;
import net.jforum.util.preferences.ConfigKeys;
import net.jforum.util.preferences.SystemGlobals;
import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import javax.servlet.http.Cookie;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

/**
 * 一个简单的SSO实例
 */
public class SimpleSSOImpl implements SSO {                              // 必须实现接口 net.jforum.sso.SSO

    static final Logger logger = Logger.getLogger(SimpleSSOImpl.class.getName()); // 初始化日志接口

    public String authenticateUser(RequestContext request) {
        //这里是处理你的程序,取得你的系统中已经登陆的用户名,如果没有登陆就返回null 有登陆返回你的程序中已经登陆的用户名

        return getMyApplicationUserid(request);
    }

    public boolean isSessionValid(UserSession userSession, RequestContext request) {// 实现接口方法(必须)

        //重新读取程序中的用户状态
        String remoteUser = getMyApplicationUserid(request);

        // 用户已经退出
        if (remoteUser == null &&
                userSession.getUserId() != SystemGlobals.getIntValue(ConfigKeys.ANONYMOUS_USER_ID)) {
            return false;

            // 用户已经登陆

        } else if (remoteUser != null &&
                userSession.getUserId() == SystemGlobals.getIntValue(ConfigKeys.ANONYMOUS_USER_ID)) {
            return false;

            // user has changed user
        } else if (remoteUser != null && !remoteUser.equals(userSession.getUsername())) {
            return false;
        }
        return true; // myapp user and forum user the same                       
    }

    /**
     * 这里是处理你的程序
     * 取得你的系统中已经登陆的用户名
     * 1)如果没有登陆就返回null
     * 2)有登陆返回你的程序中已经登陆的用户名
     * 这里采用jdom取远程你的程序的一个XML结果进行验证
     * XML的格式为:
     * <?xml version=\"1.0\" encoding=\"UTF-8\" ?>
     * <user>
     * <name>pinke</name>        <!-- 用户名 -->
     * <isLogin>false</isLogin>  <!-- true 为已经登 false为末登 -->
     * </user>
     *
     * @param request RequestContext
     * @return String
     */
    public String getMyApplicationUserid(RequestContext request) {

        String myapp_userid;
        //取程序上登陆过的用户名,我们程序存放用户名的cookie名称为"my_application_cookie_name"
        Cookie mycookie = net.jforum.ControllerUtils.getCookie("5isudu_cookie_name");

        //mycookie=null时说明没有事先在应用程序中登陆过(这里假设应该程序登陆后把登陆名存入cookie中)
        //注意应该程序cookie的path必须设置为/,或在同域名下可以设置为域名，否则取不到cookie
        if (mycookie == null || mycookie.getValue() == null || mycookie.getValue().length() == 0) {
        	//JForumExecutionContext.setRedirect(SystemGlobals.getValue(ConfigKeys.SSO_REDIRECT));//Vincent:add, need login
            return null;
        }
        myapp_userid = mycookie.getValue();
        try {
			myapp_userid = URLDecoder.decode(myapp_userid,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return myapp_userid; //Vincent:modify, username在cookie中，就直接login；

        /*
        String remoteURL;
        //这个URL指向验证程序,其返回的内容格式为XML格式如上所说
        //具体validate.jsp如果写,得根据你的应用程序进行处理
        remoteURL = "http://10.224.172.240:8080/sudusoft/user/user!sso.action?username=" + myapp_userid;
        try {
            Document doc = new SAXBuilder().build(new URL(remoteURL));
            Element el = doc.detachRootElement();
            List list;
            list = el.getChildren("isLogin");
            Element element;

            element = (Element) list.get(0);
            if (element.getValue().equals("true")) {
                list = el.getChildren("name");
                element = (Element) list.get(0);
                return element.getValue();
            }
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //如果你的论坛必须要用户登后才行的话加上这行
        JForumExecutionContext.setRedirect(SystemGlobals.getValue(ConfigKeys.SSO_REDIRECT));
        return null;
        */
    }
}