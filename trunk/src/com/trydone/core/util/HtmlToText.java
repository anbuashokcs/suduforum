package com.trydone.core.util;

import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.parser.ParserDelegator;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

/**
 * ȥHTMLΪText
 */
public class HtmlToText {
    public String getTextFromHtml(String htmlStr) {
        StringBuffer txtBuf = new StringBuffer();
        if (htmlStr == null || htmlStr.length() == 0) return null;
        try {
            Reader r = new StringReader(htmlStr);
            ParserDelegator parser = new ParserDelegator();
            HtmlParserCallback callback = new HtmlParserCallback();
            parser.parse(r, callback, true);
            txtBuf = callback.getTxtBuf();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return txtBuf.toString();
    }
}
class HtmlParserCallback extends HTMLEditorKit.ParserCallback {
    private StringBuffer txtBuf;

    public HtmlParserCallback() {
        this.txtBuf = new StringBuffer();
    }

    public StringBuffer getTxtBuf() {
        return txtBuf;
    }

    public void setTxtBuf(StringBuffer txtBuf) {
        this.txtBuf = txtBuf;
    }

    public void handleText(char[] data, int pos) {
        txtBuf.append(new String(data));
    }

}