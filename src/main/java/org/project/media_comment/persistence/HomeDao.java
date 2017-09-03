package org.project.media_comment.persistence;

import org.project.media_comment.domain.VideoVO;

import java.util.List;

public interface HomeDao {
	public List<VideoVO> listAllVideo() throws Exception;
	public List<VideoVO> listHotVideo() throws Exception;
	public List<VideoVO> listVideoByCondition(String condition) throws Exception;
}
