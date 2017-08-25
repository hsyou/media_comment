package org.project.media_comment.service;

import org.project.media_comment.domain.HashtagVO;
import org.project.media_comment.persistence.HashtagDao;
import org.project.media_comment.persistence.HomeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HashtagServiceImpl implements HashtagService {
	@Autowired
	private HashtagDao hashtagDao;

	@Override
	public List<HashtagVO> listHashtag(int video_id) throws Exception {
		return hashtagDao.listHashtag(video_id);
	}

	@Override
	public void insertHashtag(HashtagVO vo) throws Exception {

		String hashtag=vo.getHashtag();
		hashtag=hashtag.replaceAll("\\p{Z}", "");
		String[] hashtags=hashtag.split("#");

		for(String a:hashtags){
			if(a.equals(""))continue;
			hashtagDao.insertHashtag(new HashtagVO(vo.getVideo_id(),a));
		}

	}
}
