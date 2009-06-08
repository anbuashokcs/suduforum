package com.trydone.forum.action;

import net.jforum.JForumExecutionContext;
import net.jforum.entities.Attachment;
import net.jforum.entities.Post;
import net.jforum.util.preferences.ConfigKeys;
import net.jforum.util.preferences.SystemGlobals;
import net.jforum.view.forum.common.AttachmentCommon;

import java.util.List;


public class PostParser {

    private static final String REGEX = "(?s)\\[attachment=(.*?)\\](.*?)\\[/attachment\\]";

    public static void parse(Post post) {
        try {
            //在预览时,没有附件，没有Request对像
            if (JForumExecutionContext.getRequest() == null) return;
        } catch (Exception e) {
            return;
        }

        //中用于trydone模板
        if (!SystemGlobals.getValue(ConfigKeys.TEMPLATE_DIR).equalsIgnoreCase("trydone")) return;

        String filepath;
        String text;
        String regStr;
        String replaceStr;
        AttachmentCommon attachmentCommon;
        List attachs;

        text = post.getText();

        attachmentCommon = new AttachmentCommon(JForumExecutionContext.getRequest(), post.getForumId());

        attachs = attachmentCommon.getAttachments(post.getId(), post.getForumId());

        for (int i = 0; i < attachs.size(); i++) {
            Attachment att = (Attachment) attachs.get(i);
            //replace image
 
            filepath = JForumExecutionContext
                    .getForumContext()
                    .encodeURL("/posts/downloadAttach/" + att.getId());

            regStr = "(?s)\\[attachment=img\\]"
                    + toRegex(att.getInfo().getRealFilename())
                    + "\\[/attachment\\]";

            replaceStr = "<img src=\""
                    + filepath
                    + "?include=true"
                    + "\" onload=\"if(_trydone_AutoResizeImage!=undefined){_trydone_AutoResizeImage(this);}\"/>";

            text = text.replaceAll(regStr, replaceStr);

            //replace file
            //  filepath = SystemGlobals.getValue(ConfigKeys.FORUM_LINK)
            // + SystemGlobals.getValue(ConfigKeys.ATTACHMENTS_UPLOAD_DIR)
            // + "/"
            // + att.getInfo().getPhysicalFilename();

            regStr = "(?s)\\[attachment=file\\]"
                    + toRegex(att.getInfo().getRealFilename())
                    + "\\[/attachment\\]";

            replaceStr = "<a href=\""
                    + filepath
                    + "\" target=_blank>"
                    + toRegex(att.getInfo().getRealFilename())
                    + "</a>";

            text = text.replaceAll(regStr, replaceStr);

            //replace as url [attchment=url]filename.gif[/attachment]
            regStr = "(?s)\\[attachment=url\\]"
                    + toRegex(att.getInfo().getRealFilename())
                    + "\\[/attachment\\]";

            replaceStr = filepath + "?include=true";
            text = text.replaceAll(regStr, replaceStr);
        }
        //delete not exist files
        replaceStr = "<i><strike style=\"color:silver;\" title=\"disallow or not exist\">$2</strike></i>";
        text = text.replaceAll(REGEX, replaceStr);
        post.setText(text);
    }

    private static String toRegex(String filename) {
        //([{\^-$|]})?*+.
        filename = filename.replaceAll("\\\\", "\\\\\\\\");
        filename = filename.replaceAll("\\^", "\\\\^");
        filename = filename.replaceAll("\\.", "\\\\.");
        filename = filename.replaceAll("\\{", "\\\\{");
        filename = filename.replaceAll("\\*", "\\\\*");
        filename = filename.replaceAll("\\}", "\\\\}");
        filename = filename.replaceAll("\\?", "\\\\?");
        filename = filename.replaceAll("\\+", "\\\\+");
        filename = filename.replaceAll("\\$", "\\\\\\$");
        filename = filename.replaceAll("\\(", "\\\\(");
        filename = filename.replaceAll("\\)", "\\\\)");
        filename = filename.replaceAll("\\[", "\\\\[");
        filename = filename.replaceAll("\\!", "\\\\!");
        filename = filename.replaceAll("\\-", "\\\\-");
        filename = filename.replaceAll("\\]", "\\\\]");
        filename = filename.replaceAll("\\|", "\\\\|");

        return filename;
    }

    public static void main(String[] args) {
        String mystr = "([{\\^-$|]})?*+.";
        System.out.println(mystr);
        System.out.println(toRegex(mystr));
    }
}
