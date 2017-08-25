package org.project.media_comment.service;

import org.project.media_comment.domain.UserVO;

/**
 * Created by pose2 on 8/1/2017.
 */
public interface UserService {
    //    void createAccount(UserVO vo);
    void createAccount(UserVO vo)throws Exception;
    UserVO getUser(int user_id)throws Exception;
    UserVO login(UserVO vo)throws Exception;
    Integer checkID(String user_email)throws Exception;
}
