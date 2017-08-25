package org.project.media_comment.persistence;

import org.project.media_comment.domain.HashtagVO;

import java.util.List;
public interface HashtagDao {
	public List<HashtagVO> listHashtag(int video_id) throws Exception;
	public void insertHashtag(HashtagVO vo)throws Exception;
}
