package org.project.media_comment.controller;

import org.project.media_comment.service.PercentMapService;
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

    @RequestMapping(value = "/setPos", method = RequestMethod.GET)
    @ResponseBody
    public void test(@RequestParam("reply_id")int reply_id,@RequestParam("old_x")int old_x,@RequestParam("old_y")int old_y,@RequestParam("new_x")int new_x,@RequestParam("new_y")int new_y) {

        //select json by id

        //json->map (util)

        //old_x,old_y,new_x,new_y와 map 으로 확률분포 계산(util)

        //계산 후 새로운 위치 (x,y) 값 reply_x,reply_y에 저장



        logger.info("x,y"+new_x+new_y);
    }

}
