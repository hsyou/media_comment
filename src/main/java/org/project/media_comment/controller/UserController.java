package org.project.media_comment.controller;

import org.project.media_comment.domain.UserVO;
import org.project.media_comment.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

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
		return "user/login";
	}

	//user정보등록 페이지로 이동하는 메소드
	@RequestMapping(value = "/", method = RequestMethod.GET) // 질문 ( value = "/" 라고 표시한 이유는? )
	public String getResister(Model model) { return "user/sign_up"; } // 회원가입 페이지로 이동,


	//model 도 jsp에 데이터 전달하는 운반체이다
	@RequestMapping(value = "/login", method = RequestMethod.GET) //요청 URL을 어떤 메서드가 처리할지 여부를 결정하는 것이 “@RequestMapping“
	public String loginGet(Model model){
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpSession session){
		UserVO result = null;
		String returnurl="";
		try{
			result= UserService.login(vo);
			//미완성
			if(result == null){//로그인 실패

				returnurl= "user/login";
			}else {//성공

				logger.info("success");
				//session

				returnurl= "home";

			}
		}catch (Exception e){

			e.printStackTrace();

		}
		model.addAttribute("userVO", result); // modelMap 에 키값이랑 value 넣어주는거랑 같다고보면됨.

		return returnurl;
	}
	@RequestMapping(value = "/checkId", method = {RequestMethod.GET})
	public @ResponseBody String idCheck(@RequestParam("id") String user_email, Model model) {
		Integer result = null; // 찾아서 갯수가 0이아니고 같은아이디가 몇개 찾아지면 아이디 등록 못하게하려고?
		try {
			result = UserService.checkId(user_email);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if(result == null) return "0";
		return result+"";
	}
}
