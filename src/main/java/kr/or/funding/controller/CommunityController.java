package kr.or.funding.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.funding.dto.CommunityVO;
import kr.or.funding.dto.MemberVO;
import kr.or.funding.dto.ReplyVO;
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
	@ResponseBody
	public void modify(HttpServletResponse response, CommunityVO community) throws Exception{
		
		communityService.modify(community);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(community.getContent());
				
		
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	@ResponseBody
	public void modify( int cno,HttpServletResponse response,CommunityVO community) throws Exception{
		
		
		communityService.remove(cno);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(community.getContent());
	}
	
	@RequestMapping(value="/registForm")
	public String registForm() throws SQLException{
		String url = "community/regist";
		return url;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public String regist (HttpServletResponse response,CommunityVO community, int fno,HttpSession session) throws Exception {
		String url = "funding/detail";
		communityService.insert(community);
		return url;
	}
	
}
