package com.spring.biz.coupon.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.coupon.service.CouponService;
import com.spring.biz.coupon.service.UserCouponVO;

@Service("couponService")
public class CouponServiceImpl implements CouponService {
	@Autowired
	private	CouponDAO couponDAO;
	
	public CouponServiceImpl() {
	}
	
	//쿠폰상세페이지 이동 + 조회수 증가
	@Override
	public UserCouponVO categoryDetailCoupon(UserCouponVO vo, int coupon_key) {
		return couponDAO.categoryDetailCoupon(vo, coupon_key);
	}
	
	//카테고리 클릭하면 카테고리 페이지로 이동
	@Override
	public List<UserCouponVO> categoryCoupon(UserCouponVO vo) {
		return couponDAO.categoryCoupon(vo);
	}
	
	//상품 카테고리 베스트 3
	@Override
	public List<String> bestCategoryCoupon(UserCouponVO vo) {
		return couponDAO.bestCategoryCoupon(vo);
	}
	
	//메인 상품 베스트3
	@Override
	public List<UserCouponVO> mainbest(UserCouponVO vo) {
		return couponDAO.mainbest(vo);
	}
	
	//지역 클릭하면 지역페이지로 이동
	@Override
	public List<String> localCoupon(UserCouponVO vo) {
		return couponDAO.localCoupon(vo);
	}
	
	//지역 카테고리 베스트 3
	@Override
	public List<String> bestLocalCoupon(UserCouponVO vo) {
		return couponDAO.bestLocalCoupon(vo);
	}
	
	//이미지 찾기
	@Override
	public String findImg(String local_category) {
		return couponDAO.findImg(local_category);
	}
	
	//지역+카테고리 정렬
	@Override
	public List<UserCouponVO> selectCategoryLocal(UserCouponVO vo) {
		return couponDAO.selectCategoryLocal(vo);
	}
	
	//정렬2-1 : 조회순	---------------------------------지역 카테고리
	@Override
	public List<UserCouponVO> sortClick(UserCouponVO vo) {
		return couponDAO.sortClick(vo);
	}
	//정렬2-2 : 인기순
	@Override
	public List<UserCouponVO> sortLike(UserCouponVO vo) {
		return couponDAO.sortLike(vo);
	}

	//정렬2-3 : 낮은가격순
	@Override
	public List<UserCouponVO> lowPrice(UserCouponVO vo) {
		return couponDAO.lowPrice(vo);
	}

	//정렬2-4 : 높은가격순
	@Override
	public List<UserCouponVO> hightPrice(UserCouponVO vo) {
		return couponDAO.hightPrice(vo);
	}

	//정렬2-5 : 신상품순
	@Override
	public List<UserCouponVO> newCoupon(UserCouponVO vo) {
		return couponDAO.newCoupon(vo);
	}

	//정렬2-2 : 조회순	---------------------------------상품 카테고리
	@Override
	public List<UserCouponVO> sortClick2(UserCouponVO vo) {
		return couponDAO.sortClick2(vo);
	}
	//정렬2-2 : 인기순
	@Override
	public List<UserCouponVO> sortLike2(UserCouponVO vo) {
		return couponDAO.sortLike2(vo);
	}

	//정렬2-3 : 낮은가격순
	@Override
	public List<UserCouponVO> lowPrice2(UserCouponVO vo) {
		return couponDAO.lowPrice2(vo);
	}

	//정렬2-4 : 높은가격순
	@Override
	public List<UserCouponVO> hightPrice2(UserCouponVO vo) {
		return couponDAO.hightPrice2(vo);
	}

	//정렬2-5 : 신상품순
	@Override
	public List<UserCouponVO> newCoupon2(UserCouponVO vo) {
		return couponDAO.newCoupon2(vo);
	}

	//정렬3-2 : 날짜순	---------------------------------상품 카테고리
	@Override
	public List<UserCouponVO> dateSort(UserCouponVO vo) {
		return couponDAO.dateSort(vo);
	}

	//정렬3-2 : 날짜순	---------------------------------지역 카테고리
	@Override
	public List<UserCouponVO> dateSort2(UserCouponVO vo) {
		return couponDAO.dateSort2(vo);
	}
	//정렬3-2 : 날짜순	---------------------------------전체 상품 리스트
	@Override
	public List<UserCouponVO> dateSort3(UserCouponVO vo) {
		return couponDAO.dateSort3(vo);
	}
	
	//쿠폰 전체 검색(제목+내용) 최신순  -------------------------- 메인/전체
	public List<UserCouponVO> getsearchcoupon(String searchkeyword) {
		return couponDAO.getsearchcoupon(searchkeyword);
	}
	
	//지역 내에서 검색(제목+내용) 최신순  -------------------------- 지역 카테고리
	@Override
	public List<UserCouponVO> getsearchcoupon_Local(UserCouponVO vo) {
		return couponDAO.getsearchcoupon_Local(vo);
	}	
	
	//카테고리 내에서 검색(제목+내용) 최신순  -------------------------- 카테고리별
	@Override
	public List<UserCouponVO> getsearchcoupon_category(UserCouponVO vo) {
		return couponDAO.getsearchcoupon_category(vo);
	}
	
	//쿠폰 전체 리스트 페이지 - 최신순  ------------------------ 전체 쿠폰 리스트
	@Override
	public List<UserCouponVO> allcoupon(UserCouponVO vo) {
		return couponDAO.allcoupon(vo);
	}
	
	//조회순	-------------------------------------------- 전체 상품
	@Override
	public List<UserCouponVO> sortClick3(UserCouponVO vo){
		return couponDAO.sortClick3(vo);
	}
	//인기순
	@Override
	public List<UserCouponVO> sortLike3(UserCouponVO vo){
		return couponDAO.sortLike3(vo);
	}
	
	//낮은가격순
	@Override
	public List<UserCouponVO> lowPrice3(UserCouponVO vo){
		return couponDAO.lowPrice3(vo);
	}
	
	//높은가격순
	@Override
	public List<UserCouponVO> hightPrice3(UserCouponVO vo){
		return couponDAO.hightPrice3(vo);
	}
	//신상품순
	@Override
	public List<UserCouponVO> newCoupon3(UserCouponVO vo){
		return couponDAO.newCoupon3(vo);
	}
	
	//지도사용
	@Override
	public List<UserCouponVO> mapList(){
		return couponDAO.mapList();
	}
	
	//검색을 할때마다 SEARCH_KEYWORD에 인서트
	@Override
	public void insertSearchKeyword(String searchKeyword) {
		couponDAO.insertSearchKeyword(searchKeyword);
	}

	//검색데이터 뽑아오기
	@Override
	public List<HashMap<String, Object>> selectKeyword() {
		return couponDAO.selectKeyword();
	}
	
	
}
