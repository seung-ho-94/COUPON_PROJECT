package com.spring.biz.customerservice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.customerservice.FaqService;
import com.spring.biz.customerservice.vo.FaqVO;

@Controller
public class FaqServiceController {
	@Autowired
	private FaqService faqService;

	public FaqServiceController() {
	}
	
	//자주묻는질문 카테고리값 추출
    @RequestMapping("/goFaq.do")
    public String goFaq(FaqVO vo, Model model) {
        List<String> cateList = faqService.faqCategory();
        model.addAttribute("category", cateList);
        return "customer/faqList.jsp";
    }
    
    //자주묻는질문 카테고리값 추출해서 리스트 뽑아내기
    @RequestMapping("/gogoFaq.do")
    @ResponseBody
    public List<FaqVO> gogoFaq(FaqVO vo){
        List<FaqVO> faqlist = faqService.faqlist(vo);
        return faqlist;
    }
	
}
