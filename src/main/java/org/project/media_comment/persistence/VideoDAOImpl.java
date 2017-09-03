package org.project.media_comment.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.VideoCountVO;
import org.project.media_comment.domain.VideoUserVO;
import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.domain.VideoVoteVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */

@Repository
public class VideoDAOImpl implements VideoDAO {


    @Autowired
    private SqlSession session;

    //mapper 네임스페이스
    private static String namespace = "org.project.media_comment.mapper.videoMapper";

    @Override
    public int uploadVideo(VideoVO vo) throws Exception {

        session.insert(namespace+".uploadVideo",vo);
        return vo.getVideo_id(); //return auto generated key
        //결과적으로 org.project.media_comment.mapper.videoMapper의 uploadVideo를 실행.
    }

    @Override
    public VideoVO getVideo(int video_id) throws Exception {
        return session.selectOne(namespace+".getVideo",video_id);
    }

    @Override
    public VideoVO getVideoLogin(VideoUserVO vo) throws Exception {
        return session.selectOne(namespace+".getVideoLogin",vo);
    }

    @Override
    public void increaseHit(int video_id) throws Exception {
        session.update(namespace+".increaseHit",video_id);
    }

    @Override
    public Integer selectVideoVote(VideoVoteVO vo) throws Exception {
        return session.selectOne(namespace+".selectVideoVote",vo);
    }

    @Override
    public void voteVideo(VideoVoteVO vo) throws Exception {
        session.insert(namespace+".voteVideo",vo);
    }

    @Override
    public void updateVideoVote(int video_vote_flag) throws Exception {
        session.update(namespace+".updateVideoVote",video_vote_flag);
    }

    @Override
    public void updateVideoCount(VideoCountVO vo) throws Exception {
        session.update(namespace+".updateVideoCount",vo);
    }

    @Override
    public void insertViewLog(VideoUserVO vo) throws Exception {
        session.insert(namespace+".insertViewLog",vo);
    }

}
