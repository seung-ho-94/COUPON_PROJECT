package com.spring.biz.customerservice;

import java.util.List;

import com.spring.biz.customerservice.vo.FaqVO;

public interface FaqService {
	//자주묻는질문 카테고리값 추출
	public List<String> faqCategory();
	//자주묻는질문 카테고리값 추출해서 리스트 뽑아내기
    public List<FaqVO> faqlist(FaqVO vo);

}
	
