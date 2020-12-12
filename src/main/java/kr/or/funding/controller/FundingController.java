package kr.or.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/funding")
public class FundingController {
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void detail() {}
	
	@RequestMapping(value="/agreements", method=RequestMethod.GET)
	public void agreements() {}
	
	@RequestMapping(value="/registForm", method=RequestMethod.GET)
	public void regist() {}
	
	
}
