package com.spring.biz.customerservice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.customerservice.QnaCommentVO;
import com.spring.biz.customerservice.vo.ContactVO;
import com.spring.biz.customerservice.vo.QnaVO;


@Repository
public class QnaServiceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public QnaServiceDAO() {
	}
	
	//1대1문의 넣기
	public void setQna(QnaVO vo) {
		mybatis.insert("qna.setQna", vo);
	}
	
	//제휴문의 insert
	public void contactinsert(ContactVO vo) {
		System.out.println(">>> dao : " +  vo);
		mybatis.insert("contact.contactinsert", vo);
	}
	
	//1대1문의(나의 답변 select)
    public List<QnaCommentVO> qnaRe(String id) {
      return mybatis.selectList("adminDAO.qnaRe", id);
    }
    
    //1대1문의(나의 문의 select)
  	public List<QnaVO> qnaList(String id){
  		return mybatis.selectList("qna.selecQna", id);
  	}
}
