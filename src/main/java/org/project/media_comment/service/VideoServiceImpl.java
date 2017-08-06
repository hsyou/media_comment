package org.project.media_comment.service;

import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.persistence.VideoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by hs on 2017-07-22.
 */
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoDAO videoDAO;

    @Override
    public void uploadVideo(VideoVO vo) throws Exception {

        videoDAO.uploadVideo(vo);

    }

    @Override
    public VideoVO getVideo(int video_id) throws Exception {
//        return videoDAO.getVideo(video_id);
    	System.out.println(videoDAO.getVideo(video_id));
    	
    	return videoDAO.getVideo(video_id);
    	
    }
}
