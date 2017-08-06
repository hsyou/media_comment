package org.project.media_comment.controller;

import org.project.media_comment.domain.ReplyVO;
import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.service.ReplyService;
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
	@Autowired
	private ReplyService replyService;

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
	public String getVideo(@PathVariable int video_id,Model model) {//@PathVariable 어노테이션으로 url에 있는 { .. }의 내용을 가져온다.

		try {
			model.addAttribute(service.getVideo(video_id));
			model.addAttribute("list",replyService.listAllReply(video_id));
		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//미완성
		return "video/play";
	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String insertReply(ReplyVO vo, Model model) {

		try {
			replyService.insertReply(vo);
		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//미완성
		return "redirect:/video/"+vo.getVideo_id();
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listAll(Model model) {

		try {

			model.addAttribute("list",service.listAllVideo());

		}catch (Exception e){
			e.printStackTrace();
		}
		return "video/listAll";
	}



}
