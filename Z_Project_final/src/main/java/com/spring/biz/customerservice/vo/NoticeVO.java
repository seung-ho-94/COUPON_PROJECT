package com.spring.biz.customerservice.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int no;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private int hit;
	private MultipartFile attach_file;
	
	public NoticeVO() {
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public MultipartFile getAttach_file() {
		return attach_file;
	}

	public void setAttach_file(MultipartFile attach_file) {
		this.attach_file = attach_file;
	}

	@Override
	public String toString() {
		return "CustomerServiceVO [no=" + no + ", id=" + id + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", hit=" + hit + ", attach_file=" + attach_file + "]";
	}
	
	
	
}
