package org.project.media_comment.service;

import org.project.media_comment.domain.HashtagVO;

import java.util.List;

public interface HashtagService {
	public List<HashtagVO> listHashtag(int video_id) throws Exception;
	public void insertHashtag(HashtagVO vo)throws Exception;
}
