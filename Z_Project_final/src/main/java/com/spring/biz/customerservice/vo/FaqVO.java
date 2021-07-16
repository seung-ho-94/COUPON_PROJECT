package com.spring.biz.customerservice.vo;

public class FaqVO {
	private int no;
	private String category;
    private String question;
    private String answer;
    
    public FaqVO() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "FaqVO [no=" + no + ", category=" + category + ", question=" + question + ", answer=" + answer + "]";
	}
    
}
