package kr.or.funding.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.funding.dto.CommunityVO;
import kr.or.funding.service.CommunityService;
import kr.or.funding.service.ReplyService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/list")
	public ModelAndView list(int fno, ModelAndView mnv) throws SQLException {
		String url = "community/list";
		List<CommunityVO> communityList = communityService.getAllList(fno);
		replyService.replyCount(communityList);
		mnv.setViewName(url);
		mnv.addObject("communityList", communityList);
		return mnv;
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView detail(ModelAndView mnv, int cno) throws SQLException {
		String url = "community/detail";
		
		CommunityVO community = communityService.getOneinfo(cno);
		mnv.setViewName(url);
		mnv.addObject("community", community);
		
		return mnv;
	}
	
	@RequestMapping(value="/modifyForm")
	public ModelAndView modifyForm (int cno,ModelAndView mnv) throws Exception {
		String url = "community/modify";
		
		CommunityVO community = communityService.getOneinfo(cno);
		mnv.setViewName(url);
		mnv.addObject("community", community);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView modify(ModelAndView mnv, CommunityVO community) throws Exception{
		String url="community/list";
		
		communityService.modify(community);
		
		List<CommunityVO> community2 = communityService.getAllList(community.getFno());
		mnv.setViewName(url);
		mnv.addObject("communityList", community2); 
		return mnv;
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public ModelAndView modify(ModelAndView mnv, int cno, int fno) throws Exception{
		String url="community/list";
		
		communityService.remove(cno);
		
		List<CommunityVO> community2 = communityService.getAllList(fno);
		mnv.setViewName(url);
		mnv.addObject("communityList", community2); 
		return mnv;
	}
	
	@RequestMapping(value="/registForm")
	public String registForm() throws SQLException{
		String url = "community/regist";
		return url;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView regist (ModelAndView mnv, CommunityVO community, int fno) throws Exception {
		String url="community/list";
		
		communityService.insert(community);
		
		List<CommunityVO> community2 = communityService.getAllList(fno);
		mnv.setViewName(url);
		mnv.addObject("communityList", community2); 
		return mnv;
	}
	
}
