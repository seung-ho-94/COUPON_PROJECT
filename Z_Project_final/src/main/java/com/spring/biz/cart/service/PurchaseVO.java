package com.spring.biz.cart.service;

import java.sql.Date;

public class PurchaseVO {

	private int no, total_price, quantity, coupon_key;
	private String id, payment_option, status, email, name;
	private Date buy_date;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getCoupon_key() {
		return coupon_key;
	}
	public void setCoupon_key(int coupon_key) {
		this.coupon_key = coupon_key;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPayment_option() {
		return payment_option;
	}
	public void setPayment_option(String payment_option) {
		this.payment_option = payment_option;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	
	@Override
	public String toString() {
		return "PurchaseVO [no=" + no + ", total_price=" + total_price + ", quantity=" + quantity + ", coupon_key="
				+ coupon_key + ", id=" + id + ", payment_option=" + payment_option + ", status=" + status
				+ ", email=" + email + ", buy_date=" + buy_date + "]";
	}
	
}
