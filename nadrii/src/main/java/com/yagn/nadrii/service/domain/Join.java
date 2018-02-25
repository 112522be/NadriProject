package com.yagn.nadrii.service.domain;

public class Join {

	private int joinNo;
	private int groupNo;
	private String userId;
	private int groupRole;
	private String regDate;
	
	public Join(){
	}

	public int getJoinNo() {
		return joinNo;
	}

	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getGroupRole() {
		return groupRole;
	}

	public void setGroupRole(int groupRole) {
		this.groupRole = groupRole;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Join [joinNo=" + joinNo + ", groupNo=" + groupNo + ", userId=" + userId + ", groupRole=" + groupRole
				+ ", regDate=" + regDate + "]";
	}

	
}