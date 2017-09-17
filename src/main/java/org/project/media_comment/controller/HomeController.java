package org.project.media_comment.controller;

import java.util.List;
import java.util.Locale;

import org.project.media_comment.domain.PercentMapVO;
import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.service.HomeService;
import org.project.media_comment.util.PercentMapUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private HomeService homeService;

	@Autowired
	private PercentMapUtil percentMapUtil;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		try {

			PercentMapVO percentMapVO = new PercentMapVO(0,0,0,null,"");
			percentMapVO.setMapStr(percentMapUtil.defaultMap());
			System.out.println(percentMapVO.getMapStr().toString());

			List<VideoVO> list = homeService.listAllVideo();
			if(list!=null)
				model.addAttribute("list", list);

			List<VideoVO> hotlist = homeService.listHotVideo();
			if(hotlist!=null)
				model.addAttribute("hot", hotlist);

			List<VideoVO> hitlist=homeService.listVideoByCondition("video_hit");
			if(hitlist!=null)
				model.addAttribute("hit",hitlist);

			List<VideoVO> likelist=homeService.listVideoByCondition("video_like_count-video_dislike_count");
			if(likelist!=null)
				model.addAttribute("like",likelist);

			List<VideoVO> datelist=homeService.listVideoByCondition("video_post_date");
			if(datelist!=null)
				model.addAttribute("date",datelist);


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/home/home";
	}

}
