package com.spring.biz.community.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Repository;


import com.spring.biz.community.service.CommunityVO;
import com.spring.biz.community.service.Criteria;


// --> Impl로 이동
@Repository("freeBoardDAO")
public class FreeBoardDAO { 
	
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public FreeBoardDAO() { }
	
	// 페이징 + 게시물 목록 조회 
	public List<CommunityVO> selectFreeBoardList(Criteria cri) {
		return mybatis.selectList("communityDAO.selectFreeBoardList", cri);
	}
	
	// 게시물 총 갯수 (페이징 처리)
	public int countFreeBoard(Criteria cri) {
		return mybatis.selectOne("communityDAO.countFreeBoard", cri);
	}
	
	// 글 등록
	public void insertFreeBoard(CommunityVO vo) {
		System.out.println("쓰기");
		mybatis.insert("communityDAO.insertFreeBoard", vo);
	}

	// 글 상세 보기
	public CommunityVO selectOneFreeBoard(int no) {
		System.out.println("상세");
		return mybatis.selectOne("communityDAO.selectOneFreeBoard", no);
	}
	
	// 조회수 증가
	public void freeHitUp(int no) {
		mybatis.update("communityDAO.freeHitUp", no);
	}

	// 글 삭제
	public void deleteFreeBoard(int no) {
		System.out.println("삭제");
		mybatis.delete("communityDAO.deleteFreeBoard", no);
		
	}

	// 글 수정
	public void updateFreeBoard(CommunityVO vo) {
		System.out.println("수정");
		mybatis.update("communityDAO.updateFreeBoard", vo);
		
	}

}