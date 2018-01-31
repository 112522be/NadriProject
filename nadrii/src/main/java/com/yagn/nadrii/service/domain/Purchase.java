package com.yagn.nadrii.service.domain;

import java.sql.Date;

public class Purchase {
	
	/// Field
	private int ticketNo;				// 티켓번호
	private User buyer;					// 유저아이디
	private String ticketTitle;			// 티켓명
	private String imageFile;			// 티켓 사진
	private Date regDate;				// 저장일자
	private String bookingDate;			// 예매일자
	private String lat; 				// x좌표
	private String lng; 				// y좌표
	private String cancelDeadline;		// 취소일자
	
	// 추후 타입 변경할 것
	private int price;					// 티켓가격
	private int ticketType;			// 티켓유형
	private int ticketCount;			// 티켓수량
	
	private int contentId;				// 컨텐트 아이디
	private int contentTypeId;			// 컨텐트 타입 아이디
	private String flag; 				// 바스켓 / 구매 구분
	
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
