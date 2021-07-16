package com.spring.biz.admin.service;

// 관리자 아이디, 패스워드 VO
public class AdminVO {
	private String admin_id, admin_password;

	public String getId() {
		return admin_id;
	}

	public void setId(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getPassword() {
		return admin_password;
	}

	public void setPassword(String admin_password) {
		this.admin_password = admin_password;
	}
	
	
}