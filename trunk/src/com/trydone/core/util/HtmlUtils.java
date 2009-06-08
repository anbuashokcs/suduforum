package com.trydone.core.util;

import net.jforum.exceptions.ForumException;
import net.jforum.view.forum.common.ViewCommon;
import org.htmlparser.Node;
import org.htmlparser.lexer.Lexer;

import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

public class HtmlUtils {
    private static final String BUNDLE_NAME = "com.trydone.core.util.HtmlUtils";
  private static ResourceBundle resourceBundle = null;
 private static Pattern entityPattern = null;

    public static String getText(String html, int size) {
        if (html == null || html.trim().length() == 0) return "";
        html = new HtmlToText().getTextFromHtml(html);//textFromHTML(html);//getText(html);
        return html.substring(0, html.length() > size ? size : html.length());
    }

    public static String getText(String contents) {
        if (contents == null || contents.trim().length() == 0) {
            return contents;
        }
        try {
            StringBuffer sb = new StringBuffer(512);
            Lexer lexer = new Lexer(contents);
            Node node;
            while ((node = lexer.nextNode()) != null) {
                String ps = node.toPlainTextString();
                sb.append(ps);
            }
            contents = sb.toString();
            ViewCommon.replaceAll(contents, "<br/>", "");
            ViewCommon.replaceAll(contents, "<p/>", "");
            ViewCommon.replaceAll(contents, "<p>", "");
            ViewCommon.replaceAll(contents, "</p>", "");
            ViewCommon.replaceAll(contents, "</cite>", "");
            ViewCommon.replaceAll(contents, "<cite>", "");

        } catch (Exception e) {
            throw new ForumException("Problems while parsing HTML: " + e, e);
        }
        return contents;
    }

    public static String textFromHTML(String s) {
        if (s == null) return null;
        StringBuffer sb = new StringBuffer();
        //把空白，换行，回车，TAB去了,
        for (int i = 0; i < s.length(); i++) {
            char tmpC = s.charAt(i);
            if (tmpC != ' ' && tmpC != '\n' && tmpC != '\r' && tmpC != '\t') {
                sb.append(s.charAt(i));
            }
        }
        return convertCharacterEntities(stripHTMLTags(sb.toString()));
    }

    public static String convertCharacterEntities(String s) {
        // The resource bundle contains the mappings for symbolic entity
        // names like "amp". Note: Must protect matching and MatchResult in
        // a critical section, for thread-safety. See javadocs for
        // Perl5Util.

        synchronized (HtmlUtils.class) {
            try {
                if (entityPattern == null)
                    entityPattern = Pattern.compile("&(#?[^; \t]+);");
            }

            catch (PatternSyntaxException ex) {
                // Should not happen unless I've screwed up the pattern.
                // Throw a runtime error.

                assert (false);
            }
        }

        ResourceBundle bundle = getResourceBundle();
         //Properties bundle = HtmlUtils.class.getResourceAsStream(BUNDLE_NAME);
        StringBuffer buf = new StringBuffer();
        Matcher matcher;

        synchronized (HtmlUtils.class) {
            matcher = entityPattern.matcher(s);
        }

        for (; ;) {
            String match;
            String preMatch;
            String postMatch;

            if (!matcher.find())
                break;

            match = matcher.group(1);
            preMatch = s.substring(0, matcher.start(1) - 1);
            postMatch = s.substring(matcher.end(1) + 1);

            if (preMatch != null)
                buf.append(preMatch);

            if (match.charAt(0) == '#') {
                if (match.length() == 1)
                    buf.append('#');

                else {
                    // It might be a numeric entity code. Try to parse it
                    // as a number. If the parse fails, just put the whole
                    // string in the result, as is.

                    try {
                        int cc = Integer.parseInt(match.substring(1));

                        // It parsed. Is it a valid Unicode character?

                        if (Character.isDefined((char) cc))
                            buf.append((char) cc);
                        else {
                            buf.append("&#");
                            buf.append(match);
                            buf.append(";");
                        }
                    }

                    catch (NumberFormatException ex) {
                        buf.append("&#");
                        buf.append(match);
                        buf.append(";");
                    }
                }
            } else {
                // Not a numeric entity. Try to find a matching symbolic
                // entity.

                try {
                    String rep = bundle.getString("html_" + match);
                    buf.append(rep);
                }

                catch (MissingResourceException ex) {
                    buf.append("&");
                    buf.append(match);
                    buf.append(";");
                }
            }

            if (postMatch == null)
                break;

            s = postMatch;
            matcher.reset(s);
        }

        if (s.length() > 0)
            buf.append(s);

        return buf.toString();
    }

    public static String stripHTMLTags(String s) {
        char[] ch = s.toCharArray();
        boolean inElement = false;
        StringBuffer buf = new StringBuffer();

        for (int i = 0; i < ch.length; i++) {
            switch (ch[i]) {
                case'<':
                    inElement = true;
                    break;

                case'>':
                    if (inElement)
                        inElement = false;
                    else
                        buf.append(ch[i]);
                    break;

                default:
                    if (!inElement)
                        buf.append(ch[i]);
                    break;
            }
        }

        return buf.toString();
    }

   private static ResourceBundle getResourceBundle() {
        synchronized (HtmlUtils.class) {
            if (resourceBundle == null)
                resourceBundle = ResourceBundle.getBundle(BUNDLE_NAME);
        }

        return resourceBundle;
    }

}
