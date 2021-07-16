package com.spring.biz.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.spring.biz.admin.service.AdminMemberVO;
import com.spring.biz.admin.service.AdminNoticeVO;
import com.spring.biz.admin.service.AdminService;
import com.spring.biz.admin.service.AdminVO;
import com.spring.biz.admin.service.CategoryVO;
import com.spring.biz.admin.service.ContactVO;
import com.spring.biz.admin.service.CouponVO;
import com.spring.biz.admin.service.FAQVO;
import com.spring.biz.admin.service.LocalVO;
import com.spring.biz.admin.service.QNAVO;
import com.spring.biz.admin.service.QnaCommentVO;
import com.spring.biz.cart.service.PurchaseVO;
import com.spring.biz.common.PagingVO;
import com.spring.biz.community.service.CommentService;
import com.spring.biz.community.service.CommentVO;
import com.spring.biz.community.service.CommunityVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private CommentService commentService;

	// 사용자 페이지에서 '관리자'를 클릭했을 때 관리자 로그인 페이지로 이동
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.GET)
	public String loginView() {
		return "admin/adminLogin.jsp";
	}

	// 관리자 페이지에서 'Admin', '통계' 클릭했을 때 관리자 메인 페이지(통계)로 이동
	@RequestMapping(value = "/adminMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String mainView(Model model) {
		LocalVO localVO = new LocalVO();
		
		int seoul = adminService.localPrice(localVO.getSeoul());
		int busan = adminService.localPrice(localVO.getBusan());
		int gyeonggi = adminService.localPrice(localVO.getGyeonggi());
		int gangwon = adminService.localPrice(localVO.getGangwon());
		int chungcheong = adminService.localPrice(localVO.getChungcheong());
		int jeolla = adminService.localPrice(localVO.getJeolla());
		int gyeongsang = adminService.localPrice(localVO.getGyeongsang());
		int jeju = adminService.localPrice(localVO.getJeju());
		
		model.addAttribute("seoul", seoul);
		model.addAttribute("busan", busan);
		model.addAttribute("gyeonggi", gyeonggi);
		model.addAttribute("gangwon", gangwon);
		model.addAttribute("chungcheong", chungcheong);
		model.addAttribute("jeolla", jeolla);
		model.addAttribute("gyeongsang", gyeongsang);
		model.addAttribute("jeju", jeju);
		
		// ==============================================================
		
		CategoryVO categoryVO = new CategoryVO();
		
		int water = adminService.categoryPrice(categoryVO.getWater());
		int outdoor = adminService.categoryPrice(categoryVO.getOutdoor());
		int ticket = adminService.categoryPrice(categoryVO.getTicket());
		
		model.addAttribute("water", water);
		model.addAttribute("outdoor", outdoor);
		model.addAttribute("ticket", ticket);
		
		return "admin/adminMain.jsp";
	}

	// 관리자 아이디, 비밀번호 체크
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	public String login(AdminVO adminVO, HttpSession session) {
		AdminVO adminInfo = adminService.adminLogin(adminVO);

		// 존재하는 아이디인지 체크
		if (adminInfo != null) {
			// 로그인 유지를 위함
			session.setAttribute("adminInfo", adminInfo);
			return "adminMain.do";
		} else {
			return "admin/adminLoginFail.jsp";
		}
	}

	// ==============================================================

	// '상품관리' >> '상품등록'을 눌렀을 때 페이지 이동
	@RequestMapping(value = "/insertCoupon.do", method = RequestMethod.GET)
	public String coupon() {
		return "admin/insertCoupon.jsp";
	}

	// '상품관리' >> '상품수정/삭제'를 눌렀을 때 페이지 이동
	@RequestMapping(value = "/updateDeleteCoupon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateDeleteCoupon(Model model) {
		// 상품 전체 리스트 추출
		List<CouponVO> couponList = adminService.selectAllCoupon();
		model.addAttribute("couponList", couponList);
		return "admin/updateDeleteCoupon.jsp";
	}

	// '상품관리' >> '상품수정/삭제' >> 상품이미지 눌렀을 때 페이지 이동 (수정페이지)
	@RequestMapping(value = "/updateCoupon.do", method = RequestMethod.GET)
	public String updateCouponView(int coupon_key, Model model) {
		// 상품 상세 추출
		CouponVO couponDetail = adminService.selectOneCoupon(coupon_key);
		model.addAttribute("couponDetail", couponDetail);
		return "admin/updateCoupon.jsp";
	}

	// '상품관리' >> '상품등록'(쿠폰)
	@RequestMapping(value = "/insertCoupon.do", method = RequestMethod.POST)
	public String insertCoupon(CouponVO couponVO, HttpServletRequest req) throws IllegalStateException, IOException {
		// 이미지 insert
		insertUpdateImg(couponVO, req);
		adminService.insertCoupon(couponVO);
		return "admin/insertCoupon.jsp";
	}

	// '상품관리' >> '상품수정/삭제' >> 상품 수정
	@RequestMapping(value = "/updateCoupon.do", method = RequestMethod.POST)
	public String updateCoupon(CouponVO couponVO, HttpServletRequest req) throws IllegalStateException, IOException {
		// 이미지 insert, update
		insertUpdateImg(couponVO, req);
		adminService.updateCoupon(couponVO);
		return "forward:/updateDeleteCoupon.do";
	}

	// '상품관리' >> '상품수정/삭제' >> 상품 삭제
	@RequestMapping(value = "/deleteCoupon.do", method = RequestMethod.POST)
	public String deleteCoupon(HttpServletRequest req, int coupon_key) {
		deleteImg(req.getParameter("attach_file1"));
		deleteImg(req.getParameter("attach_file2"));
		deleteImg(req.getParameter("attach_file3"));
		adminService.deleteCoupon(coupon_key);
		return "forward:/updateDeleteCoupon.do";
	}

	// ==============================================================

	// '고객센터' >> '자주하는 질문' and 'XX문의'를 눌렀을 때 내용 추출
	@RequestMapping(value = "/FAQList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String selectAllFAQ(String category, Model model) {
		// 카테고리 메뉴('XX문의') 추출
		List<String> faqCateList = adminService.selectCateFAQ();
		model.addAttribute("faqCateList", faqCateList);
		// 카테고리 메뉴('XX문의')에 관련된 '내용' 추출
		List<FAQVO> faqList = adminService.selectAllFAQ(category);
		model.addAttribute("faqList", faqList);
		// 카테고리 값 (deleteFAQ 에서 return "forward:/FAQList.do"; 할 때 필요)
		model.addAttribute("category", category);
		return "admin/adminFAQ.jsp";
	}

	// '고객센터' >> '자주하는 질문' >> '등록'을 눌렀을 때 페이지 이동
	@RequestMapping(value = "/insertFAQView.do", method = RequestMethod.GET)
	public String insertFAQView() {
		return "admin/insertFAQ.jsp";
	}

	// '고객센터' >> '자주하는 질문' >> '수정'을 눌렀을 때 페이지 이동
	@RequestMapping(value = "/updateFAQView.do", method = RequestMethod.POST)
	public String updateFAQView(int no, Model model) {
		FAQVO faqDetail = adminService.selectOneFAQ(no);
		model.addAttribute("faqDetail", faqDetail);
		return "admin/updateFAQ.jsp";
	}

	// '고객센터' >> '자주하는 질문' 등록 insertFAQ
	@RequestMapping(value = "/insertFAQ.do", method = RequestMethod.POST)
	public String insertFAQ(FAQVO faqVO) {
		adminService.insertFAQ(faqVO);
		return "forward:/FAQList.do";
	}

	// '고객센터' >> '자주하는 질문' 수정 updateFAQ
	@RequestMapping(value = "/updateFAQ.do", method = RequestMethod.POST)
	public String updateFAQ(FAQVO faqVO) {
		adminService.updateFAQ(faqVO);
		return "forward:/FAQList.do";
	}

	// '고객센터' >> '자주하는 질문' 삭제 deleteFAQ
	@RequestMapping(value = "/deleteFAQ.do", method = RequestMethod.POST)
	public String deleteFAQ(int no) {
		adminService.deleteFAQ(no);
		return "forward:/FAQList.do";
	}

	// ==============================================================

	// '고객센터' >> '1:1문의' and '답변/미답변'을 눌렀을 때 내용 추출
	@RequestMapping(value = "/QNAList.do", method = RequestMethod.GET)
	public String selectAllQNA(String status, Model model) {
		// 상태(답변, 미답변) 추출
		List<String> qnaStatusList = adminService.selectStatusQNA();
		model.addAttribute("qnaStatusList", qnaStatusList);
		// '답변/미답변'에 관련된 '내용' 추출
		List<QNAVO> qnaList = adminService.selectAllQNA(status);
		model.addAttribute("qnaList", qnaList);
		return "admin/adminQNA.jsp";
	}
	
	// ==============================================================

	// '회원관리' >> '회원관리'를 눌렀을 때 회원조회 페이지 이동
	@RequestMapping(value = "/memberList.do", method = RequestMethod.GET)
	public String getMemberList(AdminMemberVO vo, Model model) {
		List<AdminMemberVO> memberList = adminService.getMemberList(vo);
		model.addAttribute("memberList", memberList);
		return "admin/adminMemberList.jsp";
	}

	// '회원관리' >> 회원삭제
	@RequestMapping(value = "/deleteMemberList.do", method = RequestMethod.GET)
	public String getMemberList(String id) {
		adminService.deleteMemberList(id);
		return "memberList.do";
	}
	
	
	@RequestMapping(value = "/memberStatus.do", method = RequestMethod.GET)
	public String MemberStatus(@ModelAttribute("memberList") AdminMemberVO vo) {
		if (vo.getStatus() == 0) {
			vo.setStatus(1);
		} else {
			vo.setStatus(0);
		}
		adminService.memberStatus(vo);
		return "memberList.do";
	}

	// 공지사항 상세내용@RequestParam("email01") String email01
	@RequestMapping("/getBoard2.do")
	public String getBoard(AdminNoticeVO vo, Model model, @RequestParam("no") int num) {
		int no = num;
		AdminNoticeVO board = adminService.getBoard(vo, no);
		model.addAttribute("board", board); // Model 객체사용 View로 데이터 전달

		return "admin/adminGetBoard.jsp";
	}

	// 공지사항 전체 리스트 (페이징 처리 후)
	@RequestMapping("/getBoardListNotice2.do")
	public String getBoardListNotice(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		String searchCondition = vo.getSearchCondition();
		String searchKeyword = vo.getSearchKeyword();
		int total = adminService.countBoard(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchCondition,
				searchKeyword);
		System.out.println(vo);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", adminService.selectBoard(vo));
		return "admin/adminNoticeList.jsp";
	}

	@RequestMapping(value = "/insertNotice.do", method = RequestMethod.GET)
	public String insertNotice() {
		return "admin/insertNotice.jsp";
	}

	@RequestMapping(value = "/insertNotice.do", method = RequestMethod.POST)
	public String insertNotice(AdminNoticeVO vo, HttpSession session) {
		AdminVO avo = (AdminVO) session.getAttribute("adminInfo");
		vo.setId(avo.getId());
		adminService.insertNotice(vo);
		return "/getBoardListNotice2.do";

	}

	// 공지사항 delete
	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(AdminNoticeVO vo) {
		adminService.deleteNotice(vo);
		return "/getBoardListNotice2.do";
	}

	// 공지사항 update
	@RequestMapping(value = "/updateNotice.do", method = RequestMethod.GET)
	public String updateNotice(int no, AdminNoticeVO vo, Model model) {
		AdminNoticeVO board = adminService.getBoard(vo, no);
		model.addAttribute("board", board);
		return "admin/updateNotice.jsp";
	}

	// 공지사항 update
	@RequestMapping(value = "/updateNotice.do", method = RequestMethod.POST)
	public String updateNotice(AdminNoticeVO vo) {
		adminService.updateNotice(vo);
		return "forward:/getBoard2.do";
	}

	// 1:1문의 상세보기
	@RequestMapping("/qnaGetBoard.do")
	public String qnaGetBoard(QNAVO vo, int no, Model model) {
		vo.setNo(no);
		QNAVO board = adminService.qnaGetBoard(vo);
		model.addAttribute("board", board);

		// 댓글 리스트
		List<QnaCommentVO> commList = adminService.qnaCommentlist(no);
		model.addAttribute("board", board);
		model.addAttribute("commList", commList);

		return "admin/qnaGetBoard.jsp";
	}

	// qna insert
	@RequestMapping(value = "/qnaInsertComment.do", method = RequestMethod.POST)
	public String qnaInsertComment(@RequestParam int q_no, QnaCommentVO vo, Model model) {
		System.out.println(q_no);
		vo.setQ_no(q_no);
		adminService.qnaInsertComment(vo);
		adminService.qnaUpdateStatusTrue(q_no);
		return "redirect:qnaGetBoard.do?no=" + q_no;
	}
	
	// qna delete getboard
	@RequestMapping("/qnaDeleteGetboard.do")
	public String qnaDeleteGetboard(int no, String status, Model model) {
		adminService.qnaDeleteGetboard(no);
		return "forward:/QNAList.do";
	}

	// qna delete
	@RequestMapping("/qnaDeleteComment.do")
	public String qnaDeleteComment(@RequestParam int q_no, int no, Model model) {
		adminService.qnaDeleteComment(no);
		return "redirect:qnaGetBoard.do?no=" + q_no;
	}

	// qna 수정 GET
	@RequestMapping(value = "/qnaUpdateComment.do", method = RequestMethod.GET)
	public String qnaUpdateComment(int no, Model model) {
		System.out.println("겟");
		model.addAttribute("updateComment", adminService.qnaselectOneComment(no));
		return "admin/qnaUpdateComment.jsp";
	}

	// qna 수정 POST
	@RequestMapping(value = "/qnaUpdateComment.do", method = RequestMethod.POST)
	public String qnaUpdateComment(@RequestParam int q_no, QnaCommentVO vo, Model model) {
		System.out.println("포스트");
		adminService.qnaUpdateComment(vo);
		return "admin/commUpdateSuccess.jsp";
		// return "redirect:qnaGetBoard.do?no=" + q_no;
	}

	// 관리자 커뮤니티 페이징 처리 후
	@RequestMapping("/adminCommunityList.do")
	public String adminFreeBoardList(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

//		String category = vo.getCategory();
//		String searchCondition = vo.getSearchCondition();
//		String searchKeyword = vo.getSearchKeyword();

		int total = adminService.adminCommunityCount(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getCategory(),
				vo.getSearchCondition(), vo.getSearchKeyword());

		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", adminService.adminCommunityList(vo));

		return "admin/adminCommunityList.jsp";
	}

	// 관리자 커뮤니티 상세보기
	@RequestMapping("/getCommunityBoard.do")
	public String getCommunityBoard(CommunityVO vo, Model model, int no) {
		CommunityVO board = adminService.getCommunityBoard(vo, no);
		model.addAttribute("board", board); // Model 객체사용 View로 데이터 전달

		// 댓글 리스트
		List<CommentVO> commList = commentService.selectCommentlist(no);
		model.addAttribute("commList", commList);

		return "admin/adminGetCommunityBoard.jsp";
	}

	@RequestMapping(value = "/insertCommunity.do", method = RequestMethod.GET)
	public String insertCommunity(CommunityVO vo, Model model) {
		model.addAttribute("vo", vo);
		return "admin/insertCommunity.jsp";
	}

	@RequestMapping(value = "/insertCommunity.do", method = RequestMethod.POST)
	public String insertCommunity(CommunityVO vo, HttpSession session) throws IllegalStateException, IOException {

		/*
		 * 파일업로드 관련 처리 MultipartFile 인터페이스 주요 메소드 String getOriginalFilename() : 업로드할
		 * 파일명 찾기 void transferTo(File dest) : 업로드할 파일을 업로드 처리 boolean isEmpty() : 업로드할
		 * 파일 존재여부(없으면 true 리턴)
		 */
		String file_name = null;
		MultipartFile attach_file = vo.getAttach_file();
		if (!attach_file.isEmpty()) {
			String originalFileName = attach_file.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기

			UUID uuid = UUID.randomUUID(); // UUID 구하기
			file_name = uuid + "." + ext;
			attach_file.transferTo(new File("C:/MyStudy/temp/" + file_name));
		}
		vo.setFile_name(file_name);
		AdminVO avo = (AdminVO) session.getAttribute("adminInfo");
		vo.setId(avo.getId());
		adminService.insertCommunity(vo);
		return "/adminCommunityList.do?category=" + vo.getCategory();

	}

	// 관리자 커뮤니티 글삭제
	@RequestMapping("/deleteCommunity.do")
	public String deleteCommunity(CommunityVO vo) {
		adminService.deleteCommunity(vo);
		return "redirect:adminCommunityList.do?category=" + vo.getCategory();
	}

	// 댓글 작성
	@RequestMapping(value = "/insertCommunityComment.do", method = RequestMethod.POST)
	public String insertCommunityComment(@RequestParam int board_no, CommentVO vo, Model model, String category) {
		System.out.println(board_no);
		commentService.insertComment(vo);
		return "redirect:getCommunityBoard.do?no=" + board_no + "&category=" + category;
	}

	// 댓글 삭제
	@RequestMapping("/deleteCommunityComment.do")
	public String deleteCommunityComment(@RequestParam int board_no, int no, Model model, String category) {
		commentService.deleteComment(no);
		return "redirect:getCommunityBoard.do?no=" + board_no + "&category=" + category;
	}

	// 주문내역 이동
	@RequestMapping("/adminOrderList.do")
	public String adminOrderList(PurchaseVO vo, Model model) {
		List<PurchaseVO> list = adminService.adminOrderList(vo);
		model.addAttribute("list", list);
		return "admin/adminOrderList.jsp";
	}

	// 주문내역 상태
	@RequestMapping("/orderStatus.do")
	public String orderStatus(PurchaseVO vo) {
		if (vo.getStatus().equals("입금대기")) {
			vo.setStatus("결제완료");
		} else if (vo.getStatus().equals("주문취소")) {
			vo.setStatus("취소완료");
		} else if (vo.getStatus().equals("결제완료")) {
			vo.setStatus("취소완료");
		}

		adminService.orderStatus(vo);

		return "adminOrderList.do";
	}

	// 제휴문의
	@RequestMapping("/contactList.do")
	public String contactList(ContactVO vos, Model model) {
		List<ContactVO> list = adminService.contactList();
		model.addAttribute("list", list);
		return "admin/adminContact.jsp";
	}

	// 제휴문의 상세보기
	@RequestMapping("/contactGetBoard.do")
	public String contactGetBoard(ContactVO vo, Model model) {
		ContactVO board = adminService.contactGetBoard(vo);
		model.addAttribute("board", board);
		return "admin/contactGetBoard.jsp";
	}

	// ==============================================================

	// 이미지 insert, update
	public void insertUpdateImg(CouponVO couponVO, HttpServletRequest req) throws IllegalStateException, IOException {
		String attach_file1 = null;
		String attach_file2 = null;
		String attach_file3 = null;

		MultipartFile file1 = couponVO.getFile1();
		MultipartFile file2 = couponVO.getFile2();
		MultipartFile file3 = couponVO.getFile3();

		if (file1.getOriginalFilename() != "") {
			deleteImg(req.getParameter("attach_file1"));
			String originalFileName = file1.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			attach_file1 = "MainImg-" + uuid + "." + ext;
			file1.transferTo(new File("C:/couponImg/" + attach_file1));
			couponVO.setAttach_file1(attach_file1);
		} else {
			couponVO.setAttach_file1(req.getParameter("attach_file1"));
		}

		if (file2.getOriginalFilename() != "") {
			deleteImg(req.getParameter("attach_file2"));
			String originalFileName = file2.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			attach_file2 = "SubImg1-" + uuid + "." + ext;
			file2.transferTo(new File("C:/couponImg/" + attach_file2));
			couponVO.setAttach_file2(attach_file2);
		} else {
			couponVO.setAttach_file2(req.getParameter("attach_file2"));
		}

		if (file3.getOriginalFilename() != "") {
			deleteImg(req.getParameter("attach_file3"));
			String originalFileName = file3.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			attach_file3 = "SubImg2-" + uuid + "." + ext;
			file3.transferTo(new File("C:/couponImg/" + attach_file3));
			couponVO.setAttach_file3(attach_file3);
		} else {
			couponVO.setAttach_file3(req.getParameter("attach_file3"));
		}
	}

	// 이미지 delete
	public void deleteImg(String attach_file) {
		File file = new File("C:/couponImg/" + attach_file);
		file.delete();
	}

	// ==============================================================

	// 썸머노트 이미지 업로드 ajax 관련
	@RequestMapping(value = "/uploadSummernoteImageFile.do", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		System.out.println("연결");

		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:/couponImg/";

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명

		// originalFileName.substring(originalFileName.lastIndexOf("."));
		String ext = FilenameUtils.getExtension(originalFileName); // 파일 확장자

		String savedFileName = "Detail-" + UUID.randomUUID() + "." + ext; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName); // 저장될 파일 위치와 이름

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/img/" + savedFileName); // 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String jsonInfo = jsonObject.toString();
		return jsonInfo;
	}

}
