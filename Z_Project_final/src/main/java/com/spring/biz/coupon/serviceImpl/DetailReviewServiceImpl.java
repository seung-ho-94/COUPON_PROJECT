package com.spring.biz.coupon.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.coupon.service.DetailReviewService;
import com.spring.biz.coupon.service.DetatilReviewVO;


@Service("detailreview")
public class DetailReviewServiceImpl implements DetailReviewService {
	@Autowired
	private	DetailReviewDAO detailReviewDAO;
	
	@Override
	public List<DetatilReviewVO> detailreview(int coupon_key) {
		return detailReviewDAO.detailreview(coupon_key);
	}
}
