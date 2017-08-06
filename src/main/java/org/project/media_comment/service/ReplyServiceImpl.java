package org.project.media_comment.service;

import org.project.media_comment.domain.ReplyVO;
import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.persistence.ReplyDAO;
import org.project.media_comment.persistence.VideoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */
@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyDAO replyDAO;

    @Override
    public List<ReplyVO> listAllReply(int video_id) throws Exception {
        return replyDAO.listAllReply(video_id);
    }

    @Override
    public void insertReply(ReplyVO vo) throws Exception {
        replyDAO.insertReply(vo);
    }
}
