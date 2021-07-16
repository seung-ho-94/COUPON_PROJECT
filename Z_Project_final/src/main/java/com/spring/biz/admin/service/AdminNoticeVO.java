package com.spring.biz.admin.service;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class AdminNoticeVO {

	private int no;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private int hit;
	private MultipartFile attach_file;
	private String file_name;

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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	@Override
	public String toString() {
		return "AdminNoticeVO [no=" + no + ", id=" + id + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", hit=" + hit + ", attach_file=" + attach_file + "]";
	}	
	
}
