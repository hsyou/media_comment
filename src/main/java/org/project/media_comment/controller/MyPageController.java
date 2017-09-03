package org.project.media_comment.controller;

import java.util.*;

import org.project.media_comment.domain.MypageVO;
import org.project.media_comment.domain.UserVO;
import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.service.MypageService;
import org.project.media_comment.service.VideoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/Mypage")
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@Autowired
	private MypageService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */


	//userid는 세션에서 받는걸로 바꿔야될듯.
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String getActivity(MypageVO vo, Model model,HttpServletRequest request) {//@PathVariable �뼱�끂�뀒�씠�뀡�쑝濡� url�뿉 �엳�뒗 { .. }�쓽 �궡�슜�쓣 媛��졇�삩�떎.
//@ModelAttribute int user_id){//
		try {
			//List<MypageVO> vo=service.getRecentActivity(user_id);
			//int user_id=1;
			HttpSession session=request.getSession();
			UserVO uvo=(UserVO)session.getAttribute("login");
			int user_id= uvo.getUser_id();
			logger.info("this is mypage! id="+user_id+"\n");

			List <MypageVO>li=service.getRecentActivity(user_id);
			//for(MypageVO mypagevo : vo)
			//	logger.info("activity name : "+mypagevo.getActivity_name());

			//logger.info("a:"+li.get(0).getVideo_id()+"\n");

			model.addAttribute("views",li);

		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//誘몄셿�꽦
		return "mypage/mylists";
	}

	//userid는 세션에서 받는걸로 바꿔야될듯.
	@RequestMapping(value = "/mypost", method = RequestMethod.GET)
	public String getMypost(MypageVO vo, Model model,HttpServletRequest request) {//@PathVariable �뼱�끂�뀒�씠�뀡�쑝濡� url�뿉 �엳�뒗 { .. }�쓽 �궡�슜�쓣 媛��졇�삩�떎.
//@ModelAttribute int user_id){//
		try {
			//List<MypageVO> vo=service.getRecentActivity(user_id);
			//int user_id=1;
			HttpSession session=request.getSession();
			UserVO uvo=(UserVO)session.getAttribute("login");

			int user_id= uvo.getUser_id();

			logger.info("this is mypage! id="+user_id+"\n"+"name:"+uvo.getUser_nickname()+","+uvo.getUser_email());

			List <VideoVO>li=service.getMypost(user_id);
			//for(MypageVO mypagevo : vo)
			//	logger.info("activity name : "+mypagevo.getActivity_name());

			//logger.info("a:"+li.get(0).getVideo_id()+"\n");

			model.addAttribute("views",li);

		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//誘몄셿�꽦
		return "mypage/mylists";
	}

	@RequestMapping(value = "/myfavorite", method = RequestMethod.GET)
	public String getMyfavorite(MypageVO vo, Model model,HttpServletRequest request) {//@PathVariable �뼱�끂�뀒�씠�뀡�쑝濡� url�뿉 �엳�뒗 { .. }�쓽 �궡�슜�쓣 媛��졇�삩�떎.
//@ModelAttribute int user_id){//
		try {
			//List<MypageVO> vo=service.getRecentActivity(user_id);
			//int user_id=1;
			HttpSession session=request.getSession();
			UserVO uvo=(UserVO)session.getAttribute("login");
			int user_id= uvo.getUser_id();
			logger.info("this is mypage! id="+user_id+"\n");

			List <VideoVO>li=service.getMyfavorite(user_id);
			//for(MypageVO mypagevo : vo)
			//	logger.info("activity name : "+mypagevo.getActivity_name());

			//logger.info("a:"+li.get(0).getVideo_id()+"\n");

			model.addAttribute("views",li);

		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//誘몄셿�꽦
		return "mypage/mylists";
	}


}
