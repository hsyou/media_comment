package org.project.media_comment.interceptor;

import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by pose2 on 2017-08-08.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static final String LOGIN = "login";
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        HttpSession session = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object userVO = modelMap.get("userVO");

        if(userVO != null){
            logger.info("new login success");
            session.setAttribute(LOGIN,userVO);
//            response.sendRedirect("/");
            Object dest = session.getAttribute("dest");

            response.sendRedirect(dest != null ? (String)dest : "/");
        }

        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.print(request.getParameter("user_id"));
        HttpSession session = request.getSession();

        if(session.getAttribute(LOGIN) != null){
            logger.info("clear login data before");
            session.removeAttribute(LOGIN);
        }
//            response.sendRedirect("/user/login");


        return super.preHandle(request, response, handler);
    }
}
