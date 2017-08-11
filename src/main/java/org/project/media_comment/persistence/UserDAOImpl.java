package org.project.media_comment.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.UserVO;
import org.project.media_comment.domain.VideoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by hs on 2017-07-22.
 */

@Repository // DAO를 bean 으로 등록시켜주는 어노테이션 (Repository 는 DAO전용어노테이션)
public class UserDAOImpl implements UserDAO{


    @Autowired
    private SqlSession session; //마이바티스 불러오는 호출문(Autowired 가 bean에서 SqlSession이 외부 라이브러리인데, context 확인해봐라

    //mapper 네임스페이스
    private static String namespace = "org.project.media_comment.mapper.userMapper";

    @Override
    public void createAccount(UserVO vo) throws Exception {
        session.insert(namespace+".createAccount", vo);
    }

    @Override
    public UserVO getUser(int user_id) throws Exception {
        return session.selectOne(namespace+".getUser", user_id);
    }

    @Override
    public UserVO login(UserVO vo) throws Exception {
        return session.selectOne(namespace+".login",vo);
    }
}
