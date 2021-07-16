package com.spring.biz.customerservice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.customerservice.QnaCommentVO;
import com.spring.biz.customerservice.QnaService;
import com.spring.biz.customerservice.vo.ContactVO;
import com.spring.biz.customerservice.vo.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaServiceDAO qnaServiceDAO;
	
	//기본 생성자
	public QnaServiceImpl() {
	}
	
	//1대1문의 넣기
	@Override
	public void setQna(QnaVO vo) {
		qnaServiceDAO.setQna(vo);
	}
	
	//제휴문의 insert
	@Override
	public void contactinsert(ContactVO vo) {
		qnaServiceDAO.contactinsert(vo);
	}
	
	//1대1문의(나의 답변 select)
   @Override
   public List<QnaCommentVO> qnaRe(String id) {
      return qnaServiceDAO.qnaRe(id);
   }

	@Override
	public List<QnaVO> qnaList(String id) {
		// TODO Auto-generated method stub
		return qnaServiceDAO.qnaList(id);
	}
	
}
