package com.spring.biz.community.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Repository;


import com.spring.biz.community.service.CommunityVO;
import com.spring.biz.community.service.Criteria;
import com.spring.biz.community.service.PageMaker;

// --> Impl로 이동
@Repository("tripInfoBoardDAO")
public class TripInfoBoardDAO { 
	
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public TripInfoBoardDAO() { }
	
	// 페이징 + 게시물 목록 조회 
	public List<CommunityVO> selectTripInfoBoardList(Criteria cri) {
		return mybatis.selectList("communityDAO.selectTripInfoBoardList", cri);
	}
	
	// 게시물 총 갯수 (페이징 처리)
	public int countTripInfoBoard(Criteria cri) {
		return mybatis.selectOne("communityDAO.countTripInfoBoard", cri);
	}
	
	// 글 등록
	public void insertTripInfoBoard(CommunityVO vo) {
		System.out.println("쓰기");
		mybatis.insert("communityDAO.insertTripInfoBoard", vo);
	}

	// 글 상세 보기
	public CommunityVO selectOneTripInfoBoard(int no) {
		System.out.println("상세");
		return mybatis.selectOne("communityDAO.selectOneTripInfoBoard", no);
	}
	
	// 조회수 증가
	public void tripHitUp(int no) {
		mybatis.update("communityDAO.tripHitUp", no);
	}

	// 글 삭제
	public void deleteTripInfoBoard(int no) {
		System.out.println("삭제");
		mybatis.delete("communityDAO.deleteTripInfoBoard", no);
	}

	// 글 수정
	public void updateTripInfoBoard(CommunityVO vo) {
		System.out.println("수정");
		mybatis.update("communityDAO.updateTripInfoBoard", vo);
	}
}