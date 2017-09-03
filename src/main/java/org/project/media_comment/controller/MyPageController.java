package org.project.media_comment.controller;

import java.util.*;

import org.project.media_comment.domain.MypageVO;
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
	@RequestMapping(value = "/Mypage", method = RequestMethod.GET)
	public String addActivity(MypageVO vo) { //VideoVO�뿉 input value �옄�룞�쑝濡� 二쇱엯

		try {
			logger.info("this is mypage! id="+0+"\n");
			
			service.addActivity(vo);

		}catch (Exception e){
			e.printStackTrace();

			//�뿉�윭 諛쒖깮�떆 error page濡� (誘멸뎄�쁽)
		}

		return "mypages/mylists";
	}

	@RequestMapping(value = "/{user_id}", method = RequestMethod.GET)
	public String getActivity(@PathVariable int user_id) {//@PathVariable �뼱�끂�뀒�씠�뀡�쑝濡� url�뿉 �엳�뒗 { .. }�쓽 �궡�슜�쓣 媛��졇�삩�떎.
//@ModelAttribute int user_id){//
		try {
			//List<MypageVO> vo=service.getRecentActivity(user_id);
			//int user_id=1;
			logger.info("this is mypage! id="+user_id+"\n");
			
			List <MypageVO>li=service.getRecentActivity(user_id);
			//for(MypageVO mypagevo : vo)
			//	logger.info("activity name : "+mypagevo.getActivity_name());
		
			logger.info("a:"+li.get(0).getActivity_id()+"\n");
			
		}catch (Exception e){
			e.printStackTrace();
			//error
		}

		//誘몄셿�꽦
		return "mypages/mylists";
	}


}
