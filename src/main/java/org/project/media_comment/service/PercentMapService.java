package org.project.media_comment.service;

import org.project.media_comment.domain.PercentMapVO;
import org.project.media_comment.domain.VideoVO;

import java.util.List;

public interface PercentMapService {
	public PercentMapVO getPercentMap(int percentMapId)throws Exception;
	public void makeNewMapConnectedWithNewComment(int replyId,PercentMapVO vo)throws Exception;
	public void updateByResampledMap(PercentMapVO vo)throws Exception;
}
