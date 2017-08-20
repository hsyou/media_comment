package org.project.media_comment.controller;

import org.apache.http.HttpRequest;
import org.project.media_comment.domain.*;
import org.project.media_comment.service.ReplyService;
import org.project.media_comment.service.VideoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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
	public String uploadFile(VideoVO vo, HttpServletRequest req) { //VideoVO에 input value 자동으로 주입

		try {
			HttpSession session=req.getSession();
			UserVO uvo=(UserVO)session.getAttribute("login");
			vo.setUser_id(uvo.getUser_id());
			service.uploadVideo(vo);

		}catch (Exception e){
			e.printStackTrace();

			//에러 발생시 error page로 (미구현)
		}

		return "home";
	}

	@RequestMapping(value = "/{video_id}", method = RequestMethod.GET)
	public String getVideo(@PathVariable int video_id,Model model,HttpServletRequest request) {//@PathVariable 어노테이션으로 url에 있는 { .. }의 내용을 가져온다.
		UserVO userVO=(UserVO)request.getSession().getAttribute("login");
		int user_id=0;
		try {
			if(userVO!=null){
				user_id=userVO.getUser_id();
			}
			//댓글
			List<ReplyVO> list=replyService.listAllReply(video_id,user_id);
			if(list!=null)	model.addAttribute("list",list);

			//영상
			VideoVO videoVO=service.getVideo(video_id,user_id);
			if(videoVO!=null) model.addAttribute(videoVO);

		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//미완성
		return "video/play";
	}

	//댓글 입력
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String insertReply(ReplyVO vo, HttpServletRequest request) {

		try {
			replyService.insertReply(vo);
		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//미완성
		return "redirect:/video/"+vo.getVideo_id();
	}

	//댓글 투표
	@RequestMapping(value = "/reply/vote", method=RequestMethod.POST)
	@ResponseBody
	public String voteReply(@RequestParam("user_id")int user_id,@RequestParam("reply_id")int reply_id,
						 @RequestParam("reply_vote_flag")int reply_vote_flag){
		int result=0;
		try {
			result=replyService.voteReply(new ReplyVoteVO(reply_id,user_id,reply_vote_flag));
		}catch (Exception e){
			e.printStackTrace();
		}
		//-1 : dislike
		// 0 : default
		// 1 : like
		return result+"";
	}
	//동영상 투표
	@RequestMapping(value = "/vote", method=RequestMethod.POST)
	@ResponseBody
	public String voteVideo(@RequestParam("user_id")int user_id,@RequestParam("video_id")int video_id,
							@RequestParam("video_vote_flag")int video_vote_flag){
		int result=0; 	
		try {
			result=service.voteVideo(new VideoVoteVO(video_id,user_id,video_vote_flag));
		}catch (Exception e){
			e.printStackTrace();
		}
		//-1 : dislike
		// 0 : default
		// 1 : like
		return result+"";
	}


	//list all
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
