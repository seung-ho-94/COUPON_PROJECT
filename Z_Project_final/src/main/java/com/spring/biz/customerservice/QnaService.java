package com.spring.biz.customerservice;

import java.util.List;

import com.spring.biz.customerservice.vo.ContactVO;
import com.spring.biz.customerservice.vo.QnaVO;


public interface QnaService {
	// 1대1문의 보내기
	public void setQna(QnaVO vo);
	
	//제휴문의 보내기
	public void contactinsert(ContactVO vo);

	//1대1문의(나의 답변 select)
	public List<QnaCommentVO> qnaRe(String id);
   
	//1대1문의(나의 문의 select)
	public List<QnaVO> qnaList(String id);
	
}
