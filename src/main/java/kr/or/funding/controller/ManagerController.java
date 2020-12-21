package kr.or.funding.controller;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.funding.command.PageMaker;
import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dto.FundingVO;
import kr.or.funding.dto.RewardVO;
import kr.or.funding.service.FundingService;
import kr.or.funding.service.ManagerService;
import kr.or.funding.service.RewardService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService service;
	
	@Autowired
	private RewardService rewardService;
	
	
	
	@Autowired
	private FundingService fundingService;
	
	@RequestMapping(value="/fList", method=RequestMethod.GET)
	public ModelAndView managerList(ModelAndView mnv,SearchCriteria cri) throws SQLException{
		String url = "manager/list";
		List<FundingVO> fList = service.managerList(cri);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.getFundingCount(cri));
		
		System.out.println(pageMaker.getTotalCount());
		System.out.println(fList.size());
		
		mnv.addObject("fList", fList);
		mnv.addObject("pageMaker", pageMaker);
		mnv.addObject("cri", cri);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(int fno, ModelAndView mnv) throws SQLException{
		String url = "manager/detail";
		
		FundingVO funding = fundingService.getFunding(fno);
		List<RewardVO> list = rewardService.getRewardList(fno);
		
		funding.setRewardList(list);
		mnv.addObject("funding",funding);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@ResponseBody
	@RequestMapping(value="/projectOk", method=RequestMethod.GET)
	public ResponseEntity<String> projectOk(int fno) throws SQLException{
		
		service.updateProjectOk(fno);
		
		ResponseEntity<String> entity = new ResponseEntity<>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/projectNo", method=RequestMethod.GET)
	public ResponseEntity<String> projectNo(int fno) throws SQLException{
		
		service.updateProjectNo(fno);
		
		ResponseEntity<String> entity = new ResponseEntity<>("success", HttpStatus.OK);
		
		return entity;
	}
}
