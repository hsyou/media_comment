package org.project.media_comment.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.MypageVO;
import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.persistence.MypageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService{


    @Autowired
    private MypageDAO mypageDAO;

    @Override
    public void addActivity(MypageVO vo) throws Exception {
    	
    	mypageDAO.addActivity(vo);
    }

    @Override
    public List<MypageVO> getRecentActivity(int user_id) throws Exception {
        return mypageDAO.getRecentActivity(user_id);
    }

    @Override
    public List<VideoVO> getMypost(int user_id) throws Exception {
        return mypageDAO.getMypost(user_id);
    }

    @Override
    public List<VideoVO> getMyfavorite(int user_id) throws Exception {
        return mypageDAO.getMyfavorite(user_id);
    }



}
