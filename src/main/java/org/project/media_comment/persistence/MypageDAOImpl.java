package org.project.media_comment.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.MyInfoVO;
import org.project.media_comment.domain.MypageVO;
import org.project.media_comment.domain.VideoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

/**
 * Created by hs on 2017-07-22.
 */

@Repository
public class MypageDAOImpl implements MypageDAO {

    @Autowired
    private SqlSession session;

    //mapper �꽕�엫�뒪�럹�씠�뒪
    private static String namespace = "org.project.media_comment.mapper.mypageMapper";

    @Override
    public void addActivity(MypageVO vo) throws Exception {
        session.insert(namespace + ".addActivity", vo);
        //寃곌낵�쟻�쑝濡� org.project.media_comment.mapper.videoMapper�쓽 uploadVideo瑜� �떎�뻾.
    }

    @Override
    public List<MypageVO> getRecentActivity(int user_id) throws Exception {
        return session.selectList(namespace + ".getRecentActivity", user_id);
    }

    @Override
    public List<VideoVO> getMypost(int user_id) throws Exception {
        return session.selectList(namespace+".getMypost",user_id);
    }
    @Override
    public List<VideoVO> getMyfavorite(int user_id) throws Exception {
        return session.selectList(namespace+".getMyfavorite",user_id);
    }

    @Override
    public MyInfoVO getMyInfo(int user_id) throws Exception{
        return session.selectOne(namespace+".getMyInfo",user_id);
    }

    @Override
    public List getMyHashtag(int user_id) throws Exception{
        return session.selectList(namespace+".getMyHashtag",user_id);
    }
}