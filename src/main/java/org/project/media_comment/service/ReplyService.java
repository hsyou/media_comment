package org.project.media_comment.service;

import org.project.media_comment.domain.ReplyVO;
import org.project.media_comment.domain.ReplyVoteVO;

import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */
public interface ReplyService {

    public List<ReplyVO> listAllReply(int video_id,int user_id)throws Exception;
    public void insertReply(ReplyVO vo)throws Exception;
    public int voteReply(ReplyVoteVO vo)throws Exception;
    public List<ReplyVO> listBestReply(int video_id)throws Exception;

}
