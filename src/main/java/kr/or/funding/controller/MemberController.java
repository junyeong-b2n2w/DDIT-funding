package kr.or.funding.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.funding.command.MemberModifyCommand;
import kr.or.funding.dto.AddressVO;
import kr.or.funding.dto.MemberVO;
import kr.or.funding.service.AddressService;
import kr.or.funding.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/settingupdate")
	public void settingUpdate(MemberVO member)throws SQLException {
		
		memberService.Searchpass(member);
		
	}
	
	@RequestMapping("/menu")
	public String menu() {
		String url ="member/menu";
		return url;
	}
	
	
	@RequestMapping("/settings")
	public String profile(Model model,HttpSession session)throws SQLException {
		
		String url= "member/setting";
		String email = ((MemberVO) session.getAttribute("loginUser")).getEmail();
		
		MemberVO member = new MemberVO();
		 member =  memberService.selectMemberById(email);
		
		model.addAttribute("member",member);
		return url;
	}
	
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public void modify(MemberModifyCommand mem,MultipartFile mult,HttpServletResponse response,HttpSession session)throws Exception {
		
		String email= ((MemberVO)session.getAttribute("loginUser")).getEmail();
		
		System.out.println("늙은거 : "+mem.getOldPicture());
		System.out.println("쌔거 :  "+mem.getPicture());
		
		
		MemberVO member = mem.toParseMember();
		member.setEmail(email);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		String fileName = savePicture(mem.getOldPicture(), mem.getPicture());
		member.setPicture(fileName);
		
		member.setPicture(mem.getOldPicture());
		if(member.getName() != null) {
			member.setName(member.getName());
		}else if(member.getPassword() != null) {
			member.setPassword(member.getPassword());
		}else if(member.getPicture() !=null) {
			member.setPicture(fileName);
		}
		
		memberService.MemberUpdate(member);
		
	}
	

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
	public void setting(HttpServletRequest request,HttpSession session) throws SQLException{
		
		
		String email =  ((MemberVO) session.getAttribute("loginUser")).getEmail();
		
		List<AddressVO> addressList = addressService.list(email); 
		System.out.println(addressList);
		request.setAttribute("addressList", addressList);
	}
	
	@Resource(name="profile")
	private String picturePath;
	  
	
	@RequestMapping("/getPicture")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String picture) throws Exception{
		InputStream in= null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		
		try {
			
			in= new FileInputStream(new File(imgPath,picture));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),HttpStatus.CREATED);
			
		} catch (IOException e) {
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		}finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping(value="/image",method=RequestMethod.POST)
	public ResponseEntity<String> image(@RequestParam("pictureFile") MultipartFile multi, String oldPicture)throws Exception{
		
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
	
	private String savePicture(String oldPicture, MultipartFile multi)throws Exception {
		String fileName= null;
		
		//파일 유무 확인
		if(!(multi==null || multi.isEmpty() || multi.getSize() > 1024*1024*5)) {
			
			//파일 저장 폴더 설정
			String uploadPath = picturePath;
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
}
