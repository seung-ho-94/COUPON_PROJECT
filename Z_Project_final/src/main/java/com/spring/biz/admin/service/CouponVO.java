package com.spring.biz.admin.service;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

// '상품관리' >> '상품등록'(쿠폰) VO
public class CouponVO {
   private String name, attach_file1, attach_file2, attach_file3, local_category, coupon_category, content;
   private Date first_date, last_date;
   private int coupon_key, hit, like_count, price, upload_count;
   
   private MultipartFile file1;
   private MultipartFile file2;
   private MultipartFile file3;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getAttach_file1() {
	return attach_file1;
}
public void setAttach_file1(String attach_file1) {
	this.attach_file1 = attach_file1;
}
public String getAttach_file2() {
	return attach_file2;
}
public void setAttach_file2(String attach_file2) {
	this.attach_file2 = attach_file2;
}
public String getAttach_file3() {
	return attach_file3;
}
public void setAttach_file3(String attach_file3) {
	this.attach_file3 = attach_file3;
}
public String getLocal_category() {
	return local_category;
}
public void setLocal_category(String local_category) {
	this.local_category = local_category;
}
public String getCoupon_category() {
	return coupon_category;
}
public void setCoupon_category(String coupon_category) {
	this.coupon_category = coupon_category;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getFirst_date() {
	return first_date;
}
public void setFirst_date(Date first_date) {
	this.first_date = first_date;
}
public Date getLast_date() {
	return last_date;
}
public void setLast_date(Date last_date) {
	this.last_date = last_date;
}
public int getCoupon_key() {
	return coupon_key;
}
public void setCoupon_key(int coupon_key) {
	this.coupon_key = coupon_key;
}
public int getHit() {
	return hit;
}
public void setHit(int hit) {
	this.hit = hit;
}
public int getLike_count() {
	return like_count;
}
public void setLike_count(int like_count) {
	this.like_count = like_count;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getUpload_count() {
	return upload_count;
}
public void setUpload_count(int upload_count) {
	this.upload_count = upload_count;
}
public MultipartFile getFile1() {
	return file1;
}
public void setFile1(MultipartFile file1) {
	this.file1 = file1;
}
public MultipartFile getFile2() {
	return file2;
}
public void setFile2(MultipartFile file2) {
	this.file2 = file2;
}
public MultipartFile getFile3() {
	return file3;
}
public void setFile3(MultipartFile file3) {
	this.file3 = file3;
}
   
   
   
}