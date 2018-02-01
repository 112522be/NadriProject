package com.yagn.nadrii.service.domain;

import java.sql.Date;

public class Purchase {
	
	/// Field
	private int contentId;			
	private int contentTypeId;		

	private int ticketNo;			
	private String buyer;				
	private String ticketTitle;		
	private String imageFile;		
	private Date regDate;			
	private String bookingDate;		
	private String cancelDeadline;	

	private String ticketPriceAll;
	
	private String flag; 			
	

	public Purchase() {
		
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


	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}
/*
	public User getBuyer() {
		return buyer;
	}


	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
//*/

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


	public String getCancelDeadline() {
		return cancelDeadline;
	}


	public void setCancelDeadline(String cancelDeadline) {
		this.cancelDeadline = cancelDeadline;
	}


	public String getTicketPriceAll() {
		return ticketPriceAll;
	}


	public void setTicketPriceAll(String ticketPriceAll) {
		this.ticketPriceAll = ticketPriceAll;
	}


	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}


	@Override
	public String toString() {
		return "Purchase [contentId=" + contentId + ", contentTypeId=" + contentTypeId + ", ticketNo=" + ticketNo
				+ ", buyer=" + buyer + ", ticketTitle=" + ticketTitle + ", imageFile=" + imageFile + ", regDate="
				+ regDate + ", bookingDate=" + bookingDate + ", cancelDeadline=" + cancelDeadline + ", ticketPriceAll="
				+ ticketPriceAll + ", flag=" + flag + "]";
	}

	
	
	
	
}
