package org.project.media_comment.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.ReplyCountVO;
import org.project.media_comment.domain.ReplyVO;
import org.project.media_comment.domain.ReplyVoteVO;
import org.project.media_comment.domain.VideoUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */

@Repository
public class ReplyDAOImpl implements ReplyDAO {


    @Autowired
    private SqlSession session;

    //mapper 네임스페이스
    private static String namespace = "org.project.media_comment.mapper.replyMapper";

    @Override
    public List<ReplyVO> listAllReply(int video_id) throws Exception {
        return session.selectList(namespace+".listAllReply",video_id);
    }

    @Override
    public List<ReplyVO> listAllReplyLogin(VideoUserVO vo) throws Exception {
        return session.selectList(namespace+".listAllReplyLogin",vo);
    }

    @Override
    public int insertReply(ReplyVO vo) throws Exception {
        session.insert(namespace+".insertReply",vo);
        return vo.getReply_id();
    }

    @Override
    public Integer selectReplyVote(ReplyVoteVO vo) throws Exception {
        return session.selectOne(namespace+".selectReplyVote",vo);
    }

    @Override
    public void voteReply(ReplyVoteVO vo) throws Exception {
        session.insert(namespace+".voteReply",vo);
    }

    @Override
    public void updateReplyVote(ReplyVoteVO vo) throws Exception {
        session.update(namespace+".updateReplyVote",vo);
    }

    @Override
    public void updateReplyCount(ReplyCountVO vo) throws Exception {
        session.update(namespace+".updateReplyCount",vo);
    }

    @Override
    public List<ReplyVO> listBestReply(int video_id) throws Exception {
        return session.selectList(namespace+".listBestReply",video_id);
    }
}
