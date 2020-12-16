package kr.or.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class PaymentController {

	@RequestMapping("/paytest")
	public String pay() {
		return "/pay/paytest";
	}
	
}
