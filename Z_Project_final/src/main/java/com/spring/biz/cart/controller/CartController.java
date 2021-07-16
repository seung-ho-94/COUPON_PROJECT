package com.spring.biz.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.biz.cart.service.CartService;
import com.spring.biz.cart.service.CartVO;
import com.spring.biz.cart.service.PurchaseVO;
import com.spring.biz.member.service.MemberVO;

@Controller
public class CartController {
   @Autowired
   private CartService cartService;
   
   @Autowired
   private JavaMailSender mailSender;
   
   //상품 상세 페이지에서 장바구니 담기 (찜하기)
   @RequestMapping("/mycart.do")
   public String myCartInsert(CartVO vo, @RequestParam("coupon_key") int coupon_key, 
         HttpServletRequest request, RedirectAttributes redirectAttributes) {
      System.out.println(vo);
      System.out.println("coupon_key : " + coupon_key);
      cartService.insertCart(vo, coupon_key);
      
      //쿠폰키를 다시 디테일 페이지로 보낸다
      redirectAttributes.addFlashAttribute("coupon_key", coupon_key);
      //이전 URL 값을 불러온다
       String referer = request.getHeader("Referer");
       //이전 URL에 쿠폰키를 같이 보낸다 (즉, 이전페이지로 돌아간다)
       return "redirect:"+ referer;
   }
   
   //상품 상세 페이지에서 결제 페이지로 바로이동
   @RequestMapping("/payment.do")
   public String payment(CartVO vo, Model model
         ,@RequestParam("id") String member_id 
         ,@RequestParam("total_price") String total_price
         ,@RequestParam("coupon_key") String coupon_key
         ,@RequestParam("quantity") String quantity
         , HttpServletRequest request
         ) {
      MemberVO membervo = cartService.selectUserInfo(member_id);
      HttpSession session = request.getSession();
	  String loginId = (String) session.getAttribute("loginId");
	  
	  System.out.println(coupon_key);
      Map<String, String> map = new HashMap<String, String>();
	  
      if(loginId.contains("@")) {
		  map.put("member_name", (String)session.getAttribute("nickname"));
	      map.put("member_email", (String)session.getAttribute("email"));
		  
	  } else {
	      map.put("member_name", membervo.getName());
	      map.put("member_email", membervo.getEmail());
	  }
      
      
      map.put("member_id", member_id);
      map.put("total_price", total_price);
      map.put("coupon_key", coupon_key);
      map.put("quantity", quantity);
      
      model.addAttribute("list", map);
      return "myPage/payment.jsp";
   }
   
   //----------------------------------------------------------------------------------
   
   // 마이페이지 -> 찜목록 (장바구니 리스트)
   @RequestMapping(value="/selectCartList.do", method=RequestMethod.GET)
   public String selectCartList(HttpSession session, Model model) {
      String id = (String) session.getAttribute("loginId");
      List<CartVO> cartList = cartService.selectCartList(id);
      model.addAttribute("cartList", cartList);
      return "/myPage/selectCartList.jsp";
   }
   
   // 마이페이지 -> 취소내역
   @RequestMapping(value="/deleteCartList.do", method=RequestMethod.GET)
   public String deleteCartList(HttpSession session, Model model) {
      String id = (String) session.getAttribute("loginId");
      List<PurchaseVO> cancelList = cartService.selectCancelList(id);
      model.addAttribute("cancelList", cancelList);
      return "/myPage/deleteCartList.jsp";
   }
   
   // 마이페이지 -> 구매내역
   @RequestMapping(value="/buyCartList.do", method=RequestMethod.GET)
   public String buyCartList(HttpSession session, Model model) {
      String id = (String) session.getAttribute("loginId");
      List<PurchaseVO> orderList = cartService.selectOrderList(id);
      model.addAttribute("orderList", orderList);
      return "/myPage/buyCartList.jsp";
   }
   
