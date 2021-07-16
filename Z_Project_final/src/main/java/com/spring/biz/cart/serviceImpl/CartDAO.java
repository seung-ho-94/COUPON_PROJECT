package com.spring.biz.cart.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.cart.service.CartVO;
import com.spring.biz.cart.service.PurchaseVO;
import com.spring.biz.member.service.MemberVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartDAO() {
	}
	
	//상품 상세페이지에서 상품 장바구니에 담기 + 담으면 like_count(찜) + 1
	public void insertCart(CartVO vo, int coupon_key) {
		mybatis.update("cart.likeCountUpdate", coupon_key);
		mybatis.insert("cart.mycartinsert", vo);
	}
	
	//결제를 위한 회원정보 뽑아오기
	public MemberVO selectUserInfo(String member_id) {
		return mybatis.selectOne("cart.userInfo", member_id);
	}
	
	//마이페이지 -> 찜목록
	public List<CartVO> selectCartList(String id) {
		return mybatis.selectList("cart.selectCartList", id);
	}
	//마이페이지 -> 찜 목록 삭제
	public void deleteCart(int no) {
		mybatis.delete("cart.deleteCart", no);
	}
	
	//마이페이지 -> 구매내역
	public List<PurchaseVO> selectOrderList(String id) {
		return mybatis.selectList("cart.selectOrderList", id);
	}
	
	//마이페이지 -> 구매내역 (주문취소 = STATUS UPDATE)
	public void updateOrderList(PurchaseVO purchaseVO) {
		mybatis.update("cart.updateOrderList", purchaseVO);
	}
	
	//마이페이지 -> 취소내역
	public List<PurchaseVO> selectCancelList(String id) {
		return mybatis.selectList("cart.selectCancelList", id);
	}
	
	public int totalPrice(String id) {
		return mybatis.selectOne("cart.totalPrice", id);
	}
	
	 // 결제하기 (결제한 데이터 insert)
   public void insertPurchase(PurchaseVO purchaseVO) {
	  mybatis.update("cart.updateUpload_count", purchaseVO);
      mybatis.insert("cart.insertPurchase", purchaseVO);
   }
}
