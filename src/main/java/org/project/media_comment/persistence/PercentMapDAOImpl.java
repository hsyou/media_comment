package org.project.media_comment.persistence;


import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.PercentMapVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by pose2 on 2017-09-02.
 */
@Repository
public class PercentMapDAOImpl implements PercentMapDAO{

    @Autowired
    private SqlSession sqlSession; //마이바티스 불러오는 호출문(Autowired 가 bean에서 SqlSession이 외부 라이브러리인데, context 확인해봐라

    //mapper 네임스페이스
    private static String namespace = "org.project.media_comment.mapper.percentmapMapper";

    @Override
    public PercentMapVO getPercentMap(int percentMapId) throws Exception {
        return sqlSession.selectOne(namespace+".getPercentMap", percentMapId);
    }

    @Override
    public PercentMapVO getPercentMapByReplyId(int reply_id) throws Exception {
        return sqlSession.selectOne(namespace+".getPercentMapByReplyId" , reply_id);
    }

    @Override
    public void makeNewMapConnectedWithNewComment(int replyId,PercentMapVO vo) throws Exception {
        sqlSession.insert(namespace+".makeNewMapConnectedWithNewComment",vo);
    }
    @Override
    public void updateByResampledMap(PercentMapVO vo)throws Exception{
        sqlSession.update(namespace+".updateByResampledMap", vo);
    }
    @Override
    public void insertDefaultMap(PercentMapVO vo) throws Exception {
        sqlSession.insert(namespace+".insertDefaultMap",vo);
    }
}
