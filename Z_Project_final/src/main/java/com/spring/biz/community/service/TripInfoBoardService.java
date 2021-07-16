package com.spring.biz.community.service;

import java.util.List;


// 커뮤니티 - 여행 정보 게시판 메서드 정의 ==> Mapper로 이동
public interface TripInfoBoardService {
	
	// 페이징 처리 + 글 목록
	List<CommunityVO> selectTripInfoBoardList(Criteria cri);
	
	// 글 등록
	void insertTripInfoBoard(CommunityVO vo);
	
	// 글 상세 보기
	CommunityVO selectOneTripInfoBoard(int no);
	
	// 조회수 증가
	void tripHitUp(int no);
	
	// 글 삭제
	void deleteTripInfoBoard(int no);
	
	// 글 수정
	void updateTripInfoBoard(CommunityVO vo);
	
	// 게시물 총 갯수
	public int countTripInfoBoard(Criteria cri);

	// ====================


}
