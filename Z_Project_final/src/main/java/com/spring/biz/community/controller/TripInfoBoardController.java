package com.spring.biz.community.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.community.service.FreeBoardService;
import com.spring.biz.community.service.PageMaker;
import com.spring.biz.community.service.TripInfoBoardService;
import com.spring.biz.community.service.CommentService;
import com.spring.biz.community.service.CommentVO;
import com.spring.biz.community.service.CommunityVO;
import com.spring.biz.community.service.Criteria;

// 커뮤니티 - 여행 정보 게시판
@Controller("tripInfoBoardController")
public class TripInfoBoardController {
	
	@Autowired
	private TripInfoBoardService tripInfoBoardService;

	@Autowired
	private CommentService commentService;
	
	public TripInfoBoardController() {}
	
	// ----- 게시글 등록, 수정, 삭제 컨트롤러 -----
	// 글 목록 페이지로 이동
	@RequestMapping(value ="/selectTripInfoBoardList.do", method = RequestMethod.GET)
	public String selectTripInfoBoardList(Criteria cri, Model model) {
		
		// 글 목록 + 페이징 처리
		List<CommunityVO> tripList = tripInfoBoardService.selectTripInfoBoardList(cri);
		
		// 페이징 처리를 위한 게시글 갯수
		int total = tripInfoBoardService.countTripInfoBoard(cri);
		System.out.println(total);
	    model.addAttribute("list", tripList);
		model.addAttribute("paging", new PageMaker(cri, total));
		return "community/selectTripInfoBoardList.jsp";
	}
	
	// 글 등록 요청
	@RequestMapping(value = "/insertTripInfoBoard.do",  method = RequestMethod.POST)
	public String insertTripInfoBoard(CommunityVO vo, Model model) 
			throws IOException {
		
		/* 파일업로드 관련 처리
		MultipartFile 인터페이스 주요 메소드
		String getOriginalFilename() : 업로드할 파일명 찾기
		void transferTo(File dest) : 업로드할 파일을 업로드 처리
		boolean isEmpty() : 업로드할 파일 존재여부(없으면 true 리턴)
		*/
		String file_name = null;
		MultipartFile attach_file = vo.getAttach_file();
		System.out.println("> attach_file : " + attach_file);
		if (!attach_file.isEmpty()) {
			String originalFileName = attach_file.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			file_name = uuid + "." + ext;
			attach_file.transferTo(new File("C:/MyStudy/temp/" + file_name));
		}
		vo.setFile_name(file_name);
		tripInfoBoardService.insertTripInfoBoard(vo);
		return "redirect:selectTripInfoBoardList.do";
	}
	
	// 글 등록 페이지로 이동
	@RequestMapping(value = "/insertTripInfoBoard.do",  method = RequestMethod.GET)
	public String listView() {
		return "/community/insertTripInfoBoard.jsp";
	}
	
	// 글 상세 보기
	@RequestMapping("/selectOneTripInfoBoard.do")
	public String tripDetailView(int no, Model model) {
		// 조회수 증가
		tripInfoBoardService.tripHitUp(no);
		
		CommunityVO tripDetail = tripInfoBoardService.selectOneTripInfoBoard(no);
		model.addAttribute("detail", tripDetail);
		
		// 댓글 리스트
		List<CommentVO> commList = commentService.selectCommentlist(no);
		model.addAttribute("commList", commList);
		
		System.out.println(no);
		return "community/selectOneTripInfoBoard.jsp";
	}	
	
	// 받은 글 번호로 글 수정 POST
	@RequestMapping(value = "/updateTripInfoBoard.do", method = RequestMethod.POST)
	public String updateTripInfoBoard(CommunityVO vo, Model model) {
		tripInfoBoardService.updateTripInfoBoard(vo);
		return "redirect:selectTripInfoBoardList.do";
	}	
	
	// 글 수정 페이지 들어왔을 때 글 번호 받고, 기존 글 내용 보여주면서 수정할 수 있는 GET
	@RequestMapping(value = "/updateTripInfoBoard.do", method = RequestMethod.GET)
	public String updateTripView(int no, Model model) {
		model.addAttribute("detail", tripInfoBoardService.selectOneTripInfoBoard(no));
		return "community/updateTripInfoBoard.jsp";
	}	
	
	// 글 삭제 
	@RequestMapping("/deleteTripInfoBoard.do")
	public String deleteTripInfoBoard(int no, Model model) {
		tripInfoBoardService.deleteTripInfoBoard(no);
		return "redirect:selectTripInfoBoardList.do";
	}		
	
	// ====================
	// 댓글 작성
	@RequestMapping(value = "/insertTripInfoBoardComment.do", method = RequestMethod.POST)
	public String insertTripInfoComment(@RequestParam int board_no, CommentVO vo, Model model) {
		System.out.println(board_no);
		commentService.insertComment(vo);
		return "redirect:selectOneTripInfoBoard.do?no="+board_no;
	}	
	
	// 댓글 수정 GET
	@RequestMapping(value = "/updateTripInfoBoardComment.do", method = RequestMethod.GET)
	public String updateTripInfoCommentView(int no, Model model) {
	
		model.addAttribute("updateComment", commentService.selectOneComment(no));
		System.out.println(no);
		return "community/updateTripInfoBoardComment.jsp";
	}	
	
	// 댓글 수정 POST
	@RequestMapping(value = "/updateTripInfoBoardComment.do", method = RequestMethod.POST)
	public String updateTripInfoComment(@RequestParam int board_no, CommentVO vo, Model model) {
		System.out.println(vo.getContent());
		commentService.updateComment(vo);
		return "redirect:selectOneTripInfoBoard.do?no="+board_no;
	}

	// 댓글 삭제
	@RequestMapping("/deleteTripInfoBoardComment.do")
	public String deleteTripInfoComment(@RequestParam int board_no, int no, Model model) {
		commentService.deleteComment(no);
		return "redirect:selectOneTripInfoBoard.do?no="+board_no;
	}	
	}
