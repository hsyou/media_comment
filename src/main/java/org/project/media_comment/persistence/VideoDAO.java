package org.project.media_comment.persistence;

import org.project.media_comment.domain.VideoCountVO;
import org.project.media_comment.domain.VideoUserVO;
import org.project.media_comment.domain.VideoVoteVO;
import org.project.media_comment.domain.VideoVO;

import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */
public interface VideoDAO {
    public int uploadVideo(VideoVO vo)throws Exception;
    public VideoVO getVideo(int video_id)throws Exception;
    public VideoVO getVideoLogin(VideoUserVO vo)throws Exception;
    public List<VideoVO> listAllVideo()throws Exception;
    public void increaseHit(int video_id)throws Exception;
    public Integer selectVideoVote(VideoVoteVO vo)throws Exception;
    public void voteVideo(VideoVoteVO vo)throws Exception;
    public void updateVideoVote(int Video_vote_flag)throws Exception;
    public void updateVideoCount(VideoCountVO vo)throws Exception;
}
