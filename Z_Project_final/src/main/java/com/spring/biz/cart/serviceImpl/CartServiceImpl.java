package com.spring.biz.cart.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.cart.service.CartService;
import com.spring.biz.cart.service.CartVO;
import com.spring.biz.cart.service.PurchaseVO;
import com.spring.biz.member.service.MemberVO;


@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	
	public CartServiceImpl() {
	}
	
	@Override
	public void insertCart(CartVO vo, int coupon_key) {
		cartDAO.insertCart(vo, coupon_key);
	}

	@Override
	public MemberVO selectUserInfo(String member_id) {
		return cartDAO.selectUserInfo(member_id);
	}
	
	//마이페이지 -> 찜목록
	@Override
	public List<CartVO> selectCartList(String id) {
		return cartDAO.selectCartList(id);
	}
	
	//마이페이지 -> 구매내역
	@Override
	public List<PurchaseVO> selectOrderList(String id) {
		return cartDAO.selectOrderList(id);
	}
	
	//마이페이지 -> 구매내역 (주문취소 = STATUS UPDATE)
	@Override
	public void updateOrderList(PurchaseVO purchaseVO) {
		cartDAO.updateOrderList(purchaseVO);
		
	}
	
	//마이페이지 -> 취소내역
	@Override
	public List<PurchaseVO> selectCancelList(String id) {
		return cartDAO.selectCancelList(id);
	}
	
	//장바구니 목록 삭제
	@Override
	public void deleteCart(int no) {
		cartDAO.deleteCart(no);
		
	}

	@Override
	public int totalPrice(String id) {
		return cartDAO.totalPrice(id);
	}

	// 결제하기 (결제한 데이터 insert)
   @Override
   public void insertPurchase(PurchaseVO purchaseVO) {
      cartDAO.insertPurchase(purchaseVO);
      
   }
}
