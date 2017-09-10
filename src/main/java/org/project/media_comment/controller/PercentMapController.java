package org.project.media_comment.controller;

import org.project.media_comment.service.PercentMapService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by pose2 on 2017-09-10.
 */
public class PercentMapController {

    private static final Logger logger = LoggerFactory.getLogger(PercentMapController.class);

    @Autowired
    private PercentMapService percentMapService;

}
