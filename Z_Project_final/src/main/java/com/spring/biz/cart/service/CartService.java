package com.spring.biz.cart.service;

import java.util.List;

import com.spring.biz.member.service.MemberVO;

public interface CartService {
	
	//상품 상세페이지에서 상품 장바구니에 담기 + 담으면 like_count(찜) + 1
	public void insertCart(CartVO vo, int coupon_key);
	//결제를 위한 유저의 정보 가져오기
	public MemberVO selectUserInfo(String member_id);
	//마이페이지 -> 찜목록
	public List<CartVO> selectCartList(String id);
	//마이페이지 -> 구매내역
	public List<PurchaseVO> selectOrderList(String id);
	//마이페이지 -> 구매내역 (주문취소 = STATUS UPDATE)
	public void updateOrderList(PurchaseVO purchaseVO);
	//마이페이지 -> 취소내역
	public List<PurchaseVO> selectCancelList(String id);
	//장바구니 목록 삭제
	public void deleteCart(int no);
	
	public int totalPrice(String id);
	
	 // 결제하기 (결제한 데이터 insert)
	 public void insertPurchase(PurchaseVO purchaseVO);
}
