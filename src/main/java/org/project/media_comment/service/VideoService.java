package org.project.media_comment.service;

import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.domain.VideoVoteVO;

import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */
public interface VideoService {

    public void uploadVideo(VideoVO vo)throws Exception;
    public VideoVO getVideo(int video_id,int user_id)throws Exception;
    public List<VideoVO> listAllVideo()throws Exception;
    public int voteVideo(VideoVoteVO vo)throws Exception;

}
