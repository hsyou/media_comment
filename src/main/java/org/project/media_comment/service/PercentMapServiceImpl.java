package org.project.media_comment.service;

import org.project.media_comment.domain.PercentMapVO;
import org.project.media_comment.persistence.PercentMapDAO;
import org.project.media_comment.util.PercentMapUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PercentMapServiceImpl implements PercentMapService{

    @Autowired
    private PercentMapDAO percentMapDAO;

    @Autowired
    private PercentMapUtil percentMapUtil;

    @Override
    public PercentMapVO getPercentMap(int percentMapId) throws Exception {
        return percentMapDAO.getPercentMap(percentMapId);
    }

    @Override
    public PercentMapVO getPercentMapByReplyId(int reply_id) throws Exception {
        return percentMapDAO.getPercentMapByReplyId(reply_id);
    }

    @Override
    public void makeNewMapConnectedWithNewComment(int replyId,PercentMapVO vo) throws Exception {
        percentMapDAO.makeNewMapConnectedWithNewComment(replyId,vo);
    }
    @Override
    public void updateByResampledMap(PercentMapVO vo)throws Exception{

        int[] dummy = new int[4];

        percentMapUtil.mapRefreshByNewPoint(dummy,vo);

        percentMapDAO.updateByResampledMap(vo);
    }



}
