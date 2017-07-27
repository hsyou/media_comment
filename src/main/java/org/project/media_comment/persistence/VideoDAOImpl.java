package org.project.media_comment.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.VideoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

/**
 * Created by hs on 2017-07-22.
 */

@Repository
public class VideoDAOImpl implements VideoDAO{


    @Autowired
    private SqlSession session;

    //mapper 네임스페이스
    private static String namespace = "org.project.media_comment.mapper.videoMapper";

    @Override
    public void uploadVideo(VideoVO vo) throws Exception {
        session.insert(namespace+".uploadVideo",vo);
        //결과적으로 org.project.media_comment.mapper.videoMapper의 uploadVideo를 실행.
    }

    @Override
    public VideoVO getVideo(int video_id) throws Exception {
        return session.selectOne(namespace+".getVideo",video_id);
    }
}
