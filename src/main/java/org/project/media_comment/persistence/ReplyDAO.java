package org.project.media_comment.persistence;

import org.project.media_comment.domain.ReplyVO;
import org.project.media_comment.domain.VideoVO;

import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */
public interface ReplyDAO {

    public List<ReplyVO> listAllReply(int video_id)throws Exception;
    public void insertReply(ReplyVO vo)throws Exception;

}
