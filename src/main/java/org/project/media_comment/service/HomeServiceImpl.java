package org.project.media_comment.service;

import java.util.List;

import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.persistence.HomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	private HomeDao homeDao;

	@Override
	public List<VideoVO> listAllVideo() throws Exception {
//		List<Object> str = homeDao.getVideoID();
//		System.out.println("서비스쪽!!!" + str);
		return homeDao.listAllVideo();
	}

	@Override
	public List<VideoVO> listHotVideo() throws Exception {
		return homeDao.listHotVideo();
	}

	@Override
	public List<VideoVO> listVideoByCondition(String condition) throws Exception {
		return homeDao.listVideoByCondition(condition);
	}
}
