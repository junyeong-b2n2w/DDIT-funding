package kr.or.funding.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.funding.dto.MemberVO;
import kr.or.funding.dto.MessageVO;
import kr.or.funding.service.MessageService;

@Controller
@RequestMapping("/member")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/message", method=RequestMethod.GET)
	public ModelAndView message(HttpSession session, ModelAndView mnv) throws Exception {
		String url = "member/message";
		
		// ---이 부분부터 로그인 구현 안되있어서 임시로 세션에 심어준거
		MemberVO member2 = new MemberVO();
		member2.setEmail("test");
		session.setAttribute("loginUser", member2);
		// ------------------------------
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String id = member.getEmail();
		
		
		//받은 메시지
		Map<String, Object> receiveMap = messageService.receiveList(id);
		//보낸 메시지
		Map<String, Object> sendMap = messageService.sendeList(id);
		
		mnv.addObject("receiveMap", receiveMap);
		mnv.addObject("sendMap", sendMap);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/messageDetail")
	public ModelAndView detail (ModelAndView mnv, int mno) throws Exception {
		String url = "member/messageDetail";
		
		MessageVO message = messageService.readMessage(mno);
		
		mnv.addObject("message", message);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/messageSend")
	public String messageSendForm () throws Exception{
		String url="member/messageSend";
		
		return url;
	}
	
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public void sendMessage(MessageVO message, HttpServletResponse response, HttpSession session) throws Exception {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		message.setSender(loginUser.getEmail());
		messageService.sendMessage(message);
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('전송완료');");
		out.print("window.close();");
		out.print("window.opener.location.reload();");
		out.print("</script>");
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public void removeMesasge(int mno, int from,HttpServletResponse response) throws Exception {
		MessageVO message = new MessageVO();
		message.setMno(mno);
		
		if(from == 1) {
			message.setDelete_dist("sender");
		}else if(from == 2) {
			message.setDelete_dist("receiver");
		}
		
		messageService.removeMessage(message);
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('삭제완료');");
		out.print("window.close();");
		out.print("window.opener.location.reload();");
		out.print("</script>");
	}
	
	@RequestMapping("messageCount")
	@ResponseBody
	public void messageCount (HttpSession session, Model model) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		if(member != null) {
			int count = messageService.noreadCount(member.getEmail());
			if(count > 0) {
				model.addAttribute("messageCount", count);
			}
		}
		
	}
}
