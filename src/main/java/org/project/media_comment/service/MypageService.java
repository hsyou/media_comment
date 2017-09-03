package org.project.media_comment.service;

import java.util.List;

import org.project.media_comment.domain.MypageVO;

public interface MypageService {

    public void addActivity(MypageVO vo)throws Exception;
    public List getRecentActivity(int user_id)throws Exception;

}
