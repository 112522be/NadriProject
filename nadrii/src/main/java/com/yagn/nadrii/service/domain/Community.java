package com.yagn.nadrii.service.domain;

public class Community {
	private int postNo;
	private String userId;
	private String title;
	private String thumbNailFileName;
	private String text;
	private String hashtag;
	private int viewCount;
	private String lat;
	private String lng;
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
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
	public String getThumbNailFileName() {
		return thumbNailFileName;
	}
	public void setThumbNailFileName(String thumbNailFileName) {
		this.thumbNailFileName = thumbNailFileName;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
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
	@Override
	public String toString() {
		return "Community [postNo=" + postNo + ", userId=" + userId + ", title=" + title + ", thumbNailFileName="
				+ thumbNailFileName + ", text=" + text + ", hashtag=" + hashtag + ", viewCount=" + viewCount + ", lat="
				+ lat + ", lng=" + lng + "]";
	}	
}
