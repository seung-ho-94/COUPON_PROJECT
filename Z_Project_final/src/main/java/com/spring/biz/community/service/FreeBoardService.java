package com.spring.biz.community.service;

import java.util.List;


// 커뮤니티 - 자유 게시판 메서드 정의 ==> Mapper로 이동
public interface FreeBoardService {
	
	// 페이징 처리 + 글 목록
	List<CommunityVO> selectFreeBoardList(Criteria cri);
	
	// 글 등록
	void insertFreeBoard(CommunityVO vo);
	
	// 글 상세 보기
	CommunityVO selectOneFreeBoard(int no);
	
	// 조회수 증가
	void freeHitUp(int no);
	
	// 글 삭제
	void deleteFreeBoard(int no);
	
	// 글 수정
	void updateFreeBoard(CommunityVO vo);
	
	// 게시물 총 갯수
	public int countFreeBoard(Criteria cri);

	// ====================


}
