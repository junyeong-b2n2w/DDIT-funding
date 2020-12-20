package kr.or.funding.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.funding.command.MemberModifyCommand;
import kr.or.funding.dto.AddressVO;
import kr.or.funding.dto.FundingVO;
import kr.or.funding.dto.MemberVO;
import kr.or.funding.dto.SaleLogVO;
import kr.or.funding.dto.WishListVO;
import kr.or.funding.service.AddressService;
import kr.or.funding.service.MemberService;
import kr.or.funding.service.WishListService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private WishListService wishService;
	
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
		

		
		List<AddressVO> addressList = addressService.list(email); 
		System.out.println(addressList);
		model.addAttribute("addressList", addressList);
		 
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
	
	@RequestMapping(value="/project", method=RequestMethod.GET)
	public ModelAndView project(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "member/project";
		
		String email = ((MemberVO) session.getAttribute("loginUser")).getEmail();
		
		List<FundingVO> fundingList = memberService.selectMyProject(email);
		
		mnv.setViewName(url);
		mnv.addObject("fundingList", fundingList);
		return mnv;
	}
	

	
	@Resource(name="summernote")
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
//	---------------------------wishList
	@RequestMapping(value="/registWish",method=RequestMethod.GET)
	@ResponseBody
	public void registWish(HttpSession session, HttpServletResponse response, int fno) throws Exception {
		WishListVO wish = new WishListVO();
		MemberVO member =  (MemberVO) session.getAttribute("loginUser");
		
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		if(member != null) {
			wish.setEmail(member.getEmail());
			wish.setFno(fno);
			int count = wishService.regist(wish);
			
			
			if(count == 0) {
				out.println("이미 등록되어있습니다.");
			}else {
			}
			
		}else {
			out.println("로그인은 필수입니다");
		}
		out.close();
	}
	
	@RequestMapping(value="/wishList",method=RequestMethod.GET)
	public ModelAndView wishList(ModelAndView mnv, HttpSession session) throws Exception {
		String url ="member/wishList";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		Map<String, Object> wishMap = wishService.selectWishList(member.getEmail());
		
		mnv.addObject("wishList", wishMap.get("wishList"));
		mnv.addObject("fundingList", wishMap.get("fundingList"));
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/removeWish", method=RequestMethod.GET)
	@ResponseBody
	public void removeWish (HttpSession session, int fno, HttpServletResponse response) throws Exception {
		WishListVO wish = new WishListVO();
		MemberVO member =  (MemberVO) session.getAttribute("loginUser");
		 
		 
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter out = response.getWriter();
		 if(member != null) {
			 wish.setEmail(member.getEmail());
			 wish.setFno(fno);
			 wishService.remove(wish);
			 
			 
		 }else {
			 out.println("로그인을 해주세요");
		 }
		
		out.close();
	}
	
//	------------범----
	@RequestMapping(value="/buy",method=RequestMethod.POST)
	public ModelAndView buyFunding (SaleLogVO sale, HttpSession session, ModelAndView mnv) throws Exception {
		
		String url ="member/buy";
		sale.setEmail(((MemberVO) session.getAttribute("loginUser")).getEmail());
		if(sale.getRno() < 1) {
			sale.setRno(0);
		}
		memberService.buyFunding(sale);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/support", method=RequestMethod.GET)
	public ModelAndView support(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "member/support";
		
		String email = ((MemberVO) session.getAttribute("loginUser")).getEmail();
		
		Map<String, Object> dataMap = memberService.support(email);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping(value="/cancel", method=RequestMethod.GET)
	@ResponseBody
	public void cancel(int sno, HttpServletResponse response) throws Exception {
		memberService.cancelFunding(sno);
		response.setContentType("text/html;charset=utf-8");
	}
}
