package com.yagn.nadrii.service.domain;

public class JoinMember {

	private int joinNo;
	private String userId;
	private int groupNo;
	private int groupRole;
	
	public JoinMember() {
	}
	
	public int getJoinNo() {
		return joinNo;
	}
	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getGroupRole() {
		return groupRole;
	}
	public void setGroupRole(int groupRole) {
		this.groupRole = groupRole;
	}

	@Override
	public String toString() {
		return "JoinMember [joinNo=" + joinNo + ", userId=" + userId + ", groupNo=" + groupNo + ", groupRole="
				+ groupRole + "]";
	}
	
}
