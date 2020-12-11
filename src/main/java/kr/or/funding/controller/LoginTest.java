package kr.or.funding.controller;



import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.funding.dto.MemberVO;
import kr.or.funding.service.MemberService;


@Controller
public class LoginTest {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/common/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		String url = "common/loginForm";
		return url;
	}
	
	@RequestMapping(value="/common/login", method=RequestMethod.POST)
	public String login(String id, String pwd) throws SQLException{
		String url = "redirect:/index.do";
		MemberVO member = new MemberVO();
		member.setEmail(id);
		member.setPassword(pwd);
		memberService.login(member);
		return url;
	}
	
}
