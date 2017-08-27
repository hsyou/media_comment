package org.project.media_comment.service;

import org.project.media_comment.domain.VideoVO;

import java.util.List;

public interface HomeService {
	public List<VideoVO> listAllVideo() throws Exception;
}
