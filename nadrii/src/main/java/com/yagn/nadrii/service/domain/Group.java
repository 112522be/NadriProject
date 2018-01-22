package com.yagn.nadlii.service.domain;

import java.sql.Date;

public class Group {
	
	private int groupNo;
	private String groupName;
	private String categoryCode;
	private String title;
	private String text;
	private String meetingDate;
	private int viewCount;
	private String lat;
	private String lng;
	private Date regDate;
	
	public Group(){
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Group [groupNo=" + groupNo + ", groupName=" + groupName + ", categoryCode=" + categoryCode + ", title=" + title
				+ ", text=" + text + ", meetingDate=" + meetingDate + ", viewCount=" + viewCount + ", lat=" + lat
				+ ", lng=" + lng + ", regDate=" + regDate + "]";
	}
	
}