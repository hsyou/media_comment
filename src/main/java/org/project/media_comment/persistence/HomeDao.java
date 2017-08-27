package org.project.media_comment.persistence;

import org.project.media_comment.domain.VideoVO;

import java.util.List;

public interface HomeDao {
	public List<VideoVO> listAllVideo() throws Exception;
}
