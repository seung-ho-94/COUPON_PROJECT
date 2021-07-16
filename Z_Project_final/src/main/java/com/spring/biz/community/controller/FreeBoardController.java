package com.spring.biz.community.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.community.service.FreeBoardService;
import com.spring.biz.community.service.PageMaker;
import com.spring.biz.community.service.CommentService;
import com.spring.biz.community.service.CommentVO;
import com.spring.biz.community.service.CommunityVO;
import com.spring.biz.community.service.Criteria;

// 커뮤니티 - 자유 게시판
@Controller("freeBoardController")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeBoardService;

	@Autowired
	private CommentService commentService;
	
	public FreeBoardController() {}
	
	// ----- 게시글 등록, 수정, 삭제 컨트롤러 -----
	// 글 목록 페이지로 이동
	@RequestMapping(value ="/selectFreeBoardList.do", method = RequestMethod.GET)
	public String selectFreeBoardList(Criteria cri, Model model) {
		
		// 글 목록 + 페이징 처리
		List<CommunityVO> freeList = freeBoardService.selectFreeBoardList(cri);
		
		// 페이징 처리를 위한 게시글 갯수
		int total = freeBoardService.countFreeBoard(cri);
	
	    model.addAttribute("freeList", freeList);
		model.addAttribute("paging", new PageMaker(cri, total));
		
		System.out.println(freeList);
		return "community/selectFreeBoardList.jsp";
	}
	
	// 글 등록 요청
	@RequestMapping(value = "/insertFreeBoard.do",  method = RequestMethod.POST)
	public String insertFreeBoard(CommunityVO vo, Model model) 
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
		freeBoardService.insertFreeBoard(vo);
		return "redirect:selectFreeBoardList.do";
	}
	
	// 글 등록 페이지로 이동
	@RequestMapping(value = "/insertFreeBoard.do",  method = RequestMethod.GET)
	public String listFreeView() {
		return "/community/insertFreeBoard.jsp";
	}
	
	// 글 상세 보기
	@RequestMapping("/selectOneFreeBoard.do")
	public String detailFreeView(int no, Model model) {
		// 조회수 증가
		freeBoardService.freeHitUp(no);
		
		CommunityVO freeDetail = freeBoardService.selectOneFreeBoard(no);
		model.addAttribute("freeDetail", freeDetail);
		
		// 댓글 리스트
		List<CommentVO> commList = commentService.selectCommentlist(no);
		model.addAttribute("commList", commList);
		
		System.out.println(no);
		return "community/selectOneFreeBoard.jsp";
	}	
	
	// 받은 글 번호로 글 수정 POST
	@RequestMapping(value = "/updateFreeBoard.do", method = RequestMethod.POST)
	public String updateFreeBoard(CommunityVO vo, Model model) {
		freeBoardService.updateFreeBoard(vo);
		return "redirect:selectFreeBoardList.do";
	}	
	
	// 글 수정 페이지 들어왔을 때 글 번호 받고, 기존 글 내용 보여주면서 수정할 수 있는 GET
	@RequestMapping(value = "/updateFreeBoard.do", method = RequestMethod.GET)
	public String updateFreeView(int no, Model model) {
		model.addAttribute("freeDetail", freeBoardService.selectOneFreeBoard(no));
		return "community/updateFreeBoard.jsp";
	}	
	
	// 글 삭제 
	@RequestMapping("/deleteFreeBoard.do")
	public String deleteFreeBoard(int no, Model model) {
		freeBoardService.deleteFreeBoard(no);
		return "redirect:selectFreeBoardList.do";
	}		
	
	// ====================
	// 댓글 작성
	@RequestMapping(value = "/insertFreeComment.do", method = RequestMethod.POST)
	public String insertFreeComment(@RequestParam int board_no, CommentVO vo, Model model) {
		System.out.println(board_no);
		commentService.insertComment(vo);
		return "redirect:selectOneFreeBoard.do?no="+board_no;
	}	
	
	// 댓글 수정 GET
	@RequestMapping(value = "/updateFreeComment.do", method = RequestMethod.GET)
	public String updateFreeCommentView(int no, Model model) {
	
		model.addAttribute("updateComment", commentService.selectOneComment(no));
		System.out.println(no);
		return "community/updateFreeComment.jsp";
	}	
	
	// 댓글 수정 POST
	@RequestMapping(value = "/updateFreeComment.do", method = RequestMethod.POST)
	public String updateFreeComment(@RequestParam int board_no, CommentVO vo, Model model) {
		commentService.updateComment(vo);
		return "redirect:selectOneFreeBoard.do?no="+board_no;
	}

	// 댓글 삭제
	@RequestMapping("/deleteFreeComment.do")
	public String deleteFreeComment(@RequestParam int board_no, int no, Model model) {
		commentService.deleteComment(no);
		return "redirect:selectOneFreeBoard.do?no="+board_no;
	}	
	}
