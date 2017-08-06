package org.project.media_comment.service;

import java.util.List;

import org.project.media_comment.persistence.HomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	private HomeDao homeDao;

	@Override
	public List<Object> getVideoCode() throws Exception {
//		List<Object> str = homeDao.getVideoID();
//		System.out.println("서비스쪽!!!" + str);
		return homeDao.getVideoCode();
	}
}
