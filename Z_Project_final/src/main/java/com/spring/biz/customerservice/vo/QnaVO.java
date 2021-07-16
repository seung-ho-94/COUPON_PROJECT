package com.spring.biz.customerservice.vo;

public class QnaVO {
	private int no;
	private String id;
	private String title;
	private String content;
	private String email;
	private String category;
	private String regdate;
	
	public QnaVO() {
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "QnaVO [no=" + no + ", id=" + id + ", title=" + title + ", content=" + content + ", email=" + email
				+ ", category=" + category + ", regdate=" + regdate + "]";
	}

	
}
