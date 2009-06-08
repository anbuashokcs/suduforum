package com.trydone.forum.action;

import com.trydone.core.io.BufferedRandomAccessFile;
import net.jforum.JForumExecutionContext;
import net.jforum.context.RequestContext;
import net.jforum.context.ResponseContext;
import net.jforum.dao.AttachmentDAO;
import net.jforum.entities.Attachment;
import net.jforum.util.preferences.ConfigKeys;
import net.jforum.util.preferences.SystemGlobals;
import net.jforum.view.forum.common.ViewCommon;

import java.io.IOException;
import java.io.OutputStream;

public class AttachmentAction {
    /**
     * 下载附件,支持断点续载
     *
     * @param am
     * @param attach net.jforum.entities.Attachment @throws IOException java.io.IOException
     */
    public static void downloadAttachment(AttachmentDAO am, Attachment attach) throws IOException {

        String filePath = SystemGlobals.getValue(ConfigKeys.ATTACHMENTS_STORE_DIR)
                + "/"
                + attach.getInfo().getPhysicalFilename();

        RequestContext request = JForumExecutionContext.getRequest();
        ResponseContext response = JForumExecutionContext.getResponse();
        BufferedRandomAccessFile raf = new BufferedRandomAccessFile(filePath, "r");
        java.io.FileInputStream fis = new java.io.FileInputStream(raf.getFD());
        //        response.reset();
        response.setHeader("Server", "www.trydone.com");
        //Accept-Ranges: bytes
        response.setHeader("Accept-Ranges", "bytes");

        long pos = 0;
        long len;
        len = raf.length();

        //HTTP/1.1 200 OK
        if (request.getHeader("Range") != null)         //客户端请求的下载的文件块的开始字节
        {
            //HTTP/1.1 206 Partial Content
            response.sendError(javax.servlet.http.HttpServletResponse.SC_PARTIAL_CONTENT);//.setStatus(javax.servlet.http.HttpServletResponse.SC_PARTIAL_CONTENT);        //206
            //response.sendError(206,"Partial Content");

            //Range: bytes=[文件块的开始字节]-
            pos = Long.parseLong(request.getHeader("Range").replaceAll("bytes=", "").replaceAll("-", ""));
        }

        //Content-Length: [文件的总大小] - [客户端请求的下载的文件块的开始字节]
        response.setHeader("Content-Length", Long.toString(len - pos));

        if (pos != 0) {
            //不是从最开始下载,
            //响应的格式是:
            //Content-Range: bytes [文件块的开始字节]-[文件的总大小 - 1]/[文件的总大小]
            response.setHeader("Content-Range", "bytes " + Long.toString(pos) + "-" + Long.toString(len - 1) + "/" + Long.toString(len));
        }

        //response.setHeader("Connection", "Close");         //如果有此句话不能用 IE 直接下载

        //使客户端直接下载
        //响应的格式是:
        //Content-Type: application/octet-stream
        response.setContentType("application/octet-stream");

        //为客户端下载指定默认的下载文件名称
        //响应的格式是:
        //Content-Disposition: attachment;filename="[文件名]"
        //response.setHeader("Content-Disposition", "attachment;filename=\"" + filePath.substring(filePath.lastIndexOf("\\") + 1) + "\"");         //经测试 RandomAccessFile 也可以实现,有兴趣可将注释去掉,并注释掉 FileInputStream 版本的语句
        if (am.isPhysicalDownloadMode(attach.getInfo().getExtension().getExtensionGroupId())) {
            response.setContentType("application/octet-stream");
        } else {
            response.setContentType(attach.getInfo().getMimetype());
        }

        if (request.getHeader("User-Agent").indexOf("Firefox") != -1) {
            response.setHeader("Content-Disposition", "attachment; filename=\""
                    + new String(attach.getInfo().getRealFilename().getBytes(SystemGlobals.getValue(ConfigKeys.ENCODING)),
                    SystemGlobals.getValue(ConfigKeys.DEFAULT_CONTAINER_ENCODING)) + "\";");
        } else {
            response.setHeader("Content-Disposition", "attachment; filename=\""
                    + ViewCommon.toUtf8String(attach.getInfo().getRealFilename()) + "\";");
        }

        raf.seek(pos);
        byte[] b = new byte[1024];
        int i;

        OutputStream out = response.getOutputStream();
        while ((i = raf.read(b)) != -1) {
            out.write(b, 0, i);
        }
        raf.close();
        fis.close();
    }
}
