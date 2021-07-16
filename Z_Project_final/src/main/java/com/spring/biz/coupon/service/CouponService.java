package com.spring.biz.coupon.service;

import java.util.HashMap;
import java.util.List;

public interface CouponService {

	//상품 카테고리 선택
	public List<UserCouponVO> categoryCoupon(UserCouponVO vo);
	//상품 카테고리 베스트 3
	public List<String> bestCategoryCoupon(UserCouponVO vo);
	//메인 상품 베스트3
	public List<UserCouponVO> mainbest(UserCouponVO vo);
	//지역 카테고리 선택
	public List<String> localCoupon(UserCouponVO vo);
	//지역 카테고리 베스트 3
	public List<String> bestLocalCoupon(UserCouponVO vo);
	//상품 상세보기 + 조회수 증가
	public UserCouponVO categoryDetailCoupon(UserCouponVO vo, int coupon_key);
	//사진 찾기
	public String findImg(String local_category);
	//정렬1 : 지역+카테고리 정렬
	public List<UserCouponVO> selectCategoryLocal(UserCouponVO vo);
	
	//조회순	-----------------------------------------지역 카테고리
	public List<UserCouponVO> sortClick(UserCouponVO vo);
	//인기순
	public List<UserCouponVO> sortLike(UserCouponVO vo);
	//낮은가격순
	public List<UserCouponVO> lowPrice(UserCouponVO vo);
	//정높은가격순
	public List<UserCouponVO> hightPrice(UserCouponVO vo);
	//신상품순
	public List<UserCouponVO> newCoupon(UserCouponVO vo);
	
	//조회순	-----------------------------------------상품 카테고리
	public List<UserCouponVO> sortClick2(UserCouponVO vo);
	//인기순
	public List<UserCouponVO> sortLike2(UserCouponVO vo);
	//낮은가격순
	public List<UserCouponVO> lowPrice2(UserCouponVO vo);
	//높은가격순
	public List<UserCouponVO> hightPrice2(UserCouponVO vo);
	//신상품순
	public List<UserCouponVO> newCoupon2(UserCouponVO vo);
	
	//날짜---------------------------------------------상품 카테고리
	public List<UserCouponVO> dateSort(UserCouponVO vo);
	//날짜---------------------------------------------지역 카테고리
	public List<UserCouponVO> dateSort2(UserCouponVO vo);
	//날짜---------------------------------------------전체 쿠폰 리스트
	public List<UserCouponVO> dateSort3(UserCouponVO vo);
	
	//조회순	-------------------------------------------- 전체 상품
	public List<UserCouponVO> sortClick3(UserCouponVO vo);
	//인기순
	public List<UserCouponVO> sortLike3(UserCouponVO vo);
	//낮은가격순
	public List<UserCouponVO> lowPrice3(UserCouponVO vo);
	//높은가격순
	public List<UserCouponVO> hightPrice3(UserCouponVO vo);
	//신상품순
	public List<UserCouponVO> newCoupon3(UserCouponVO vo);
	
	//전체 검색(제목+내용) 최신순  -------------------------- 메인/전체
	public List<UserCouponVO> getsearchcoupon(String searchkeyword);
	
	//지역 내에서 검색(제목+내용) 최신순  -------------------------- 지역 카테고리
	public List<UserCouponVO> getsearchcoupon_Local(UserCouponVO vo);
	
	//카테고리 내에서 검색(제목+내용) 최신순  ------------------------ 카테고리별
	public List<UserCouponVO> getsearchcoupon_category(UserCouponVO vo);
	
	//쿠폰 전체 리스트 페이지 - 최신순  ------------------------ 전체 쿠폰 리스트
	public List<UserCouponVO> allcoupon(UserCouponVO vo);
	
	//지도사용
	public List<UserCouponVO> mapList();
	
	//검색을 할때마다 SEARCH_KEYWORD에 인서트
	public void insertSearchKeyword(String searchKeyword);
	
	//검색데이터 뽑아오기
	public List<HashMap<String, Object>> selectKeyword();
}




