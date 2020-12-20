package kr.or.funding.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.funding.command.RegistCommand;
import kr.or.funding.dto.MemberVO;
import kr.or.funding.exception.InvalidPasswordException;
import kr.or.funding.exception.NotFoundIDException;
import kr.or.funding.service.MemberService;


@Controller
public class CommonController {
	
	
	@Autowired
	private MemberService memberService;

	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
    MemberService memberservice; //서비스를 호출하기 위해 의존성을 주입
    
    private static final Logger logger=
    	    LoggerFactory.getLogger(MemberController.class);
    	    private static final String String = null;
	
	@RequestMapping(value="/common/loginForm", method=RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) {
		String url = "/common/login";
		
		NaverLoginBO naverLoginBO = new NaverLoginBO();
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		System.out.println("네이버"+naverAuthUrl);
		//네이버 
		model.addAttribute("url", naverAuthUrl);	
		
		return url;
	}
	
	
	
	@RequestMapping(value="/common/login", method=RequestMethod.POST)
	@ResponseBody
	public void login(String email, String password,HttpSession session, HttpServletResponse response) throws SQLException, IOException{
		
		try {
			memberService.login(email, password, session);
			
		} catch (NotFoundIDException e) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(e.getMessage());
		} catch (InvalidPasswordException e) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(e.getMessage());
		}
	}

	

	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void index() {}
	
	
	@RequestMapping(value="/common/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		String url="redirect:/";
		session.invalidate();
		return url;
	}
	
	
	//네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws SQLException,IOException, ParseException {
			String url = "redirect:/index.do";
			MemberVO member = new MemberVO();
			
			OAuth2AccessToken oauthToken;
			NaverLoginBO naverLoginBO = new NaverLoginBO();
			String apiResult = null;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);

	        //1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
			
			System.out.println("co: "+code);
			System.out.println("sta:  "+state);
			//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			//3. 데이터 파싱 
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			System.out.println("response_obj : " +response_obj);
			
			
			String email = (String) response_obj.get("email");
			String name = (String) response_obj.get("name");
			String password = "qkr1412";
			String picture = (String) response_obj.get("profile_image");
			
			member.setName(name);
			member.setEmail(email);
			member.setPassword(password);
			member.setPicture(picture);
			
			
			
			
			memberService.NaverUpdate(member);
			if(memberService.selectMemberById(email) == null  ) {
			
				memberService.regist(member);
			}
			
			
			session.setAttribute("loginUser",member); //세션 생성
			
			model.addAttribute("result", apiResult);
			System.out.println("모델 :  "+model);
			return url;
		}
		
		@RequestMapping(value="/common/findpassForm",method=RequestMethod.GET)
		public String findpass() {
			String url="common/findpass";
			return url;
		}
		
		@RequestMapping(value="/common/findpass",method=RequestMethod.POST)
		  public void mailSending(HttpServletRequest request, String email, HttpServletResponse response_email, HttpSession session) throws SQLException,IOException {
		     
            Random r = new Random();
            int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
            
            String setfrom = "cypn123@gmail.com";
            String tomail = request.getParameter("email"); // 받는 사람 이메일
            String title = "임시 비밀번호 이메일 입니다."; // 제목
            String content =
            
            System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
            
            System.getProperty("line.separator")+
                    
            "안녕하세요 회원님 임시 비밀번호를 보내드립니다!!"
            
            +System.getProperty("line.separator")+
            
            System.getProperty("line.separator")+
    
            " 임시 비밀번호는 " +dice+ " 입니다. "
            
            +System.getProperty("line.separator")+
            
            System.getProperty("line.separator")+
            
            "받으신 인증번호를 홈페이지에 입력해 주시면 로그인 하실 수 있습니다."; // 내용
            
            
            try {
            	
                MemberVO member = new MemberVO();
                member = memberService.selectMemberById(email);
                
                response_email.setContentType("text/html; charset=UTF-8");
                PrintWriter out_email = response_email.getWriter();
                
                if(member !=null) {
                	MimeMessage message = mailSender.createMimeMessage();
                	MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");
                	
                	messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
                	messageHelper.setTo(tomail); // 받는사람 이메일
                	messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
                	messageHelper.setText(content); // 메일 내용
                	
                	mailSender.send(message);
                	member.setPassword(Integer.toString(dice));
                	session.setAttribute("dice", dice);
                	memberService.Searchpass(member);
                	out_email.println("이메일이 발송되었습니다. 로그인시 임시 비밀번호를 입력해주세요.");
                	out_email.flush();
                }else {
                	out_email.println("<script>");
                	out_email.println("alert('없는 이메일 입니다')");
                	out_email.println("history.go(-1);");
                	out_email.println("</script>");
                }
                
            } catch (Exception e) {
                System.out.println(e);
            }
            
            
        }
		
		
		
		
		
		
		@RequestMapping(value="/common/registForm" , method=RequestMethod.GET)
		public String registForm() {
			String url="common/registForm";
			return url;
		}
		
		@RequestMapping(value="/common/regist", method=RequestMethod.POST)
		public void regist2(RegistCommand regist , HttpServletRequest request , HttpServletResponse response)throws SQLException,IOException {
			
			MemberVO member = regist.toMemberVO();
			member.setPicture("noimg.jpg");
			memberService.regist(member);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 완료!!')");
			out.println("location.href='" + request.getContextPath() + "/common/loginForm.do';");
			out.println("</script>");
			out.close();
		}
		
		
		 	
		
		    	    @RequestMapping( value = "/common/auth.do" , method=RequestMethod.POST )
		            public void mailSending2(HttpServletRequest request, String email, HttpServletResponse response_email, HttpSession session) throws IOException {
		     
		                Random r = new Random();
		                int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
		                
		                String setfrom = "cypn123@gmail.com";
		                String tomail = request.getParameter("email"); // 받는 사람 이메일
		                String title = "회원가입 인증 이메일 입니다."; // 제목
		                String content =
		                
		                System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
		                
		                System.getProperty("line.separator")+
		                        
		                "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
		                
		                +System.getProperty("line.separator")+
		                
		                System.getProperty("line.separator")+
		        
		                " 인증번호는 " +dice+ " 입니다. "
		                
		                +System.getProperty("line.separator")+
		                
		                System.getProperty("line.separator")+
		                
		                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
		                
		                
		                try {
		                    MimeMessage message = mailSender.createMimeMessage();
		                    MimeMessageHelper messageHelper = new MimeMessageHelper(message,
		                            true, "UTF-8");
		     
		                    messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
		                    messageHelper.setTo(tomail); // 받는사람 이메일
		                    messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		                    messageHelper.setText(content); // 메일 내용
		                    
		                    mailSender.send(message);
		                } catch (Exception e) {
		                    System.out.println(e);
		                }
		                session.setAttribute("dice", dice);
		                System.out.println("dice 는 " + dice);
		                
		                response_email.setContentType("text/html; charset=UTF-8");
		                PrintWriter out_email = response_email.getWriter();
		                out_email.println("이메일이 발송되었습니다. 인증번호를 입력해주세요.");
		                out_email.flush();
		                
		                
		                
		            }
		        
		        
		        
		        
		        //이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
		        //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
		        //틀리면 다시 원래 페이지로 돌아오는 메소드
		        @RequestMapping(value = "/common/join_injeung.do{dice}", method = RequestMethod.POST)
		        public void join_injeung(String email_injeung, HttpServletResponse response_equals,HttpSession session) throws IOException {
		     
		        	int dice = (int) session.getAttribute("dice");
		        	
		            System.out.println("마지막 : email_injeung : "+email_injeung);
		            System.out.println("마지막 : dice : "+dice);
		            
		            
		            
		            if (email_injeung.equals(Integer.toString(dice))) {
		                
		                //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
		                
		                //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
		                //한번더 입력할 필요가 없게 한다.
		                
		                response_equals.setContentType("text/html; charset=UTF-8");
		                PrintWriter out_equals = response_equals.getWriter();
		                out_equals.println("인증번호가 일치하였습니다.");
		                out_equals.flush();
		                /*session.removeAttribute("dice");*/
		            }else  {
		                response_equals.setContentType("text/html; charset=UTF-8");
		                PrintWriter out_equals = response_equals.getWriter();
		                out_equals.println("인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.");
		                out_equals.flush();
		            		}

		        		}
		        
		        
		        @RequestMapping(value="/common/emailCheck.do", method=RequestMethod.POST)
		        public void emailCheck(String email,HttpServletResponse response)throws Exception {
		        	MemberVO member = new MemberVO();
		        	member = memberService.selectMemberById(email);
		        	response.setContentType("text/html;charset=utf-8");
		        	PrintWriter out = response.getWriter();
		        	
		        	
		        	if(member != null) {
		        		
		        	}else {
		        		out.println(email);
		        	}
		        	
		        }
		
		
		
	
}
