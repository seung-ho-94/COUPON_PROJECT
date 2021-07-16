package com.spring.biz.coupon.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.biz.coupon.service.DetatilReviewVO;

@Repository
public class DetailReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<DetatilReviewVO> detailreview(int coupon_key){
		return mybatis.selectList("detailreview.detailreview", coupon_key);
	}
}










