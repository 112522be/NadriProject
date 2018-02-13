package com.yagn.nadrii.service.domain;

import java.sql.Date;



public class User {
	
	///Field
	private String userId;
	private String userName;
	private String password;
	private String role;
	private String phone;
	private String addr;
	private String email;
	private Date regDate;
	private String birth;
	private String profileImageFile;
	private String qrCode;
	private String children;
	private String gender;

	private String phone1;
	private String phone2;
	private String phone3;
	private String checkSuccess;
	///Constructor
	public User(){
	}
	
	///Method 
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
		/////////////// EL ���� ���� �߰� ///////////
		if(phone != null && phone.length() !=0 ){
			phone1 = phone.split("-")[0];
			phone2 = phone.split("-")[1];
			phone3 = phone.split("-")[2];
		}
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getbirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getprofileimageFile() {
		return profileImageFile;
	}
	public void setProfiIeimageFile(String profileImageFile) {
		this.profileImageFile = profileImageFile;
	}
	public String getchildren() {
		return children;
	}
	public void setChildren(String children) {
		this.children = children;
	}
	public String getgender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	/////////////// EL ���� ���� �߰��� getter Method ///////////
	public String getPhone1() {
		return phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public String getPhone3() {
		return phone3;
	}

	
	
	public String getQrCode() {
		return qrCode;
	}

	public void setQrCode(String qrCode) {
		this.qrCode = qrCode;
	}
	
	

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", role=" + role
				+ ", phone=" + phone + ", addr=" + addr + ", email=" + email + ", regDate=" + regDate + ", birth="
				+ birth + ", profileImageFile=" + profileImageFile + ", qrCode=" + qrCode + ", children=" + children
				+ ", gender=" + gender + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3
				+ ", checkSuccess=" + checkSuccess + "]";
	}

	////////////////////////////////////////////////////////////////////////////////////////
	// JSON ==> Domain Object  Binding�� ���� �߰��� �κ�
	// POJO �� �߿伺
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	/////////////////////////////////////////////////////////////////////////////////////////

	public String getCheckSuccess() {
		return checkSuccess;
	}

	public void setCheckSuccess(String checkSuccess) {
		this.checkSuccess = checkSuccess;
	}
}