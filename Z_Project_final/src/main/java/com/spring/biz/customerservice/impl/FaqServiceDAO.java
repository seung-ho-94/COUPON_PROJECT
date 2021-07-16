package com.spring.biz.customerservice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.customerservice.vo.FaqVO;



@Repository
public class FaqServiceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public FaqServiceDAO() {
	}
	
	//자주묻는질문 카테고리값 추출
    public List<String> faqCategoryStrings() {
        return mybatis.selectList("faq.faqCategoryStrings");
    }

    //자주묻는질문 카테고리값 추출해서 리스트 뽑아내기
    public List<FaqVO> faqList(FaqVO vo) {
        return mybatis.selectList("faq.faqlist", vo);
    }	
	
}
