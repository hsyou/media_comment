package org.project.media_comment.persistence;

import org.project.media_comment.domain.VideoVO;

/**
 * Created by hs on 2017-07-22.
 */
public interface VideoDAO {
    public void uploadVideo(VideoVO vo)throws Exception;
    public VideoVO getVideo(int video_id)throws Exception;

}
