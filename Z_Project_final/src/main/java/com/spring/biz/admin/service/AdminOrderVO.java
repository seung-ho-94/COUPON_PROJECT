package com.spring.biz.admin.service;

import java.sql.Date;

public class AdminOrderVO {

	private int no, price, quantity;
	private String name, payment_option, status;
	private Date buy_date;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	
	@Override
	public String toString() {
		return "AdminOrderVO [no=" + no + ", price=" + price + ", quantity=" + quantity + ", name=" + name
				+ ", payment_option=" + payment_option + ", status=" + status + ", buy_date=" + buy_date + "]";
	}
	
}
