package org.project.media_comment.persistence;

import org.project.media_comment.domain.UserVO;
import org.project.media_comment.domain.VideoVO;

/**
 * Created by hs on 2017-07-22.
 */
public interface UserDAO {
    public void createAccount(UserVO vo)throws Exception;
    public UserVO getUser(int user_id)throws Exception;
    public UserVO login(UserVO vo)throws Exception;

}
