package com.spring.biz.admin.service;

import java.util.List;

import com.spring.biz.cart.service.PurchaseVO;
import com.spring.biz.common.PagingVO;
import com.spring.biz.community.service.CommunityVO;

// 관리자 서비스 인터페이스
public interface AdminService {
	// 관리자 로그인 관련
	public AdminVO adminLogin(AdminVO adminVO);

	// ==============================================================

	// '상품관리' >> '상품수정/삭제 전체 리스트'(쿠폰)
	public List<CouponVO> selectAllCoupon();

	// '상품관리' >> '상품수정 상세'(쿠폰)
	public CouponVO selectOneCoupon(int coupon_key);

	// '상품관리' >> '상품등록'(쿠폰)
	public void insertCoupon(CouponVO couponVO);

	// '상품관리' >> '상품수정/삭제' >> 상품 수정(쿠폰)
	public void updateCoupon(CouponVO couponVO);

	// '상품관리' >> '상품수정/삭제' >> 상품 삭제(쿠폰)
	public void deleteCoupon(int coupon_key);

	// ==============================================================

	// '고객센터' >> '자주하는 질문' 눌렀을 때 category 가져오기
	public List<String> selectCateFAQ();

	// '고객센터' >> '자주하는 질문'에서 XX문의 눌렀을 때 selectAllFAQ
	public List<FAQVO> selectAllFAQ(String category);

	// '고객센터' >> '자주하는 질문'에서 수정 눌렀을 때 selectOneFAQ
	public FAQVO selectOneFAQ(int no);

	// '고객센터' >> '자주하는 질문' 등록 insertFAQ
	public void insertFAQ(FAQVO faqVO);

	// '고객센터' >> '자주하는 질문' 수정 updateFAQ
	public void updateFAQ(FAQVO faqVO);

	// '고객센터' >> '자주하는 질문' 삭제 deleteFAQ
	public void deleteFAQ(int no);

	// ==============================================================

	// '고객센터' >> '1:1문의' 눌렀을 때 status 가져오기
	public List<String> selectStatusQNA();

	// '고객센터' >> '1:1문의' >> '답변/미답변'을 눌렀을 때 내용 추출
	public List<QNAVO> selectAllQNA(String status);

	// '고객센터' >> '1:1문의' >> '답변/미답변'을 눌렀을 때 내용 추출
	public void qnaUpdateStatusTrue(int no);

	// ==============================================================
	
	// 회원관리
	public List<AdminMemberVO> getMemberList(AdminMemberVO vo);

	// 회원상태
	public void memberStatus(AdminMemberVO vo);
	
	// 회원삭제
	public void deleteMemberList(String id);

	// ==============================================================
	
	// 게시글 상세보기
	AdminNoticeVO getBoard(AdminNoticeVO vo, int num);

	// 공지사항의 게시물 총 갯수
	public int countBoard(PagingVO vo);

	// 페이징 처리 후 공지사항
	public List<AdminNoticeVO> selectBoard(PagingVO vo);

	// 공지사항 insert
	public void insertNotice(AdminNoticeVO vo);

	// 공지사항 delete
	public void deleteNotice(AdminNoticeVO vo);

	// 공지사항 update
	public void updateNotice(AdminNoticeVO vo);

	// qna 상세보기
	public QNAVO qnaGetBoard(QNAVO vo);
	
	// qna 삭제 getboard
	public void qnaDeleteGetboard(int no);

	// qna 댓글 목록
	public List<QnaCommentVO> qnaCommentlist(int q_no);

	// qna 댓글 생성
	public void qnaInsertComment(QnaCommentVO vo);

	// qna 댓글 선택
	public QnaCommentVO qnaselectOneComment(int no);

	// qna 댓글 수정
	public void qnaUpdateComment(QnaCommentVO vo);

	// qna 댓글 삭제
	public void qnaDeleteComment(int no);

	// 관리자 커뮤니티
	public List<CommunityVO> adminCommunityList(PagingVO vo);

	// 관리자 커뮤니티 글삭제
	public void deleteCommunity(CommunityVO vo);

	// 관리자 커뮤니티 insert
	public void insertCommunity(CommunityVO vo);

	// 관리자 커뮤니티 총 갯수
	public int adminCommunityCount(PagingVO vo);

	// 관리자 커뮤니티 상세보기
	public CommunityVO getCommunityBoard(CommunityVO vo, int num);

	// 주문내역
	public List<PurchaseVO> adminOrderList(PurchaseVO vo);

	// 주문내역 update
	public void orderStatus(PurchaseVO vo);

	// 제휴문의
	public List<ContactVO> contactList();

	// 제휴문의 상세보기
	public ContactVO contactGetBoard(ContactVO vo);
	
	// ==============================================================
	
	// 지역별 매출 통계 관련
	public int localPrice(String localCategory);
	
	// 카데고리별 매출 통계 관련
	public int categoryPrice(String categoryPrice);

}
