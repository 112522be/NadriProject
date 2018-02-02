package com.yagn.nadrii.service.domain;

import java.sql.Date;

public class Purchase {
	
	/// Field
	private int contentId;			
	private int contentTypeId;		


	private int postNo;			
	private String ticketTitle;		
	private String ticketImage;		
	private Date regDate;			
	private String bookingDate;		
	private String cancelDate;	
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

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getTicketTitle() {
		return ticketTitle;
	}

	public void setTicketTitle(String ticketTitle) {
		this.ticketTitle = ticketTitle;
	}

	public String getTicketImage() {
		return ticketImage;
	}

	public void setTicketImage(String ticketImage) {
		this.ticketImage = ticketImage;
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

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
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
		return "Purchase [contentId=" + contentId + ", contentTypeId=" + contentTypeId + ", postNo=" + postNo
				+ ", ticketTitle=" + ticketTitle + ", ticketImage=" + ticketImage + ", regDate=" + regDate
				+ ", bookingDate=" + bookingDate + ", cancelDate=" + cancelDate + ", ticketPriceAll=" + ticketPriceAll
				+ ", flag=" + flag + "]";
	}


	
	
	
}
