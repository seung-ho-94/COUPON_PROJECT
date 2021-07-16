package com.spring.biz.customerservice.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.biz.customerservice.QnaCommentVO;
import com.spring.biz.customerservice.QnaService;
import com.spring.biz.customerservice.vo.ContactVO;
import com.spring.biz.customerservice.vo.QnaVO;

@Controller
public class QnaServiceController {
	@Autowired
	private QnaService qnaService;

	public QnaServiceController() {
	}
	
	//main에서 .do요청시 1대1문의 페이지로 보내기 (GET)
	@RequestMapping(value = "/setQna.do", method = RequestMethod.GET)
	public String setqnaView() {
		return "customer/insertQna.jsp";
	}
	
	//1대1문의 등록 (POST) 
	@RequestMapping(value = "/setQna.do", method = RequestMethod.POST)
	public String setqna(
			@RequestParam("email01") String email01,
			@RequestParam("email02") String email02,
			HttpServletRequest request,
			QnaVO vo) {
		//이메일값 불러와서 문자열 합치기
		String email = email01 + "@" + email02;
		vo.setEmail(email);
		
		//아이디 세션값 가져오기
		HttpSession session = request.getSession(true);
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		
		qnaService.setQna(vo);
		
		return "customer/insertQnaSuccess.jsp";
	}
	
	//main에서 .do요청시 1대1문의 페이지로 보내기 (GET)
	@RequestMapping(value = "/setcontact.do", method = RequestMethod.GET)
		public String contactView() {
			return "customer/contact.jsp";
		}
	
	//제휴문의 insert
	@RequestMapping(value = "/setcontact.do", method = RequestMethod.POST)
	public String contactsubmit(ContactVO vo, @RequestParam("title")String title) {
		
		System.out.println(vo);
		
		qnaService.contactinsert(vo);
		System.out.println(">>>DB 넣기 : " + vo);
		
		return "./main.jsp";
	}

	
	//1:1 문의 나의 문의내역 & 답변 select
   @RequestMapping(value = "/myqnare.do", method = RequestMethod.GET)
   public String myqnare(QnaCommentVO vo, HttpServletRequest request, Model model) {
      HttpSession session = request.getSession(true);
      String id = (String)session.getAttribute("loginId");
      
      //문의 리스트에 담기
      List<QnaVO> list = qnaService.qnaList(id);
      
      System.out.println("list :: " + list);
      //답변 리스트에 담기
      List<QnaCommentVO> volist = qnaService.qnaRe(id);
      
      model.addAttribute("list", list);
      model.addAttribute("volist", volist);
      return "myPage/myqnare.jsp";
   }
}


