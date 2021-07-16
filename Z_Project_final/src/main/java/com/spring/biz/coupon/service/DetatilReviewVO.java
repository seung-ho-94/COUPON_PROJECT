package com.spring.biz.coupon.service;

import java.sql.Date;

public class DetatilReviewVO {

	private int no;
	private int coupon_key;
	private String title;
	private String content;
	private String id;
	private int star;
	private Date regdate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCoupon_key() {
		return coupon_key;
	}
	public void setCoupon_key(int coupon_key) {
		this.coupon_key = coupon_key;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "DetatilReviewVO [no=" + no + ", coupon_key=" + coupon_key + ", title=" + title + ", content=" + content
				+ ", id=" + id + ", star=" + star + ", regdate=" + regdate + "]";
	}
	
}
