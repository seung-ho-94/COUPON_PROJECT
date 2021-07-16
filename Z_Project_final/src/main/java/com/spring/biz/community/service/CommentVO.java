package com.spring.biz.community.service;

public class CommentVO {

	private int no;
	private int board_no;
	private String id;
	private String content;
	private String regdate;
	
	public CommentVO() { }

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CommentVO [no=" + no + ", board_no=" + board_no + ", id=" + id + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
	
	
}
