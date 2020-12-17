package kr.or.funding.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.funding.dto.AddressVO;
import kr.or.funding.dto.MemberVO;
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
	public void modify(String name,String password,HttpServletResponse response,HttpSession session)throws Exception {
		
		String email= ((MemberVO)session.getAttribute("loginUser")).getEmail();
		MemberVO member = new MemberVO();
		member.setEmail(email);
		
		if(name != null) {
			member.setName(name);
		}else if(password != null) {
			member.setPassword(password);
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
	
//	---------------------------wishList
	@RequestMapping(value="/regishWish",method=RequestMethod.GET)
	@ResponseBody
	public void registWish(HttpSession session, HttpServletResponse response, int fno) throws Exception {
		WishListVO wish = new WishListVO();
		MemberVO member =  (MemberVO) session.getAttribute("loginUser");
		wish.setEmail(member.getEmail());
		wish.setFno(fno);
		
		int count = wishService.regist(wish);
		
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		
		if(count == 0) {
			out.println("이미 등록되어있습니다.");
		}else {
			out.println("추가 완료");
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
	public void removeWish (int wno, HttpServletResponse response) throws Exception {
		wishService.remove(wno);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("location.reload()");
		out.println("</script>");
		out.close();
	}
	
}
