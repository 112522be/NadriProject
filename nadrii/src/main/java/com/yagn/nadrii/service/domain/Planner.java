package com.yagn.nadrii.service.domain;

import java.util.Date;

public class Planner {
	private int postNo;
	private Date regDate;
	private String userId;
	private String title;
	private String planText;
	private String hashtag;
	private String fileName;
	private int viewCount;
	private String lat;
	private String lng;
	private int totalTime;
	private int payment;
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlanText() {
		return planText;
	}
	public void setPlanText(String planText) {
		this.planText = planText;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public int getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "Planner [postNo=" + postNo + ", regDate=" + regDate + ", userId=" + userId + ", title=" + title
				+ ", planText=" + planText + ", hashtag=" + hashtag + ", fileName=" + fileName + ", viewCount="
				+ viewCount + ", lat=" + lat + ", lng=" + lng + ", totalTime=" + totalTime + ", payment=" + payment
				+ "]";
	}
}
