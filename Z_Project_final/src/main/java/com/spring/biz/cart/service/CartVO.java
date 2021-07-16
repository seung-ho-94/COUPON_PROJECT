package com.spring.biz.cart.service;

import java.sql.Date;

public class CartVO {
	private int no;
	private String id;
	private int coupon_key;
	private String name;
	private int price;
	private int quantity;
	private int total_price;
	private Date first_date;
	private Date last_date;
	private Date select_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCoupon_key() {
		return coupon_key;
	}
	public void setCoupon_key(int coupon_key) {
		this.coupon_key = coupon_key;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
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
	public Date getSelect_date() {
		return select_date;
	}
	public void setSelect_date(Date select_date) {
		this.select_date = select_date;
	}
	@Override
	public String toString() {
		return "CartVO [no=" + no + ", id=" + id + ", coupon_no=" + coupon_key + ", name=" + name + ", price=" + price
				+ ", quantity=" + quantity + ", total_price=" + total_price + ", first_date=" + first_date
				+ ", last_date=" + last_date + ", select_date=" + select_date + "]";
	}
	

	
	
}
