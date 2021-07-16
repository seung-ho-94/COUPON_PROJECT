package com.spring.biz.customerservice;

import java.util.List;

import com.spring.biz.common.PagingVO;
import com.spring.biz.customerservice.vo.NoticeVO;
import com.spring.biz.customerservice.vo.QnaVO;


public interface NoticeService {
	//게시글 상세보기
	NoticeVO getBoard(NoticeVO vo, int num);
	// 공지사항의 게시물 총 갯수
	public int countBoard();
	// 페이징 처리 후 공지사항
	public List<NoticeVO> selectBoard(PagingVO vo);
}
