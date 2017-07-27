package org.project.media_comment.service;

import org.project.media_comment.domain.VideoVO;

/**
 * Created by hs on 2017-07-22.
 */
public interface VideoService {

    public void uploadVideo(VideoVO vo)throws Exception;
    public VideoVO getVideo(int video_id)throws Exception;


}
