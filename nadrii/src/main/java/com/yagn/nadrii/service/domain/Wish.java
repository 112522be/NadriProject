package com.yagn.nadrii.service.domain;

public class Wish {
	
	private int wishNo;
	private String userId;
	private int TripNo;
	private int postNo;
	private String imageFile;
	
	
	
	public Wish() {
		
	}
	
	public int getWishNo() {
		return wishNo;
	}
	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTripNo() {
		return TripNo;
	}
	public void setTripNo(int tripNo) {
		TripNo = tripNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	@Override
	public String toString() {
		return "Wish [wishNo=" + wishNo + ", userId=" + userId + ", TripNo=" + TripNo + ", postNo=" + postNo
				+ ", imageFile=" + imageFile + "]";
	}
	
	

}
