package org.project.media_comment.service;

import org.project.media_comment.domain.UserVO;

/**
 * Created by pose2 on 8/1/2017.
 */
public interface UserService {
    //    void createAccount(UserVO vo);
    public void createAccount(UserVO vo)throws Exception;
    public UserVO getUser(int user_id)throws Exception;
    public UserVO login(UserVO vo)throws Exception;

}
