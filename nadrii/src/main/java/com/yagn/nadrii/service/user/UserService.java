package com.yagn.nadrii.service.user;

import java.util.Map;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.User;

//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	
	// ������Ȯ�� / �α���
	public User getUser(String userId) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String , Object> getUserList(Search search) throws Exception;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	
	// ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(String userId) throws Exception;
	
	public int checkId(String user)throws Exception;
	
	public User loginCheck(User user)throws Exception;
	
	public String findId(String userId) throws Exception;
	
	public String findPassword(String userPw) throws Exception;

	public static void create(User user) {
		// TODO Auto-generated method stub
		
	}
	
	public void addUserPlus(User user) throws Exception;

}