package org.project.media_comment.persistence;

import org.project.media_comment.domain.*;

import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */
public interface ReplyDAO {

    public List<ReplyVO> listAllReply(int video_id)throws Exception;
    public List<ReplyVO> listAllReplyLogin(VideoUserVO vo)throws Exception;
    public int insertReply(ReplyVO vo)throws Exception;
    public Integer selectReplyVote(ReplyVoteVO vo)throws Exception;
    public void voteReply(ReplyVoteVO vo)throws Exception;
    public void updateReplyVote(ReplyVoteVO vo)throws Exception;
    public void updateReplyCount(ReplyCountVO vo)throws Exception;
    public List<ReplyVO> listBestReply(int video_id)throws Exception;
    public void updateReplyPos(ReplyPosVO vo)throws Exception;
}
