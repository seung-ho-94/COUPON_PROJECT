package com.spring.biz.coupon.controller;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/*
import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;*/
import com.spring.biz.coupon.service.CouponService;
import com.spring.biz.coupon.service.DetailReviewService;
import com.spring.biz.coupon.service.DetatilReviewVO;
import com.spring.biz.coupon.service.UserCouponVO;


@Controller
public class CouponController {
	
	@Autowired
	private CouponService couponService;

	@Autowired
	private DetailReviewService detailReviewService;
	
	//메인에서 카테고리 클릭했을 때 해당 카테고리로 페이지 이동 + 베스트 추천상품 3개
	@RequestMapping(value = "/categorycoupon.do", method = RequestMethod.GET)
	public String categorycoupon(@RequestParam("coupon_category") String coupon_category,
			UserCouponVO vo, Model model) {
		
		vo.setCoupon_category(coupon_category);
		
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestCategoryCoupon(vo));
		//카테고리값을 보내서 지역정렬할때 쓰기
		model.addAttribute("cate", vo.getCoupon_category());
		//입력한 카테고리 값을 기준으로 리스트 객체 전달
		model.addAttribute("list", couponService.categoryCoupon(vo));
			
		return "coupon/categoryCoupon.jsp";
	}
	
	//메인에서 지역 클릭했을 때 해당 지역으로 페이지 이동 + 베스트 추천상품 3개
	@RequestMapping(value = "/localcoupon.do", method = RequestMethod.GET)
	public String localcoupon(@RequestParam("local_category") String local_category,
			UserCouponVO vo, Model model) {
		
		vo.setLocal_category(local_category);
		vo.setAttach_file2(couponService.findImg(local_category));
		//배너찾기
		model.addAttribute("img", vo.getAttach_file2());
		//로컬카테고리 이름을 가져다쓰기위한 객체
		model.addAttribute("local_category",local_category);
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestLocalCoupon(vo));
		//입력한 카테고리 값을 기준으로 리스트 객체 전달
		model.addAttribute("list", couponService.localCoupon(vo));
		return "coupon/localCoupon.jsp";
	}
	
	//메인 베스트 추천 상품 3개 (좋아요순)
    @ResponseBody						//java에서 JSON으로 객체 넘길 때 꼭 필요, 반대로 JSON에서 java로 객체 넘길 때도 필요
	@RequestMapping("/mainbest.do")
	//@ResponseBody // response 객체의 몸체(body)에 데이터 전달
	public List<UserCouponVO> mainbest(UserCouponVO vo) {
		List<UserCouponVO> bestlist = couponService.mainbest(vo);
		
		return bestlist;
	}
	 
	//카테고리페이지 상품리스트에서 상세보기 
	@RequestMapping("couponDetail.do")
	public String detailCoupon(@RequestParam("coupon_key") int coupon_key,
			UserCouponVO vo, DetatilReviewVO detatilReviewVO, Model model) {
		
		vo.setCoupon_key(coupon_key);
		
		UserCouponVO listDetail = couponService.categoryDetailCoupon(vo, coupon_key);
		List<DetatilReviewVO> reviewlist = detailReviewService.detailreview(coupon_key);
		
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("listDetail", listDetail);
		
		return "coupon/couponDetails.jsp";
	}
	
	//------------------------------------------------------------
	//정렬1 : 카테고리페이지에서 지역 추가 검색하기
	@RequestMapping(value = "/categorycouponselectlocal.do", method = RequestMethod.GET)
	public String categoryselectlocal(
			@RequestParam("local_category") String local_category,
			@RequestParam("coupon_category") String coupon_category,
			UserCouponVO vo, Model model) {
		
		vo.setCoupon_category(coupon_category);
		vo.setLocal_category(local_category);
		
		String sortname = local_category + " + " + coupon_category;
		
		vo.setLocal_category(local_category);
		vo.setAttach_file2(couponService.findImg(local_category));
		//배너찾기
		model.addAttribute("img", vo.getAttach_file2());
		//로컬카테고리 이름을 가져다쓰기위한 객체
		model.addAttribute("local_category",local_category);
		//로컬카테고리 이름을 가져다쓰기위한 객체
		model.addAttribute("local_category",local_category);
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestLocalCoupon(vo));
		//무슨 정렬중인지 표시
		model.addAttribute("sort", sortname);
		//입력한 카테고리 값을 기준으로 리스트 객체 전달
		model.addAttribute("list", couponService.selectCategoryLocal(vo));
		return "coupon/localCoupon.jsp";
	}
	
	//정렬2 : 조회순~신상품순으로 정렬하기- 지역
	@RequestMapping("/sortlocal.do")
	public String sort(Model model, UserCouponVO vo,
			@RequestParam("local_category") String local_category, 
			@RequestParam("sortname") String sortname
			) {
		
		vo.setLocal_category(local_category);
		switch(sortname) {
		case "조회순" : model.addAttribute("list", couponService.sortClick(vo)); break;
		case "인기순": model.addAttribute("list", couponService.sortLike(vo)); break;
		case "낮은가격순": model.addAttribute("list", couponService.lowPrice(vo)); break;
		case "높은가격순": model.addAttribute("list", couponService.hightPrice(vo)); break;
		case "신상품순": model.addAttribute("list", couponService.newCoupon(vo)); break;
		}
		
		vo.setLocal_category(local_category);
		vo.setAttach_file2(couponService.findImg(local_category));
		//배너찾기
		model.addAttribute("img", vo.getAttach_file2());
		//로컬카테고리 이름을 가져다쓰기위한 객체
		model.addAttribute("local_category",local_category);
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestLocalCoupon(vo));
		//무슨 정렬중인지 표시
		model.addAttribute("sort", sortname);
		return "coupon/localCoupon.jsp";
	}
	
	//정렬2 : 조회순~신상품순으로 정렬하기 - 상품(카테고리)
	@RequestMapping("/sortcategory.do")
	public String sort2(Model model, UserCouponVO vo,
			@RequestParam("coupon_category") String coupon_category,
			@RequestParam("sortname") String sortname
			) {
		
		vo.setCoupon_category(coupon_category);
		switch(sortname) {
		case "조회순" : model.addAttribute("list", couponService.sortClick2(vo)); break;
		case "인기순": model.addAttribute("list", couponService.sortLike2(vo)); break;
		case "낮은가격순": model.addAttribute("list", couponService.lowPrice2(vo)); break;
		case "높은가격순": model.addAttribute("list", couponService.hightPrice2(vo)); break;
		case "신상품순": model.addAttribute("list", couponService.newCoupon2(vo)); break;
		}
		
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestCategoryCoupon(vo));
		//무슨 정렬중인지 표시
		model.addAttribute("sort", sortname);
		//카테고리값을  다시 보내서 지역정렬할때 쓰기
		model.addAttribute("cate", vo.getCoupon_category());
				
		return "coupon/categoryCoupon.jsp";
	}
	
	//정렬2 : 조회순~신상품순으로 정렬하기 - 전체 상품
		@RequestMapping("/sortallcoupon.do")
		public String sort2(Model model, UserCouponVO vo,
				@RequestParam("sortname") String sortname
				) {
			
			vo.setCoupon_category(sortname);
			switch(sortname) {
			case "조회순" : model.addAttribute("list", couponService.sortClick3(vo)); break;
			case "인기순": model.addAttribute("list", couponService.sortLike3(vo)); break;
			case "낮은가격순": model.addAttribute("list", couponService.lowPrice3(vo)); break;
			case "높은가격순": model.addAttribute("list", couponService.hightPrice3(vo)); break;
			case "신상품순": model.addAttribute("list", couponService.newCoupon3(vo)); break;
			}
			
			//무슨 정렬중인지 표시
			model.addAttribute("sort", sortname);

			return "coupon/allCoupon.jsp";
		}
	
	//정렬3 : 해당날짜가 포함되는지 여부에 따라 정렬하기 - 상품(카테고리)
	@RequestMapping("/datego.do")
	public String datepic(
			@RequestParam("coupon_category") String coupon_category,
			@RequestParam("sortname") Date date,
			UserCouponVO vo,
			Model model) {
//        Date d = Date.valueOf(date);
		vo.setFirst_date(date);
		vo.setCoupon_category(coupon_category);
		
		//날짜정렬
		model.addAttribute("list", couponService.dateSort(vo));
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestCategoryCoupon(vo));
		//무슨 정렬중인지 표시
		model.addAttribute("sort", date);
		//카테고리값을  다시 보내서 정렬할때 쓰기
		model.addAttribute("cate", vo.getCoupon_category());
		
		return "coupon/categoryCoupon.jsp";
	}
	
	//정렬3 : 해당날짜가 포함되는지 여부에 따라 정렬하기 - 지역
	@RequestMapping("/datego2.do")
	public String datepic2(
			@RequestParam("local_category") String local_category,
			@RequestParam("sortname") Date date,
			UserCouponVO vo,
			Model model) {
		
		vo.setFirst_date(date);
		vo.setLocal_category(local_category);
		
		vo.setLocal_category(local_category);
		vo.setAttach_file2(couponService.findImg(local_category));
		//배너찾기
		model.addAttribute("img", vo.getAttach_file2());
		//로컬카테고리 이름을 가져다쓰기위한 객체
		model.addAttribute("local_category",local_category);
		//날짜정렬
		model.addAttribute("list", couponService.dateSort2(vo));
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestLocalCoupon(vo));
		//무슨 정렬중인지 표시
		model.addAttribute("sort", date);
		return "coupon/localCoupon.jsp";
	}
	
	//정렬3 : 해당날짜가 포함되는지 여부에 따라 정렬하기 - 전체 쿠폰 리스트
		@RequestMapping("/datego3.do")
		public String datepic3(
				@RequestParam("sortname") Date date,
				UserCouponVO vo,
				Model model) {
			
			vo.setFirst_date(date);
			
			//날짜정렬
			model.addAttribute("list", couponService.dateSort3(vo));
			//무슨 정렬중인지 표시
			model.addAttribute("sort", date);
			
			return "coupon/allCoupon.jsp";
		}
	
	//------------------------------------------------------------
	//쿠폰 상품 전체 보기
	@RequestMapping(value = "/allcoupon.do", method = RequestMethod.GET)
	public String allcoupon(Model model, UserCouponVO vo) {
		List<UserCouponVO> list = couponService.allcoupon(vo);
		
		//전체 쿠폰 리스트
		model.addAttribute("list", list);
		return "coupon/allCoupon.jsp";		//메인에서 Book new 클릭하면 나오는 쿠폰 전체 리스트 페이지
	}
	
	//정렬1 : 지역 정렬 - 전체 상품
	@RequestMapping("/alllocal.do")
	public String alllocal(Model model, UserCouponVO vo,
			@RequestParam("local_category") String local_category) {
		vo.setLocal_category(local_category);
		
		//무슨 정렬중인지 표시
		model.addAttribute("sort", local_category);
		//전체 지역 리스트
		model.addAttribute("list", couponService.localCoupon(vo));

		return "coupon/allCoupon.jsp";
	}
	
	//정렬1 : 카테고리 정렬 - 전체 상품
	@RequestMapping("/allcategory.do")
	public String allcategory(Model model, UserCouponVO vo,
			@RequestParam("coupon_category") String coupon_category) {
		vo.setCoupon_category(coupon_category);
		
		//무슨 정렬중인지 표시
		model.addAttribute("sort", coupon_category);
		//전체 카테고리 리스트
		model.addAttribute("list", couponService.categoryCoupon(vo));
		

		return "coupon/allCoupon.jsp";
	}
	//-------------------------------------------------------------------------------------------------------------------------
	//쿠폰 전체 검색(제목+내용) 최신순 : 메인/전체
	@RequestMapping(value = "/searchkeywordall.do", method = RequestMethod.GET)
	public String getsearchcoupon(@RequestParam("searchkeyword") String searchkeyword,
			Model model, UserCouponVO vo){
		
		vo.setName(searchkeyword);
		vo.setContent(searchkeyword);
		
		//검색어 테이블에 담기
		couponService.insertSearchKeyword(searchkeyword);
		
		List<UserCouponVO> searchlist = couponService.getsearchcoupon(searchkeyword);
		System.out.println(">>>>>list : " +  searchlist);
		model.addAttribute("sort", searchkeyword);
		model.addAttribute("list", searchlist);

		return "coupon/allCoupon.jsp";		//전체 검색 페이지로 이동
	}
	
	//지역 내에서 검색(제목+내용) 최신순  : 지역 카테고리
	@RequestMapping(value = "/getsearchcoupon_Local.do", method = RequestMethod.GET)
	public String getsearchcoupon_Local(
			@RequestParam("searchkeyword") String searchkeyword,
		    @RequestParam("local_category") String local_category, Model model, UserCouponVO vo){
		
		vo.setLocal_category(local_category);
		vo.setName(searchkeyword);
		vo.setContent(searchkeyword);
		
		//검색어 테이블에 담기
		couponService.insertSearchKeyword(searchkeyword);
		
		List<UserCouponVO> searchlist = couponService.getsearchcoupon_Local(vo);

		vo.setLocal_category(local_category);
		vo.setAttach_file2(couponService.findImg(local_category));
		//배너찾기
		model.addAttribute("img", vo.getAttach_file2());
		//로컬카테고리 이름을 가져다쓰기위한 객체
		model.addAttribute("local_category",local_category);
		//정렬 조건
		model.addAttribute("sort", searchkeyword);
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestLocalCoupon(vo));
		//지역 검색 리스트
		model.addAttribute("list", searchlist);
		System.out.println(">>>>>list : " +  searchlist);

		return "coupon/localCoupon.jsp";		//지역 페이지로 이동
	}
	
	//카테고리 내에서 검색(제목+내용) 최신순  : 카테고리별
	@RequestMapping(value = "/getsearchcoupon_Category.do", method = RequestMethod.GET)
	public String getsearchcoupon_Category(
		@RequestParam("searchkeyword") String searchkeyword,
	    @RequestParam("coupon_category") String coupon_category, Model model, UserCouponVO vo){
	
		vo.setCoupon_category(coupon_category);
		vo.setName(searchkeyword);
		vo.setContent(searchkeyword);
		
		//검색어 테이블에 담기
		couponService.insertSearchKeyword(searchkeyword);
		
		List<UserCouponVO> searchlist = couponService.getsearchcoupon_category(vo);
		
		//정렬 조건
		model.addAttribute("sort", searchkeyword);
		//베스트 추천상품 3개
		model.addAttribute("bestlist", couponService.bestCategoryCoupon(vo));
		//카테고리 검색 리스트
		model.addAttribute("list", searchlist);
		//카테고리값을 다시 보내서 검색할 때 쓰기
		model.addAttribute("cate", vo.getCoupon_category());
		 
		return "coupon/categoryCoupon.jsp";		//지역 페이지로 이동
	}
	//-------------------------------------------------------------------------------------------------------------------------	
	//쿠폰 지도사용하기
	@RequestMapping("/mapListInfo.do")
	public String mapList(Model model, UserCouponVO vo) {
		
		//지도 마커 생성을 위해 검색 정보를 불러오기
		model.addAttribute("list",couponService.mapList());
		
		return "coupon/map.jsp";
	}
	
	//상위 키워드 5개 뽑아서 데이터 시각화
	@ResponseBody
	@RequestMapping("searchKey.do")
	public List<HashMap<String, Object>> searchList(){

		List<HashMap<String, Object>> listKey = couponService.selectKeyword();
		
		return listKey;
	}
	
	 
}

