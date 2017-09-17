package org.project.media_comment.controller;

import org.json.simple.parser.JSONParser;
import org.project.media_comment.domain.PercentMapVO;
import org.project.media_comment.domain.ReplyPosVO;
import org.project.media_comment.service.PercentMapService;
import org.project.media_comment.service.ReplyService;
import org.project.media_comment.util.PercentMapUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by pose2 on 2017-09-10.
 */
@Controller
public class PercentMapController {

    private static final Logger logger = LoggerFactory.getLogger(PercentMapController.class);

    @Autowired
    private PercentMapService percentMapService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private PercentMapUtil util;
    @RequestMapping(value = "/setPos", method = RequestMethod.GET)
    @ResponseBody
    public void test(@RequestParam("reply_id")int reply_id,@RequestParam("old_x")int old_x,@RequestParam("old_y")int old_y,@RequestParam("new_x")int new_x,@RequestParam("new_y")int new_y) {

        int pos[]={old_y,old_x,new_y,new_x};
        //select json by id
        //json->map (util)
        //old_x,old_y,new_x,new_y와 map 으로 확률분포 계산(util)
        //계산 후 새로운 위치 (x,y) 값 reply_x,reply_y에 저장
        try {

            int newpos[] = new int[2];
            PercentMapVO percentMapVO = util.mapRefreshByNewPoint(pos,percentMapService.getPercentMapByReplyId(reply_id));
            ReplyPosVO vo=new ReplyPosVO(percentMapVO.getNewpos()[0],percentMapVO.getNewpos()[1]);
            replyService.updateReplyPos(vo);
            percentMapService.updateANDmapOrdering(percentMapVO);

        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
