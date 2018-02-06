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

	private static String parser(String date) {
		String[] temp = date.split(" ");
		switch(temp[0]) {
			case "Mon" : 
				temp[0]="월";
				break;
			case "Tue" :
				temp[0]="화";
				break;
			case "Wed" :
				temp[0]="수";
				break;
			case "Thu" :
				temp[0]="목";
				break;
			case "Fri" :
				temp[0]="금";
				break;
			case "Sat" :
				temp[0]="토";
				break;
			case "Sun" :
				temp[0]="일";
				break;
		}
		switch(temp[1]) {
			case "Jan" :
				temp[1]="01";
				break;
			case "Feb" :
				temp[1]="02";
				break;
			case "Mar" :
				temp[1]="03";
				break;
			case "Apr" :
				temp[1]="04";
				break;
			case "May" :
				temp[1]="05";
				break;
			case "Jun" :
				temp[1]="06";
				break;
			case "Jul" :
				temp[1]="07";
				break;
			case "Aug" :
				temp[1]="08";
				break;
			case "Sep" :
				temp[1]="09";
				break;
			case "Oct" :
				temp[1]="10";
				break;
			case "Nov" :
				temp[1]="11";
				break;
			case "Dec" :
				temp[1]="12";
				break;
		}
		
		date = temp[5]+"."+temp[1]+"."+temp[2]+"("+temp[0]+") "+temp[3];
		return date;
	}
}
