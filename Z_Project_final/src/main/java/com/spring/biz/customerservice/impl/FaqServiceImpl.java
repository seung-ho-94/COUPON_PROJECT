package com.spring.biz.customerservice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.customerservice.FaqService;
import com.spring.biz.customerservice.vo.FaqVO;

@Service("faq")
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqServiceDAO faqServiceDAO;
	
	//기본 생성자
	public FaqServiceImpl() {
	}
	
	//자주묻는질문 카테고리값 추출
	@Override
	public List<String> faqCategory() {
		// TODO Auto-generated method stub
		return faqServiceDAO.faqCategoryStrings();
	}
	
	//자주묻는질문 카테고리값 추출해서 리스트 뽑아내기
	@Override
	public List<FaqVO> faqlist(FaqVO vo) {
		// TODO Auto-generated method stub
		return faqServiceDAO.faqList(vo);
	}
	
}
