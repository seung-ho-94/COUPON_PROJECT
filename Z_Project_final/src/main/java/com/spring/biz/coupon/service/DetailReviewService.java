package com.spring.biz.coupon.service;

import java.util.List;

public interface DetailReviewService {

	//상품 상세 리뷰(최신순)
	List<DetatilReviewVO> detailreview(int coupon_key);
}
