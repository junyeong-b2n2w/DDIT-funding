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
	public void addressRegist(AddressVO address, HttpServletResponse response) throws Exception{
		String url = "address/main";
		
		service.regist(address);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		out.println("<script>");
		out.println("alert('등록되었습니다.')");
		out.println("window.close();");
		out.println("</script>");
		out.close();
		
	}
	
	@RequestMapping(value = "/main")
	public void main(ModelAndView mnv, String email) throws Exception{
		
		List<AddressVO> addressList = service.list(email);
		
		
		mnv.addObject("addressList", addressList);
		
	}
	
	@RequestMapping(value = "/remove")
	public void remove(int ano) throws Exception{
		
		service.removeAddress(ano);
		
	}
	
	
}
