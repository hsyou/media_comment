package org.project.media_comment.service;

import org.json.JSONArray;
import org.json.JSONObject;
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
        PercentMapVO vo = percentMapDAO.getPercentMapByReplyId(reply_id);
        JSONObject jsonObject=new JSONObject(vo.getMapStr());
        vo.setMap(percentMapUtil.JSONARRAYtoDoubleArray(jsonObject));
        return vo;
    }
    @Override
    public void makeNewMapConnectedWithNewComment(int replyId,PercentMapVO vo) throws Exception {
        percentMapDAO.makeNewMapConnectedWithNewComment(replyId,vo);
    }
    @Override
    public void updateANDmapOrdering(PercentMapVO vo)throws Exception{

        percentMapDAO.updateANDmapOrdering(vo);
    }



}
