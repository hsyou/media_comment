package org.project.media_comment.service;

import java.util.List;

import org.project.media_comment.domain.MyInfoVO;
import org.project.media_comment.domain.MypageVO;
import org.project.media_comment.domain.VideoVO;

public interface MypageService {

    public void addActivity(MypageVO vo)throws Exception;
    public List getRecentActivity(int user_id)throws Exception;
    public List<VideoVO> getMypost(int user_id) throws Exception;
    public List<VideoVO> getMyfavorite(int user_id) throws Exception;

    public MyInfoVO getMyInfo(int user_id) throws Exception;
    public List getMyHashtag(int user_id) throws Exception;
}