package com.subway.utils;


import com.subway.domain.user.User;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by HUANGBIN on 2016/2/18 0018.
 * 获取当前的session
 */
@Slf4j
public class SessionUtil {
    /**
     * 获取当前上下文路径
     */
    public static String getContextPath(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ServletContext application = session.getServletContext();
        String serverRealPath = application.getRealPath("/");
        return serverRealPath;
    }


    public static String getAbsolutePath(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ServletContext application = session.getServletContext();
        String serverRealPath = application.getRealPath("/");
        return serverRealPath;
    }

    /**
     * 获取当前用户信息
     */
    public static User getCurrentUserBySession(HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        log.info("currentUser--------------" + user.getUserName());
        return user;
    }

}
