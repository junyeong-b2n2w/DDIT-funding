
package kr.or.funding.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.funding.command.RewardCommand;
import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dto.CommunityVO;
import kr.or.funding.dto.FundingVO;
import kr.or.funding.dto.RewardItemVO;
import kr.or.funding.dto.RewardVO;
import kr.or.funding.service.CommunityService;
import kr.or.funding.service.FundingService;
import kr.or.funding.service.ReplyService;
import kr.or.funding.service.RewardService;

@Controller
@RequestMapping(value="/funding")
public class FundingController {
	
	@Autowired
	private FundingService fundingService;
	@Autowired
	private RewardService rewardService;
	
	@Autowired
	private ReplyService replyService;
	@Autowired
	private CommunityService communityService;
	
	private RewardItemVO rItem;
	private RewardVO reward;
	
//	@RequestMapping(value="/detail", method=RequestMethod.GET)
//	public void detail() {}
	
	@RequestMapping(value="/agreements", method=RequestMethod.GET)
	public void agreements() {}
	
	@RequestMapping(value="/modifyForm", method=RequestMethod.GET)
	public void mpdifyForm(int fno, Model model) throws SQLException {
		FundingVO funding = fundingService.getFunding(fno);
		List<RewardVO> list = rewardService.getRewardList(fno);
		funding.setRewardList(list);
		model.addAttribute("funding",funding);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public void modify(FundingVO funding, HttpServletResponse response, RewardCommand rewardReq) throws Exception{
		fundingService.remove(funding.getFno());
		
		fundingService.modify(funding);
		int itemCnt = 0;
		int itemCntChk = 0;
		for(int i=0;i<rewardReq.getItemcnt().length;i++) {
			reward = new RewardVO();
			reward.setFno(funding.getFno());
			reward.setItemcnt(rewardReq.getItemcnt()[i]);
			reward.setRcount(rewardReq.getRcount()[i]);
			reward.setRprice(rewardReq.getRprice()[i]);
			System.out.println(reward);
			int rno = rewardService.insertReward(reward);
			itemCnt += rewardReq.getItemcnt()[i];
			for(int j=itemCntChk;j<itemCnt;j++) {
				rItem = new RewardItemVO();
				rItem.setRno(rno);
				rItem.setOptions(rewardReq.getOptions()[j]);
				rItem.setRitem(rewardReq.getRitem()[j]);
				System.out.println(rItem + "<<<<<<<<");
				rewardService.insertRewardItem(rItem);
			}
			itemCntChk = itemCnt;
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('수정이 정상적으로 완료 되었습니다')");
		out.println("location.href='list.do'");
		out.println("</script>");
		
	}
	
	
	@RequestMapping("/list")
	public String list(Model model, SearchCriteria cri) throws SQLException {
		String url = "funding/list";
		List<FundingVO> fundingList = fundingService.getFundingList(cri);
		model.addAttribute("fundingList",fundingList);
		model.addAttribute("cri",cri);
		System.out.println(fundingList);
		
		return url;
	}

	@RequestMapping("/items")
	@ResponseBody
	public ResponseEntity<List<FundingVO>> items(Model model, SearchCriteria cri) throws SQLException {
		
		ResponseEntity<List<FundingVO>> entity = null;
		
		List<FundingVO> fundingList = fundingService.getFundingList(cri);
		
		int totalCnt = fundingService.getFundingCnt(cri);
		
		if((cri.getPage() - 1)* cri.getPerPageNum() > totalCnt) {
			return entity= new ResponseEntity<List<FundingVO>>(HttpStatus.OK);
		}else {
			return entity= new ResponseEntity<List<FundingVO>>(fundingList,HttpStatus.OK);
		}
		
		
		
		
	}
	
	
	@RequestMapping("/detail")
	public String detail(int fno, Model model) throws SQLException{
		String url = "funding/detail";
		FundingVO funding = fundingService.getFunding(fno);
		List<RewardVO> list = rewardService.getRewardList(fno);
		funding.setRewardList(list);
		
		List<CommunityVO> communityList = communityService.getAllList(fno);
		replyService.replyCount(communityList);
		model.addAttribute("communityList", communityList);
		model.addAttribute("funding",funding);
		return url;
	}
	
	
	@RequestMapping("/registForm")
	public void registForm(HttpSession session, Model model) throws SQLException {
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public void regist(FundingVO funding, HttpServletResponse response, RewardCommand rewardReq) throws Exception{
		int fno = fundingService.write(funding);
		int itemCnt = 0;
		int itemCntChk = 0;
		for(int i=0;i<rewardReq.getItemcnt().length;i++) {
			reward = new RewardVO();
			reward.setFno(fno);
			reward.setItemcnt(rewardReq.getItemcnt()[i]);
			reward.setRcount(rewardReq.getRcount()[i]);
			reward.setRprice(rewardReq.getRprice()[i]);
			int rno = rewardService.insertReward(reward);
			itemCnt += rewardReq.getItemcnt()[i];
			for(int j=itemCntChk;j<itemCnt;j++) {
				rItem = new RewardItemVO();
				rItem.setRno(rno);
				rItem.setOptions(rewardReq.getOptions()[j]);
				rItem.setRitem(rewardReq.getRitem()[j]);
				rewardService.insertRewardItem(rItem);
			}
			itemCntChk = itemCnt;
		}
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('등록이 정상적으로 완료 되었습니다')");
		out.println("location.href='list.do'");
		out.println("</script>");
		
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(int fno, Model model) throws SQLException {
		model.addAttribute("funding",fundingService.getFunding(fno));
		return "funding/modify";
	}
	
	@RequestMapping("/remove")
	public void remove(int fno, HttpServletResponse response) throws Exception {
		fundingService.remove(fno);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('삭제 되었습니다')");
		out.println("location.href='list.do'");
		out.println("</script>");
	}
	
	@RequestMapping(value="picture", method=RequestMethod.POST)
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		String result="";
		HttpStatus status = null;
		
		if((result=savePicture(oldPicture,multi))==null) {
			status = HttpStatus.BAD_REQUEST;
		}else {
			status = HttpStatus.OK;
		}
		entity = new ResponseEntity<>(result,status);
		return entity;
	}
	@Resource(name="summernote")
	private String imgPath;
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception{
		String fileName= null;
		
		//파일 유무 확인
		if(!(multi==null || multi.isEmpty() || multi.getSize() > 1024*1024*5)) {
			
			//파일 저장 폴더 설정
			String uploadPath = imgPath;
			fileName = UUID.randomUUID().toString().replace("-","")+".jpg";
			File storeFile = new File(uploadPath,fileName);
			
			storeFile.mkdirs();
			
			//local HDD에 저장
			multi.transferTo(storeFile);
			
			if(!oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath,oldPicture);
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
	
	
	
	@RequestMapping("/uploadImg")
	public ResponseEntity<String> uploadImg(HttpServletRequest request, MultipartFile file) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		int fileSize = 5*1024*1024;
		
		if(file.getSize() > fileSize) {
			return new ResponseEntity<String>("용량 초과입니다", HttpStatus.BAD_REQUEST);
		}
		
		String savePath = imgPath.replace("/", File.separator);
		String fileName = UUID.randomUUID().toString().replace("-", "");
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		fileName = fileName + fileFormat;
		
		File saveFile = new File(savePath, fileName);
		
		if(!saveFile.exists()) {
			saveFile.mkdirs();
		}
		
		try {
			file.transferTo(saveFile);
			entity = new ResponseEntity<>(request.getContextPath()+"/funding/getImg.do?fileName="+fileName, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/getImg")
	public ResponseEntity<byte[]> getImg(String fileName)throws IOException {
		
		ResponseEntity<byte[]> entity = null;
		
		String savePath = imgPath.replace("/", File.separator);
		File sendFile = new File(savePath, fileName);
		FileInputStream in = null;
		
		try {
			in = new FileInputStream(sendFile);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping("/deleteImg")
	public ResponseEntity<String> deleteImg(@RequestBody Map<String, String> data) throws Exception{
		
		ResponseEntity<String> result = null;
		String fileName = data.get("fileName");
		
		String savePath = imgPath.replace("/", File.separator);
		File target = new File(savePath, fileName);
		
		if(!target.exists()) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		} else {
			try {
				target.delete();
				result = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				result = new ResponseEntity<String>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		
		return result;
	}

}
