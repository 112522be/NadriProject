package com.yagn.nadrii.service.domain;

import java.util.Date;
import java.util.Calendar;

public class Comments {
	private int commentNo;
	private String userId;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
		return "Comments [commentNo=" + commentNo + ", userId=" + userId + ", regDate=" + regDate + ", text=" + text
				+ ", postNo=" + postNo + "]";
	}
}
