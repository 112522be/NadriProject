package com.yagn.nadrii.service.domain;

import java.sql.Date;

public class Purchase {
	
	/// Field
	private int ticketNo;			
	private User buyer;				
	private String ticketTitle;		
	private String imageFile;		
	private Date regDate;			
	private String bookingDate;		
	private String lat; 			
	private String lng; 			
	private String cancelDeadline;	
	
	private int price;				
	private int ticketType;			
	private int ticketCount;		
	
	private int contentId;			
	private int contentTypeId;		
	private String flag; 			
	
	public Purchase() {
		
	}

	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}

	public User getBuyer() {
		return buyer;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public String getTicketTitle() {
		return ticketTitle;
	}

	public void setTicketTitle(String ticketTitle) {
		this.ticketTitle = ticketTitle;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
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

	public String getCancelDeadline() {
		return cancelDeadline;
	}

	public void setCancelDeadline(String cancelDeadline) {
		this.cancelDeadline = cancelDeadline;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTicketType() {
		return ticketType;
	}

	public void setTicketType(int ticketType) {
		this.ticketType = ticketType;
	}

	public int getTicketCount() {
		return ticketCount;
	}

	public void setTicketCount(int ticketCount) {
		this.ticketCount = ticketCount;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public int getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(int contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "Purchase [ticketNo=" + ticketNo + ", buyer=" + buyer + ", ticketTitle=" + ticketTitle + ", imageFile="
				+ imageFile + ", regDate=" + regDate + ", bookingDate=" + bookingDate + ", lat=" + lat + ", lng=" + lng
				+ ", cancelDeadline=" + cancelDeadline + ", price=" + price + ", ticketType=" + ticketType
				+ ", ticketCount=" + ticketCount + ", contentId=" + contentId + ", contentTypeId=" + contentTypeId
				+ ", flag=" + flag + "]";
	}
	
	
	
}
