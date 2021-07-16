package com.spring.biz.customerservice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.common.PagingVO;
import com.spring.biz.customerservice.vo.NoticeVO;

@Repository
public class NoticeServiceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public NoticeServiceDAO() {
	}
	
	//글상세조회(데이터 하나 조회)
	public NoticeVO getBoard(NoticeVO vo, int num) {
		System.out.println("===> myBatis로 getBoard() 실행");
		mybatis.update("notice.noticeHitUpdate", num);
		return mybatis.selectOne("notice.getBoard", vo);
	}

	//공지사항 전체 게시글수 
	public int countBoard() {
		return mybatis.selectOne("notice.countBoard");
	}
	
	//공지사항 리스트
	public List<NoticeVO> selectBoard(PagingVO vo) {
		System.out.println(">> 공지사항 DAO");
		return mybatis.selectList("notice.selectBoard", vo);
	}	
	
}
