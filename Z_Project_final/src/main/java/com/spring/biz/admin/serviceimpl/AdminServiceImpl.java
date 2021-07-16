package com.spring.biz.admin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.admin.service.AdminMemberVO;
import com.spring.biz.admin.service.AdminNoticeVO;
import com.spring.biz.admin.service.AdminService;
import com.spring.biz.admin.service.AdminVO;
import com.spring.biz.admin.service.ContactVO;
import com.spring.biz.admin.service.CouponVO;
import com.spring.biz.admin.service.FAQVO;
import com.spring.biz.admin.service.QNAVO;
import com.spring.biz.admin.service.QnaCommentVO;
import com.spring.biz.cart.service.PurchaseVO;
import com.spring.biz.common.PagingVO;
import com.spring.biz.community.service.CommunityVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	// 관리자 아이디, 비밀번호 체크
	@Override
	public AdminVO adminLogin(AdminVO adminVO) {
		return adminDAO.adminLogin(adminVO);
	}

	// ==============================================================

	// '상품관리' >> '상품수정/삭제 전체 리스트'(쿠폰)
	@Override
	public List<CouponVO> selectAllCoupon() {
		return adminDAO.selectAllCoupon();
	}

	// '상품관리' >> '상품등록'(쿠폰)
	@Override
	public void insertCoupon(CouponVO couponVO) {
		adminDAO.insertCoupon(couponVO);
	}

	// '상품관리' >> '상품수정 상세'(쿠폰)
	@Override
	public CouponVO selectOneCoupon(int coupon_key) {
		return adminDAO.selectOneCoupon(coupon_key);
	}

	// '상품관리' >> '상품수정/삭제' >> 상품 수정(쿠폰)
	@Override
	public void updateCoupon(CouponVO couponVO) {
		adminDAO.updateCoupon(couponVO);
	}

	// '상품관리' >> '상품수정/삭제' >> 상품 삭제(쿠폰)
	@Override
	public void deleteCoupon(int coupon_key) {
		adminDAO.deleteCoupon(coupon_key);
	}

	// ==============================================================

	// '고객센터' >> '자주하는 질문' 눌렀을 때 category 가져오기
	@Override
	public List<String> selectCateFAQ() {
		return adminDAO.selectCateFAQ();
	}

	// '고객센터' >> '자주하는 질문' selectAll
	@Override
	public List<FAQVO> selectAllFAQ(String category) {
		return adminDAO.selectAllFAQ(category);
	}

	// '고객센터' >> '자주하는 질문' selectOne
	@Override
	public FAQVO selectOneFAQ(int no) {
		return adminDAO.selectOneFAQ(no);
	}

	// '고객센터' >> '자주하는 질문' 등록 insertFAQ
	@Override
	public void insertFAQ(FAQVO faqVO) {
		adminDAO.insertFAQ(faqVO);
	}

	// '고객센터' >> '자주하는 질문' 수정 updateFAQ
	@Override
	public void updateFAQ(FAQVO faqVO) {
		adminDAO.updateFAQ(faqVO);
	}

	// '고객센터' >> '자주하는 질문' 삭제 deleteFAQ
	@Override
	public void deleteFAQ(int no) {
		adminDAO.deleteFAQ(no);
	}

	// ==============================================================

	// '고객센터' >> '1:1문의' 눌렀을 때 status 가져오기
	@Override
	public List<String> selectStatusQNA() {
		return adminDAO.selectStatusQNA();
	}

	// '고객센터' >> '1:1문의' >> '답변/미답변'을 눌렀을 때 내용 추출
	@Override
	public List<QNAVO> selectAllQNA(String status) {
		return adminDAO.selectAllQNA(status);
	}

	@Override
	public void qnaUpdateStatusTrue(int no) {
		adminDAO.qnaUpdateStatusTrue(no);
	}

	// 회원관리 (페이징 처리 후)
	@Override
	public List<AdminMemberVO> getMemberList(AdminMemberVO vo) {
		return adminDAO.getMemberList(vo);
	}

	@Override
	public void memberStatus(AdminMemberVO vo) {
		adminDAO.memberStatus(vo);
	}
	
	// 회원삭제
	@Override
	public void deleteMemberList(String id) {
		adminDAO.deleteMemberList(id);
	}
	
	// ==============================================================
	
	// 게시글 상세보기 (공지사항 + 자주하는 질문)
	@Override
	public AdminNoticeVO getBoard(AdminNoticeVO vo, int num) {
		return adminDAO.getBoard(vo, num);
	}

	// 공지사항 게시글 수 조회
	@Override
	public int countBoard(PagingVO vo) {
		return adminDAO.countBoard(vo);
	}

	// 공지사항 (페이징 처리 후)
	@Override
	public List<AdminNoticeVO> selectBoard(PagingVO vo) {
		System.out.println(">> 공지사항 impl");
		return adminDAO.selectBoard(vo);
	}

	// 공지사항 insert
	@Override
	public void insertNotice(AdminNoticeVO vo) {
		adminDAO.insertNotice(vo);
	}

	// 공지사항 delete
	@Override
	public void deleteNotice(AdminNoticeVO vo) {
		adminDAO.deleteNotice(vo);
	}

	// 공지사항 update
	@Override
	public void updateNotice(AdminNoticeVO vo) {
		adminDAO.updateNotice(vo);
	}

	// qna 상세보기
	@Override
	public QNAVO qnaGetBoard(QNAVO vo) {
		return adminDAO.qnaGetBoard(vo);
	}
	
	@Override
	public void qnaDeleteGetboard(int no) {
		adminDAO.qnaDeleteGetboard(no);		
	}

	// qna 댓글리스트
	@Override
	public List<QnaCommentVO> qnaCommentlist(int q_no) {
		return adminDAO.qnaCommentlist(q_no);
	}

	// qna 댓글 insert
	@Override
	public void qnaInsertComment(QnaCommentVO vo) {
		adminDAO.qnaInsertComment(vo);
	}

	// qna 댓글선택
	@Override
	public QnaCommentVO qnaselectOneComment(int no) {
		return adminDAO.qnaselectOneComment(no);
	}

	// qna 댓글 수정
	@Override
	public void qnaUpdateComment(QnaCommentVO vo) {
		adminDAO.qnaUpdateComment(vo);
	}

	// qna 댓글 삭제
	@Override
	public void qnaDeleteComment(int no) {
		adminDAO.qnaDeleteComment(no);
	}

	// 관리자 커뮤니티
	@Override
	public List<CommunityVO> adminCommunityList(PagingVO vo) {
		return adminDAO.adminCommunityList(vo);
	}

	// 관리자 커뮤니티 insert
	@Override
	public void insertCommunity(CommunityVO vo) {
		adminDAO.insertCommunity(vo);
	}

	// 관리자 커뮤니티 글삭제
	@Override
	public void deleteCommunity(CommunityVO vo) {
		adminDAO.deleteCommunity(vo);
	}

	// 관리자 커뮤니티 총갯수
	@Override
	public int adminCommunityCount(PagingVO vo) {
		return adminDAO.adminCommunityCount(vo);
	}

	// 관리자 커뮤니티 상세보기
	@Override
	public CommunityVO getCommunityBoard(CommunityVO vo, int num) {
		return adminDAO.getCommunityBoard(vo, num);
	}

	// 주문내역
	@Override
	public List<PurchaseVO> adminOrderList(PurchaseVO vo) {
		return adminDAO.adminOrderList(vo);
	}

	// 주문내역 update
	@Override
	public void orderStatus(PurchaseVO vo) {
		adminDAO.orderStatus(vo);
	}

	// 제휴문의
	@Override
	public List<ContactVO> contactList() {
		return adminDAO.contactList();
	}

	// 제휴문의 상세보기
	@Override
	public ContactVO contactGetBoard(ContactVO vo) {
		return adminDAO.contactGetBoard(vo);
	}

	// ==============================================================
	
	// 지역별 매출 통계 관련
	@Override
	public int localPrice(String localCategory) {
		return adminDAO.localPrice(localCategory);
	}
	
	// 카데고리별 매출 통계 관련 couponPrice
	@Override
	public int categoryPrice(String categoryPrice) {
		return adminDAO.categoryPrice(categoryPrice);
	}
	
	
}
