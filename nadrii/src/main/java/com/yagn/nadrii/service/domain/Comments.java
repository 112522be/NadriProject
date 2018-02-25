package com.yagn.nadrii.service.domain;

import java.util.Date;
import java.util.Calendar;

public class Comments {
	private int commentNo;
	private User user;
	private String regDate;
	private int postNo;
	private String text;
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public User getUser() {
		return user;
	}
	public void setUserId(User user) {
		this.user = user;
	}
	public String getRegDate() {
		return regDate;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "Comments [commentNo=" + commentNo + ", user=" + user + ", regDate=" + regDate + ", text=" + text
				+ ", postNo=" + postNo + "]";
	}
}
