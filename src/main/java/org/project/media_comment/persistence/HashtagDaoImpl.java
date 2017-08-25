package org.project.media_comment.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.HashtagVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HashtagDaoImpl implements HashtagDao {
	@Autowired
	private SqlSession session;
	
	// mapper 네임스페이스
	private static String namespace = "org.project.media_comment.mapper.hashtagMapper";

	@Override
	public List<HashtagVO> listHashtag(int video_id) throws Exception {
		return session.selectList(namespace+".listHashtag",video_id);
	}

	@Override
	public void insertHashtag(HashtagVO vo) throws Exception {
		session.insert(namespace+".insertHashtag",vo);

	}
}
