package org.project.media_comment.controller;

import org.project.media_comment.domain.UserVO;
import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.service.UserService;
import org.project.media_comment.service.VideoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService UserService;

	//user 정보를 등록    -- jsp파일에서 html부분에서 버튼 눌르는거 foam method = " post" 이거 연결되서 버튼 누르면 아래 메소드 호출됨
	@RequestMapping(value = "/", method = RequestMethod.POST) //회원가입 성공했습니다.
	public String signUp(UserVO vo) {
		try {
			UserService.createAccount(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/Sign_up";
	}
	//user정보등록 페이지로 이동하는 메소드
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getResister(Model model) { return "user/Sign_up"; } // 회원가입 페이지로 이동,

	//이 위 두개는 classic한 포맷

	//login 기능에서 id 리턴값이 0이면 실패했다는 처리를 해주고, 아이디가 나오면

	//model 도 jsp에 데이터 전달하는 운반체이다
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model){
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, Model model){
		int result = 0;
		try{
			result = UserService.login(vo);
			//미완성
			if(result == 0){
				logger.info("fail");
			}else {
				logger.info("success");
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return "user/Login";
	}
}
