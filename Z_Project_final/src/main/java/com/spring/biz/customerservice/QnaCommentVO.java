package com.spring.biz.customerservice;

public class QnaCommentVO {

	private int no;
	private int q_no;
	private String id;
	private String content;
	private String regdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
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
		return "QnaCommentVO [no=" + no + ", q_no=" + q_no + ", id=" + id + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
	
}
