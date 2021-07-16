package com.spring.biz.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.biz.coupon.service.CouponService;
import com.spring.biz.coupon.service.DetailReviewService;
import com.spring.biz.coupon.service.DetatilReviewVO;
import com.spring.biz.coupon.service.UserCouponVO;


@Controller
public class DetailReviewController {
	
	@Autowired
	private DetailReviewService detailReviewService;
	
	//쿠폰 상세 리뷰(최신순)
	@RequestMapping(value = "/detailreview.do", method = RequestMethod.POST)
	public String detailreview(Model model, DetatilReviewVO vo, 
			@RequestParam("coupon_key") String coupon_key) {
		
		System.out.println(coupon_key);
		
		return "./main.jsp";
	}
	

	
}










