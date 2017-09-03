package org.project.media_comment.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.project.media_comment.domain.VideoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDaoImpl implements HomeDao {
	@Autowired
	private SqlSession session;
	
	// mapper 네임스페이스
	private static String namespace = "org.project.media_comment.mapper.homeMapper";

	@Override
	public List<VideoVO> listAllVideo() throws Exception {
		return session.selectList(namespace + ".listAllVideo");
	}

	@Override
	public List<VideoVO> listHotVideo() throws Exception {
		return session.selectList(namespace+".listHotVideo");
	}

	@Override
	public List<VideoVO> listVideoByCondition(String condition) throws Exception {
		Map<String, String> parameters = new HashMap<String, String>();

		parameters.put("condition", condition);
		return session.selectList(namespace+".listVideoByCondition",parameters);
	}
}
