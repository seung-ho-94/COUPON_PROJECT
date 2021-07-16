package com.spring.biz.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.biz.community.service.TripInfoBoardService;
import com.spring.biz.community.service.CommunityVO;
import com.spring.biz.community.service.Criteria;

// 비즈니스 로직 처리 서비스 영역에 사용 --> 오버 라이딩 후, DAO로 이동
// @Service : @Component 상속확장 어노테이션
@Service("tripInfoBoardService")
public class TripInfoBoardServiceImpl implements TripInfoBoardService {

	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	private TripInfoBoardDAO tripInfoBoardDAO;
	
	public TripInfoBoardServiceImpl() { }

	// 여행 정보 게시판
	@Override
	public List<CommunityVO> selectTripInfoBoardList(Criteria cri) {
		return tripInfoBoardDAO.selectTripInfoBoardList(cri);
	}

	@Override
	public void insertTripInfoBoard(CommunityVO vo) {
		tripInfoBoardDAO.insertTripInfoBoard(vo);
	}

	@Override
	public CommunityVO selectOneTripInfoBoard(int no) {
		return tripInfoBoardDAO.selectOneTripInfoBoard(no);
	}

	@Override
	public void deleteTripInfoBoard(int no) {
		tripInfoBoardDAO.deleteTripInfoBoard(no);
	}

	@Override
	public void updateTripInfoBoard(CommunityVO vo) {
		tripInfoBoardDAO.updateTripInfoBoard(vo);
	}
	
	@Override
	public int countTripInfoBoard(Criteria cri) {
		return tripInfoBoardDAO.countTripInfoBoard(cri);
	}
	
	@Override
	public void tripHitUp(int no) {
		tripInfoBoardDAO.tripHitUp(no);
	}
}
