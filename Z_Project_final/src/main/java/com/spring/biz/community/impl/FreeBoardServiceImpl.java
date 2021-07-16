package com.spring.biz.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


import com.spring.biz.community.service.FreeBoardService;
import com.spring.biz.community.service.CommunityVO;
import com.spring.biz.community.service.Criteria;

// 비즈니스 로직 처리 서비스 영역에 사용 --> 오버 라이딩 후, DAO로 이동
// @Service : @Component 상속확장 어노테이션
@Repository
@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	private FreeBoardDAO freeBoardDAO;
	
	public FreeBoardServiceImpl() { }

	// 자유 게시판
	@Override
	public List<CommunityVO> selectFreeBoardList(Criteria cri) {
		return freeBoardDAO.selectFreeBoardList(cri);
	}

	@Override
	public int countFreeBoard(Criteria cri) {
		return freeBoardDAO.countFreeBoard(cri);
	}

	@Override
	public void insertFreeBoard(CommunityVO vo) {
		freeBoardDAO.insertFreeBoard(vo);
	}

	@Override
	public CommunityVO selectOneFreeBoard(int no) {
		return freeBoardDAO.selectOneFreeBoard(no);
	}
	
	@Override
	public void freeHitUp(int no) {
		freeBoardDAO.freeHitUp(no);
	}

	@Override
	public void deleteFreeBoard(int no) {
		freeBoardDAO.deleteFreeBoard(no);
	}

	@Override
	public void updateFreeBoard(CommunityVO vo) {
		freeBoardDAO.updateFreeBoard(vo);
	}





	
	



	











}
