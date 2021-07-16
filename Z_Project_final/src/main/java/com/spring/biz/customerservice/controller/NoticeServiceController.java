package com.spring.biz.customerservice.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.common.PagingVO;
import com.spring.biz.customerservice.NoticeService;
import com.spring.biz.customerservice.vo.NoticeVO;

@Controller
@SessionAttributes("board")
public class NoticeServiceController {
	@Autowired
	private NoticeService noticeService;

	public NoticeServiceController() {
	}
	//공지사항 상세내용@RequestParam("email01") String email01
	@RequestMapping("/getBoard.do")
	public String getBoard(NoticeVO vo, Model model, @RequestParam("no") int num) {
		int no = num;
		NoticeVO board = noticeService.getBoard(vo, no);
		System.out.println("getBoard DB board : " + board);
		model.addAttribute("board", board); //Model 객체사용 View로 데이터 전달
		return "customer/getBoard.jsp";
	}
	
	//공지사항 전체 리스트 (페이징 처리 후)
	@RequestMapping("/getBoardListNotice.do")
	public String getBoardListNotice(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println(">> 공지사항 controller");
		int total = noticeService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println("공지사항 컨트롤러 vo :" + vo);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", noticeService.selectBoard(vo));
		return "customer/noticeList.jsp";
	}	
	
}
