package com.spring.biz.coupon.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.coupon.service.UserCouponVO;

@Repository
public class CouponDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//상품 카테고리 선택
	public List<UserCouponVO> categoryCoupon(UserCouponVO vo) {
		return mybatis.selectList("coupon.selectcategory", vo);
	}
	
	//지역 카테고리 베스트 3
	public List<String> bestCategoryCoupon(UserCouponVO vo){
		return mybatis.selectList("coupon.best2", vo);
	}
	
	//메인 상품 베스트3
	public List<UserCouponVO> mainbest(UserCouponVO vo){
		System.out.println(">>>>> DAO : " + vo);
		return mybatis.selectList("coupon.mainbest", vo);
	}
	
	// 지역 카테고리 선택
	public List<String> localCoupon(UserCouponVO vo) {
		return mybatis.selectList("coupon.selectLocal", vo);
	}
	
	//지역 카테고리 베스트 3
	public List<String> bestLocalCoupon(UserCouponVO vo){
		return mybatis.selectList("coupon.best", vo);
	}
	
	//상품 상세 조회 + 조회수 증가
	public UserCouponVO categoryDetailCoupon(UserCouponVO vo, int coupon_key) {
		mybatis.update("coupon.CouponHitUpdate", coupon_key);
		return mybatis.selectOne("coupon.detailCoupon", vo);
	}
	
	//사진찾기
	public String findImg(String local_category) {
		return mybatis.selectOne("coupon.findimg", local_category);
	}
	
	//정렬1 : 지역  + 카테고리
	public List<UserCouponVO> selectCategoryLocal(UserCouponVO vo){
		return mybatis.selectList("coupon.selectcategorylocal", vo);
	}
	
	//정렬2-1 : 조회순	---------------------------------지역 카테고리
	public List<UserCouponVO> sortClick(UserCouponVO vo){
		return mybatis.selectList("coupon.click", vo);
	}
	
	//정렬2-2 : 인기순
	public List<UserCouponVO> sortLike(UserCouponVO vo){
		return mybatis.selectList("coupon.like", vo);
	}
	
	//정렬2-3 : 낮은가격순
	public List<UserCouponVO> lowPrice(UserCouponVO vo){
		return mybatis.selectList("coupon.lowprice", vo);
	}
	
	//정렬2-4 : 높은가격순
	public List<UserCouponVO> hightPrice(UserCouponVO vo){
		return mybatis.selectList("coupon.hightprice", vo);
	}
	
	//정렬2-5 : 신상품순
	public List<UserCouponVO> newCoupon(UserCouponVO vo){
		return mybatis.selectList("coupon.newcoupon", vo);
	}
	
	//정렬2-2 : 조회순	---------------------------------상품 카테고리
	public List<UserCouponVO> sortClick2(UserCouponVO vo){
		return mybatis.selectList("coupon.click2", vo);
	}
	
	//정렬2-2 : 인기순
	public List<UserCouponVO> sortLike2(UserCouponVO vo){
		return mybatis.selectList("coupon.like2", vo);
	}
	
	//정렬2-3 : 낮은가격순
	public List<UserCouponVO> lowPrice2(UserCouponVO vo){
		return mybatis.selectList("coupon.lowprice2", vo);
	}
	
	//정렬2-4 : 높은가격순
	public List<UserCouponVO> hightPrice2(UserCouponVO vo){
		return mybatis.selectList("coupon.hightprice2", vo);
	}
	
	//정렬2-5 : 신상품순
	public List<UserCouponVO> newCoupon2(UserCouponVO vo){
		return mybatis.selectList("coupon.newcoupon2", vo);
	}
	
	//정렬3-1 : 날짜순	---------------------------------상품 카테고리
	public List<UserCouponVO> dateSort(UserCouponVO vo){
		return mybatis.selectList("coupon.datesort", vo);
	}
	
	//정렬3-2 : 날짜순	---------------------------------지역 카테고리
	public List<UserCouponVO> dateSort2(UserCouponVO vo){
		return mybatis.selectList("coupon.datesort2", vo);
	}
	
	//정렬3-3 : 날짜순	---------------------------------전체 쿠폰 리스트
	public List<UserCouponVO> dateSort3(UserCouponVO vo){
		 return mybatis.selectList("coupon.datesort3", vo);
	}
	
	//쿠폰 전체 검색(제목+내용) 최신순  -------------------------- 메인/전체
	public List<UserCouponVO> getsearchcoupon(String searchkeyword) {
		return mybatis.selectList("coupon.getsearchcoupon", searchkeyword);
	}		
	
	//지역 내에서 검색(제목+내용) 최신순  -------------------------- 지역 카테고리
	List<UserCouponVO> getsearchcoupon_Local(UserCouponVO vo){
		return mybatis.selectList("coupon.getsearchcoupon_Local", vo);
	}
	
	//카테고리 내에서 검색(제목+내용) 최신순  -------------------------- 카테고리별
	List<UserCouponVO> getsearchcoupon_category(UserCouponVO vo){
		return mybatis.selectList("coupon.getsearchcoupon_Category", vo);
	}
	
	//쿠폰 전체 리스트 페이지 - 최신순  ------------------------ 전체 쿠폰 리스트
	List<UserCouponVO> allcoupon(UserCouponVO vo){
		return mybatis.selectList("coupon.allcoupon", vo);
	}
	
	//조회순	-------------------------------------------- 전체 상품
	public List<UserCouponVO> sortClick3(UserCouponVO vo){
		return mybatis.selectList("coupon.click3", vo);
	}
	//인기순
	public List<UserCouponVO> sortLike3(UserCouponVO vo){
		return mybatis.selectList("coupon.like3", vo);
	}
	//낮은가격순
	public List<UserCouponVO> lowPrice3(UserCouponVO vo){
		return mybatis.selectList("coupon.lowprice3", vo);
	}
	//높은가격순
	public List<UserCouponVO> hightPrice3(UserCouponVO vo){
		return mybatis.selectList("coupon.hightprice3", vo);
	}
	//신상품순
	public List<UserCouponVO> newCoupon3(UserCouponVO vo){
		return mybatis.selectList("coupon.newcoupon3", vo);
	}
	
	//지도사용
	public List<UserCouponVO> mapList(){
		return mybatis.selectList("coupon.mapInfo");
	}
	
	public void insertSearchKeyword(String searchKeyword) {
		mybatis.insert("coupon.insertKeyword", searchKeyword);
	}
	
	//검색데이터 뽑아오기
	public List<HashMap<String, Object>> selectKeyword(){
		return mybatis.selectList("coupon.selectKeyword");
	}
}










