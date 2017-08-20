package org.project.media_comment.interceptor;

import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Created by pose2 on 2017-08-08.
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        if(session.getAttribute("login") == null){
            logger.info("current user is not logined");
            saveDest(request);
            response.sendRedirect("/user/login");

            return false;
        }
        return super.preHandle(request, response, handler);
    }

    private void saveDest(HttpServletRequest req){

        String uri = req.getRequestURI();//프로젝트와 파일경로

        String query = req.getQueryString();//모든 파라미터와 값을 가지고 옴


        //URI 뒤의 query를 설정
        if(query == null || query.equals("null")){
             query = "";
        }else {
            query = "?" + query;
        }


        //session 에 dest를 담아둠
        if(req.getMethod().equals("GET")){
            logger.info("dest: " + (uri + query));
            req.getSession().setAttribute("dest",(uri + query));
        }
    }
}
