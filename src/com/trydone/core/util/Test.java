package com.trydone.core.util;

import java.io.FileNotFoundException;

public class Test {
    public static void main(String[] args) throws FileNotFoundException {
        String test = "<html></aaa><abc><div/><p/><p><a href=sss>dfsasdf</a></htML>";
        long tmp;
        tmp = System.currentTimeMillis();
        System.out.println(HtmlUtils.getText(test, Integer.MAX_VALUE));
        System.out.println(System.currentTimeMillis() - tmp);
        tmp = System.currentTimeMillis();
        System.out.println(HtmlUtils.textFromHTML(test));
        System.out.println(System.currentTimeMillis() - tmp);
        tmp = System.currentTimeMillis();
        System.out.println(HtmlUtils.getText(test));
        System.out.println(System.currentTimeMillis() - tmp);              
    }
}
