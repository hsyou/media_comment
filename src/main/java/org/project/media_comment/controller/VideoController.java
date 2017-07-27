package org.project.media_comment.controller;

import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.service.VideoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/video")
public class VideoController {
	
	private static final Logger logger = LoggerFactory.getLogger(VideoController.class);

	@Autowired
	private VideoService service;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(Model model) {
		return "video/upload";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadFile(VideoVO vo) { //VideoVO에 input value 자동으로 주입

		try {

			service.uploadVideo(vo);

		}catch (Exception e){
			e.printStackTrace();

			//에러 발생시 error page로 (미구현)
		}

		return "home";
	}

	@RequestMapping(value = "/{video_id}", method = RequestMethod.GET)
	public String getVideo(@PathVariable int video_id) {//@PathVariable 어노테이션으로 url에 있는 { .. }의 내용을 가져온다.

		try {
			VideoVO vo=service.getVideo(video_id);
			logger.info("video title : "+vo.getVideo_title());
		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//미완성
		return "video/play";
	}

	@RequestMapping(value = "/play", method = RequestMethod.GET)
	public String play(Model model) {
		
		return "video/play";
	}

}
