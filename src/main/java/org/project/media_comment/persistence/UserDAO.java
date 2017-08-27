package org.project.media_comment.persistence;

import org.project.media_comment.domain.UserVO;
import org.project.media_comment.domain.VideoVO;

/**
 * Created by hs on 2017-07-22.
 */
public interface UserDAO {
    void createAccount(UserVO vo)throws Exception;
    UserVO getUser(int user_id)throws Exception;
    UserVO login(UserVO vo)throws Exception;
    Integer checkId(String user_email)throws Exception;

}