   // 마이페이지 -> 구매내역 (주문취소) cancelCoupon.do
   @RequestMapping(value="/cancelCoupon.do", method=RequestMethod.GET)
   public String cancelCoupon(int no, HttpSession session, Model model) {
      String id = (String) session.getAttribute("loginId");
      PurchaseVO purchaseVO = new PurchaseVO();
      purchaseVO.setId(id);
      purchaseVO.setNo(no);
      cartService.updateOrderList(purchaseVO);
      return "buyCartList.do";
   }
   
   
   // 장바구니 삭제
   @RequestMapping("/deleteCart.do")
   public String deleteCart(@RequestParam("no") int no, HttpSession session, Model model
         , RedirectAttributes redirectAttributes, HttpServletRequest request
         ) {
      cartService.deleteCart(no);
      String id = (String) session.getAttribute("loginId");
      List<CartVO> cartList = cartService.selectCartList(id);
      model.addAttribute("cartList", cartList);
      
      //쿠폰키를 다시 디테일 페이지로 보낸다
      redirectAttributes.addFlashAttribute("cartList", cartList);
      //이전 URL 값을 불러온다
       String referer = request.getHeader("Referer");
       //이전 URL에 쿠폰키를 같이 보낸다 (즉, 이전페이지로 돌아간다)
       return "redirect:"+ referer;
   }
   
   //----------------------------------------------------------------------------------
   
   // 카카오페이 결제창 이동과 필요한 데이터 전달
   @RequestMapping("/kakaopay.do")
   public String kakaopay(CartVO vo, Model model
         ,@RequestParam("id") String member_id 
         ,@RequestParam("total_price") String total_price
         ,@RequestParam("mop") String mop
         ,@RequestParam("coupon_key") String coupon_key
         ,@RequestParam("quantity") String quantity
         , HttpServletRequest request
         ) {
      MemberVO membervo = cartService.selectUserInfo(member_id);
      HttpSession session = request.getSession();
	  String loginId = (String) session.getAttribute("loginId");
	  
	  
      Map<String, String> map = new HashMap<String, String>();
      map.put("member_id", member_id);
      
      
      if(loginId.contains("@")) {
		  
		  map.put("member_name", (String)session.getAttribute("nickname"));
	      map.put("member_email", (String)session.getAttribute("email"));
		  
	  } else {
	      map.put("member_name", membervo.getName());
	      map.put("member_email", membervo.getEmail());
	  }
      
      map.put("total_price", total_price);
      map.put("mop", mop);
      map.put("coupon_key", coupon_key);
      map.put("quantity", quantity);
      
      model.addAttribute("list", map);
      return "myPage/kakaopay.jsp";
   }
   
   // 카카오페이 결제 성공시 데이터를 받아서 구매내역 테이블 (PURCHASE_LIST)에 insert, 페이지 이동
   @RequestMapping(value = "/insertPurchaseList.do", method = RequestMethod.GET)
   public String insertPurchaseList(PurchaseVO purchaseVO) {
      cartService.insertPurchase(purchaseVO);
      return "email_send.do";
   }
   
   //쿠폰 이메일 전송 ----------------------------------------------------------
   @RequestMapping(value = "/email_send.do", method = RequestMethod.GET)
   public String email_send(PurchaseVO vo) throws Exception {
     
       //인증번호(난수) 생성
       Random random = new Random();
       int checkNum = random.nextInt(888888) + 111111;
     
       //인증번호 이메일 전송
       String setFrom = "dbsdk0070@gmail.com";         //이메일 보내는 실제 아이디
       String toMail = vo.getEmail();                     //입력된 회원 이메일 주소
       String title = "베스트립 쿠폰 번호 전송 이메일입니다.";            //제목
       String content = "구입해주셔서 감사합니다." +      //내용
                    "<br><br>" +
                    "쿠폰 번호는 " + checkNum + "입니다.";
       try {
     
          MimeMessage message = mailSender.createMimeMessage();                     //MimeMessage : JAVA 메일API (단순 text 전송)
          MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");      //MimeMessageHelper : (MineMessage의 객체, Multipart여부, 인코딩 타입 ) 
          helper.setFrom(setFrom);
          helper.setTo(toMail);
          helper.setSubject(title);
          helper.setText(content,true);
          mailSender.send(message);
           
          }catch(Exception e) { e.printStackTrace(); }
       
       return "buyCartList.do";
   }
   
}



