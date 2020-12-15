package kr.or.funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ResponseEntity<String> regist (ReplyVO reply) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			replyService.insert(reply);
			entity = new ResponseEntity<String>("성공",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ResponseEntity<String> modify (ReplyVO reply) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			replyService.modify(reply);
			entity = new ResponseEntity<String>("성공",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public ResponseEntity<String> remove (int rpno) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			replyService.remove(rpno);
			entity = new ResponseEntity<String>("성공",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}
