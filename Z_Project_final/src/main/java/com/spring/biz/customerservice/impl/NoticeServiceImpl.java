package com.spring.biz.customerservice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.common.PagingVO;
import com.spring.biz.customerservice.NoticeService;
import com.spring.biz.customerservice.vo.NoticeVO;
import com.spring.biz.customerservice.vo.QnaVO;

@Service("customerService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeServiceDAO noticeServiceDAO;
	
	//기본 생성자
	public NoticeServiceImpl() {
	}
	
	//게시글 상세보기 (공지사항 + 자주하는 질문)
	@Override
	public NoticeVO getBoard(NoticeVO vo, int num) {
		return noticeServiceDAO.getBoard(vo, num);
	}
	
	//공지사항 게시글 수 조회
	@Override
	public int countBoard() {
		return noticeServiceDAO.countBoard();
	}
	
	//공지사항 (페이징 처리 후)
	@Override
	public List<NoticeVO> selectBoard(PagingVO vo) {
		System.out.println(">> 공지사항 impl");
		return noticeServiceDAO.selectBoard(vo);
	}
	
}
