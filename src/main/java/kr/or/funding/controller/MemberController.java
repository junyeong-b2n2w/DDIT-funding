package kr.or.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@RequestMapping(value="/registForm", method=RequestMethod.GET)
	public String registForm() {
		String url = "/member/regist";
		return url;
	}
	
	@RequestMapping(value="/message", method=RequestMethod.GET)
	public void message() {}
	
	@RequestMapping(value="/support", method=RequestMethod.GET)
	public void support() {}

	@RequestMapping(value="/like", method=RequestMethod.GET)
	public void like() {}
	
	@RequestMapping(value="/project", method=RequestMethod.GET)
	public void project() {}
	
	@RequestMapping(value="/setting", method=RequestMethod.GET)
	public void setting() {}
}
