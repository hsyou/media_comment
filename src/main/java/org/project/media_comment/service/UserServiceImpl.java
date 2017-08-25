package org.project.media_comment.service;

import org.project.media_comment.domain.UserVO;
import org.project.media_comment.persistence.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by pose2 on 8/1/2017.
 */
@Service // 빈(bean 이거 스프링 프레임웍 용어임)으로 등록해주는 어노테이션(Service는 서비스전용 어노테이션)
public class UserServiceImpl implements UserService{

    @Autowired // 외부에서 class 객체 생성해서 자동으로 인젝션 해준다.
    private UserDAO userDAO;

    @Override
    public void createAccount(UserVO vo) throws Exception {
        userDAO.createAccount(vo);
    }

    @Override
    public UserVO login(UserVO vo) throws Exception {

        return userDAO.login(vo);
    }

    @Override
    public UserVO getUser(int user_id) throws Exception {
        return userDAO.getUser(user_id);
    }

    @Override
    public Integer checkID(String user_email) throws Exception {
        return userDAO.checkID(user_email);
    }
}
