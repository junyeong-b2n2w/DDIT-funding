package kr.or.funding.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.funding.dto.ReplyVO;
import kr.or.funding.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> replyList(int cno) throws Exception {

		ResponseEntity<List<ReplyVO>> entity = null;

		try {
//			Map<String, Object> dataMap 
			List<ReplyVO> replyList = replyService.selectReplyList(cno);
			entity = new ResponseEntity<List<ReplyVO>>(replyList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;

	}
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	@ResponseBody
	public void regist (HttpServletResponse response,ReplyVO reply) throws Exception {
			replyService.insert(reply);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(reply.getContent());
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	@ResponseBody
	public void modify (HttpServletResponse response,ReplyVO reply) throws Exception {
			replyService.modify(reply);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(reply.getContent());
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	@ResponseBody
	public void remove (HttpServletResponse response,int rpno,ReplyVO reply) throws Exception {
			replyService.remove(rpno);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(reply.getContent());
	}
}



