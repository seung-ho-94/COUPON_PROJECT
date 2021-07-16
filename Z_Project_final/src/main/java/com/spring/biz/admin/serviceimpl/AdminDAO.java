package com.spring.biz.admin.serviceimpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.admin.service.AdminMemberVO;
import com.spring.biz.admin.service.AdminNoticeVO;
import com.spring.biz.admin.service.AdminVO;
import com.spring.biz.admin.service.ContactVO;
import com.spring.biz.admin.service.CouponVO;
import com.spring.biz.admin.service.FAQVO;
import com.spring.biz.admin.service.QNAVO;
import com.spring.biz.admin.service.QnaCommentVO;
import com.spring.biz.cart.service.PurchaseVO;
import com.spring.biz.common.PagingVO;
import com.spring.biz.community.service.CommunityVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 관리자 아이디, 비밀번호 체크
	public AdminVO adminLogin(AdminVO adminVO) {
		return mybatis.selectOne("adminDAO.adminLogin", adminVO);
	}

	// ==============================================================

	// '상품관리' >> '상품수정/삭제 전체 리스트'(쿠폰)
	public List<CouponVO> selectAllCoupon() {
		return mybatis.selectList("adminDAO.selectAllCoupon");
	}

	// '상품관리' >> '상품수정 상세'(쿠폰)
	public CouponVO selectOneCoupon(int coupon_key) {
		return mybatis.selectOne("adminDAO.selectOneCoupon", coupon_key);
	}

	// '상품관리' >> '상품등록'(쿠폰)
	public void insertCoupon(CouponVO couponVO) {
		mybatis.insert("adminDAO.insertCoupon", couponVO);
	}

	// '상품관리' >> '상품수정/삭제' >> 상품 수정(쿠폰)
	public void updateCoupon(CouponVO couponVO) {
		mybatis.update("adminDAO.updateCoupon", couponVO);
	}

	// '상품관리' >> '상품수정/삭제' >> 상품 삭제(쿠폰)
	public void deleteCoupon(int coupon_key) {
		mybatis.delete("adminDAO.deleteCoupon", coupon_key);
	}

	// ==============================================================

	// '고객센터' >> '자주하는 질문' 눌렀을 때 category 가져오기
	public List<String> selectCateFAQ() {
		return mybatis.selectList("adminDAO.selectCateFAQ");
	}

	// '고객센터' >> '자주하는 질문' selectAll
	public List<FAQVO> selectAllFAQ(String category) {
		return mybatis.selectList("adminDAO.selectAllFAQ", category);
	}

	// '고객센터' >> '자주하는 질문' selectOne
	public FAQVO selectOneFAQ(int no) {
		return mybatis.selectOne("adminDAO.selectOneFAQ", no);
	}

	// '고객센터' >> '자주하는 질문' 등록 insertFAQ
	public void insertFAQ(FAQVO faqVO) {
		mybatis.insert("adminDAO.insertFAQ", faqVO);
	}

	// '고객센터' >> '자주하는 질문' 수정 insertFAQ
	public void updateFAQ(FAQVO faqVO) {
		mybatis.update("adminDAO.updateFAQ", faqVO);
	}

	// '고객센터' >> '자주하는 질문' 삭제 deleteFAQ
	public void deleteFAQ(int no) {
		mybatis.delete("adminDAO.deleteFAQ", no);
	}

	// ==============================================================

	// '고객센터' >> '자주하는 질문' 눌렀을 때 status 가져오기
	public List<String> selectStatusQNA() {
		return mybatis.selectList("adminDAO.selectStatusQNA");
	}

	// '고객센터' >> '1:1문의' >> '답변/미답변'을 눌렀을 때 내용 추출
	public List<QNAVO> selectAllQNA(String status) {
		return mybatis.selectList("adminDAO.selectAllQNA", status);
	}

	public void qnaUpdateStatusTrue(int no) {
		mybatis.update("adminDAO.qnaUpdateStatusTrue", no);
	}

	// 회원관리 리스트
	public List<AdminMemberVO> getMemberList(AdminMemberVO vo) {
		return mybatis.selectList("adminDAO.getMemberList", vo);
	}

	public void memberStatus(AdminMemberVO vo) {
		mybatis.update("adminDAO.memberStatus", vo);
	}
	
	// 회원삭제
	public void deleteMemberList(String id) {
		mybatis.delete("adminDAO.deleteMemberList", id);
	}

	// ==============================================================
	
	// 글상세조회(데이터 하나 조회)
	public AdminNoticeVO getBoard(AdminNoticeVO vo, int num) {
		System.out.println("===> myBatis로 getBoard() 실행");
		mybatis.update("adminDAO.noticeHitUpdate", num);
		return mybatis.selectOne("adminDAO.getBoard", vo);
	}

	// 공지사항 전체 게시글수
	public int countBoard(PagingVO vo) {
		return mybatis.selectOne("adminDAO.countBoard", vo);
	}

	// 공지사항 리스트
	public List<AdminNoticeVO> selectBoard(PagingVO vo) {
		System.out.println(">> 공지사항 DAO");
		return mybatis.selectList("adminDAO.selectBoard", vo);
	}

	// 공지사항 insert
	public void insertNotice(AdminNoticeVO vo) {
		mybatis.insert("adminDAO.insertNotice", vo);
	}

	// 공지사항 delete
	public void deleteNotice(AdminNoticeVO vo) {
		mybatis.delete("adminDAO.deleteNotice", vo);
	}

	// 공지사항 update
	public void updateNotice(AdminNoticeVO vo) {
		mybatis.update("adminDAO.updateNotice", vo);
	}

	// 1:1문의 상세보기
	public QNAVO qnaGetBoard(QNAVO vo) {
		return mybatis.selectOne("adminDAO.qnaGetBoard", vo);
	}
	
	// qna delete getboard
	public void qnaDeleteGetboard(int no) {
		mybatis.delete("adminDAO.qnaDeleteGetboard", no);
	}

	// qna 댓글 목록
	public List<QnaCommentVO> qnaCommentlist(int q_no) {
		return mybatis.selectList("adminDAO.qnaCommentlist", q_no);
	}

	// qna 댓글 생성
	public void qnaInsertComment(QnaCommentVO vo) {
		mybatis.insert("adminDAO.qnaInsertComment", vo);
	}

	// qna 댓글 선택
	public QnaCommentVO qnaselectOneComment(int no) {
		return mybatis.selectOne("adminDAO.qnaselectOneComment", no);
	}

	// qna 댓글 수정
	public void qnaUpdateComment(QnaCommentVO vo) {
		mybatis.update("adminDAO.qnaUpdateComment", vo);
	}

	// qna 댓글 삭제
	public void qnaDeleteComment(int no) {
		mybatis.delete("adminDAO.qnaDeleteComment", no);
	}

	// 관리자 커뮤니티
	public List<CommunityVO> adminCommunityList(PagingVO vo) {
		return mybatis.selectList("adminDAO.adminCommunityList", vo);
	}

	// 관리자 커뮤니티 insert
	public void insertCommunity(CommunityVO vo) {
		mybatis.insert("adminDAO.insertCommunity", vo);
	}

	// 관리자 커뮤니티 글삭제
	public void deleteCommunity(CommunityVO vo) {
		mybatis.delete("adminDAO.deleteCommunity", vo);
	}

	// 관리자 커뮤니티 총 갯수
	public int adminCommunityCount(PagingVO vo) {
		return mybatis.selectOne("adminDAO.adminCommunityCount", vo);
	}

	public CommunityVO getCommunityBoard(CommunityVO vo, int num) {
		mybatis.update("adminDAO.communityHitUpdate", num);
		return mybatis.selectOne("adminDAO.getCommunityBoard", vo);
	}

	// 주문내역
	public List<PurchaseVO> adminOrderList(PurchaseVO vo) {
		return mybatis.selectList("adminDAO.adminOrderList", vo);
	}

	// 주문내역 update
	public void orderStatus(PurchaseVO vo) {
		mybatis.update("adminDAO.orderStatus", vo);
	}

	// 제휴문의
	public List<ContactVO> contactList() {
		return mybatis.selectList("adminDAO.contactList");
	}

	// 제휴문의 상세보기
	public ContactVO contactGetBoard(ContactVO vo) {
		return mybatis.selectOne("adminDAO.contactGetBoard", vo);
	}
	
	// ==============================================================
	
	// 지역별 매출 통계 관련
	public int localPrice(String localCategory) {
		return mybatis.selectOne("adminDAO.localPrice", localCategory);
	}
	
	// 카데고리별 매출 통계 관련 couponPrice
	public int categoryPrice(String categoryPrice) {
		return mybatis.selectOne("adminDAO.categoryPrice", categoryPrice);
	}

}
