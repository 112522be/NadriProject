package com.yagn.nadrii.service.user;

import java.util.List;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// SELECT LIST
	public List<User> getUserList(Search search) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
	public int checkId(String user) throws Exception;
	
	public User loginProc(User user) throws Exception;
	
	public String findId(String user) throws Exception;
	
	public String findPassword(String user) throws Exception;
	
	public void addUserPlus(User user) throws Exception;

}