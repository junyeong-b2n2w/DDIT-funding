package kr.or.funding.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.funding.dto.AddressVO;
import kr.or.funding.service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	private AddressService service;
	
	@RequestMapping("/registForm")
	public String address() {
		return "/address/addressRegist";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String addressRegist(AddressVO address, HttpServletResponse response) throws Exception{
		String url = "address/main";
		
		service.regist(address);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		out.println("<script>");
		out.println("alert('등록되었습니다.')");
		out.println("</script>");
		out.close();
		
		return url;
	}
	
	@RequestMapping(value = "/main")
	public ModelAndView main(ModelAndView mnv, String email) throws Exception{
		String url = "address/main";
		
		List<AddressVO> addressList = service.list(email);
		
		mnv.addObject("addressList", addressList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/remove")
	public String remove(int ano) throws Exception{
		String url = "address/main";
		
		service.removeAddress(ano);
		
		return url;
	}
	
	
}
