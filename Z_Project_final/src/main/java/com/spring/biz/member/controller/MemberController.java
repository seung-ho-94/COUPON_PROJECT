package com.spring.biz.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.biz.member.service.GetAccessTokenKakao;
import com.spring.biz.member.service.GetKakaoUniqueNo;
import com.spring.biz.member.service.MemberService;
import com.spring.biz.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberSerivce;
	
	@Autowired
	private JavaMailSender mailSender;		//JAVA에서 제공하는 mail 객체 생성
	
	@Autowired
	private GetAccessTokenKakao kakaoAPI;
	
	@Autowired
	private GetKakaoUniqueNo kakaoNo;

	// 회원가입 ------------------------------------------------------------
	// 회원가입 페이지로 이동
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signupView() {
		return "/member/signup.jsp";
	}

	// 회원가입 완료 페이지로 이동
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signup(MemberVO vo, Model model) {
		memberSerivce.insertMember(vo);
		return "/member/signupSuccess.jsp";
	}

	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/id_check.do", method = RequestMethod.POST)
	public String id_check(HttpServletRequest request, Model model) {
		String id = request.getParameter("userID");
		int result = memberSerivce.idCheck(id);
		return String.valueOf(result);
	}

	// 로그인 --------------------------------------------------------------
	// 로그인 페이지로 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView() {
		return "/member/login.jsp";
	}
	
  //카카오 로그인
  @RequestMapping("/kakaologin.do") public String
  kakaologin(@RequestParam(value = "code", required = false)String code, String
	  access_Token, HttpServletRequest request) throws Exception{
	  HttpSession session = request.getSession();		

	  String accessToken = kakaoAPI.getAccessToken(code);
	  HashMap<String, Object> userInfo = kakaoNo.getUserInfo(accessToken);
	  System.out.println("access_Token :" + accessToken);
	  
	  if(userInfo.get("email") != null) {
		  session.setAttribute("loginId", userInfo.get("email"));
		  session.setAttribute("email", userInfo.get("email"));
		  session.setAttribute("name", userInfo.get("nickname"));
		  session.setAttribute("accessToken", accessToken);
	  }
  
	  return "./main.jsp";
  }
  
	// 로그인 아이디, 비밀번호 확인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest request, HttpServletResponse response) {
		MemberVO memberVO = new MemberVO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		memberVO.setId(request.getParameter("id"));
		memberVO.setPassword(request.getParameter("password"));

		boolean loginCheck = memberSerivce.loginCheck(memberVO);
		String Withdrawal_id = memberSerivce.Withdrawal_id(id);		//회원'1', 탈퇴 회원'2' 유무 확인
		
		if (loginCheck && Withdrawal_id.contentEquals("1")) {
			HttpSession session = request.getSession();		
			String loginId = request.getParameter("id");
			session.setAttribute("loginId", loginId);				//로그인 ID 세션 저장
			return "./main.jsp";									//로그인 성공시 메인 페이지로 이동

		} else {
			return "/member/loginFail.jsp";
		}
	}

	//회원가입 이메일 인증 ----------------------------------------------------------
	@RequestMapping(value = "/email_check.do", method = RequestMethod.GET)
	@ResponseBody public String mailCheckGet(String emailText) throws Exception {
	  
		 //인증번호(난수) 생성
		 Random random = new Random();
		 int checkNum = random.nextInt(888888) + 111111;
	  
		 //인증번호 이메일 전송
		 String setFrom = "dbsdk0070@gmail.com";			//이메일 보내는 실제 아이디
		 String toMail = emailText;							//입력된 회원 이메일 주소
		 String title = "베스트립 회원가입 인증 이메일입니다.";				//제목
		 String content = "베스트립을 방문해주셔서 감사합니다." +		//내용
			  		   "<br><br>" +
			  		   "인증 번호는 " + checkNum + "입니다." +
			  		   "<br>" +
			  		   "해당 인증번호를 인증번호 확인란에 기입해주세요.";
		 try {
	  
			 MimeMessage message = mailSender.createMimeMessage();							//MimeMessage : JAVA 메일API (단순 text 전송)
			 MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");		//MimeMessageHelper : (MineMessage의 객체, Multipart여부, 인코딩 타입 ) 
			 helper.setFrom(setFrom);
			 helper.setTo(toMail);
			 helper.setSubject(title);
			 helper.setText(content,true);
			 mailSender.send(message);
			  
			 }catch(Exception e) { e.printStackTrace(); }
			  
			 String num = Integer.toString(checkNum);
			 System.out.println(num);
			 return num;
			}
	
	//비밀번호 찾기   ----------------------------------------------------------
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/serchPassword.do", method = RequestMethod.GET)
	public String serchPasswordView() {
		return "/member/serchPassword.jsp";
	}
	
	//임시 비밀번호 이메일 전송
	@RequestMapping(value = "/findpassword.do", method = RequestMethod.POST)
	public String serchpassword(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("id") String id, @RequestParam("email") String email, MemberVO vo)
					throws MessagingException {
			HttpSession session = request.getSession();	
			
			vo.setId(id);
			vo.setEmail(email);
			String searchPassword = memberSerivce.checkIdEmail(vo);		//아이디, 이메일 체크해서 맞으면 생성된 임시 비밀번호 이메일 전송
			
			if(searchPassword == null) {								//아이디, 이메일 안맞을 경우 실패 페이지로 이동
				return "/member/serchPasswordFail.jsp";
			}
			
			String keyCode = MemberController.createKey();		//생성된 임시 비밀번호 메서드 호출 
			session.setAttribute("keyCode", keyCode);			//임시번호 세션 저장
	  
			 //실제 이메일에서 보여지는 글 작성
			 String setFrom = "dbsdk0070@gmail.com";
			 String toMail = email;
			 String title = "베스트립 임시 비밀번호 입니다.";
			 String content = "베스트립을 방문해주셔서 감사합니다." +
				  		   "<br><br>" +
				  		   "임시 비밀번호는 " + keyCode + "입니다." +		//임시 비밀번호 전송
				  		   "<br>" +
				  		   "해당 인증번호를 인증번호 확인란에 기입해주세요. \n" +
				  		   "비밀번호 변경은 마이페이지에서 가능합니다.";
			 
			 //메일 보내기
			 MimeMessage message = mailSender.createMimeMessage();
			 MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");	//Java mail API사용
			 helper.setFrom(setFrom);
			 helper.setTo(toMail);
			 helper.setSubject(title);
			 helper.setText(content,true);
			 mailSender.send(message);
			 
			 vo.setPassword(keyCode);						//호출한 임시 비밀번호(KeyCode) vo에 저장
			 String num = keyCode;							
			 System.out.println(num);
			 
			 memberSerivce.updatePWD(vo);					//저장된 임시 비밀번호로 업데이트(비밀번호 변경 업데이트 매퍼 가져
			 return "/member/serchPasswordSuccess.jsp";		//임시 비밀번호 이메일 발송 완료 페이지
			}

	//임시 비밀번호 인증 키 생성 메소드
	public static String createKey(){
		StringBuffer key = new StringBuffer();
		Random random = new Random();
		
		for(int i=0; i<10; i++) {
			int index = random.nextInt(3);
			
			switch(index) {
			case 0 :
				key.append((char) ((int) (random.nextInt(26)) + 97));
            	break;
			case 1 :
				key.append((char) ((int) (random.nextInt(26)) + 65));
				break;
			case 2:
				key.append((random.nextInt(10)));
				break;	
			}
		}
		System.out.println(key);
		return key.toString();
		
	}

	  //회원 정보 업데이트 --------------------------------------------------------
	  //로그인 유저 정보 상세 조회
	  @RequestMapping(value = "/updateView.do", method = RequestMethod.GET)
	  public String updateView(MemberVO vo, HttpServletRequest request, Model model){
		  
		  HttpSession session = request.getSession();
		  String loginId = (String) session.getAttribute("loginId");
		  System.out.println(">>" + loginId);
		   memberSerivce.viewmember(loginId);
		  
		  if(loginId.contains("@")) {
			  System.out.println("카카오 사용자찡");
			  model.addAttribute("email",session.getAttribute("email"));
			  model.addAttribute("id",session.getAttribute("email"));
			  model.addAttribute("name",session.getAttribute("nickname"));
			  
			  return "/myPage/updateView.jsp";
			  
		  } else {
			  model.addAttribute("updateView", memberSerivce.viewmember(loginId));
			  return "/myPage/updateView.jsp";
		  }
	  }
	  
	  //회원 정보 업데이트
	  @RequestMapping("/updateMember.do")
		public String updateMember(MemberVO vo, Model model, HttpServletRequest request) {

		 	memberSerivce.updateMyPage(vo);
		 	model.addAttribute("updateView", vo);
			System.out.println("update vo : " + vo);
			//이전 URL 값을 불러온다
		    String referer = request.getHeader("Referer");
		    //이전 URL에 쿠폰키를 같이 보낸다 (즉, 이전페이지로 돌아간다)
		    return "redirect:"+ referer;
		}	
	 
	   //비밀번호 업데이트
	   @RequestMapping(value = "/updatePwd.do", method = RequestMethod.POST)
	   public String updatePwd(@RequestParam("password") String password, HttpServletRequest request, MemberVO vo) {
	      HttpSession session = request.getSession();
	      String id = (String) session.getAttribute("loginId");
	      vo.setId(id);
	      vo.setPassword(password);
	      System.out.println(">>>>>>>>>>>>>" + vo);
	      memberSerivce.updatePwd(vo);
	        
	      //이전 URL 값을 불러온다
	       String referer = request.getHeader("Referer");
	       //이전 URL에 쿠폰키를 같이 보낸다 (즉, 이전페이지로 돌아간다)
	       return "redirect:"+ referer;
	   }
	   
	  //회원탈퇴
	  @RequestMapping("/deleteMember.do")
	  public String deleteMember(@RequestParam("password_check") String password) {
	     memberSerivce.deleteMember(password);
	     
	     return "./member/withDrawalSuccess.jsp";
	  }
	 

}
