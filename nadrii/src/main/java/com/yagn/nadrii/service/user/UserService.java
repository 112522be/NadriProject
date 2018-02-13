package com.yagn.nadrii.service.user;

import java.util.Map;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.User;


public interface UserService {
	

	public void addUser(User user) throws Exception;
	

	public User getUser(String userId) throws Exception;
	
 
	public Map<String , Object> getUserList(Search search) throws Exception;
	

	public void updateUser(User user) throws Exception;
	

	public boolean checkDuplication(String userId) throws Exception;
	
	public int checkId(String user)throws Exception;
	
	public User loginCheck(User user)throws Exception;
	
	public String findId(String userId) throws Exception;
	
	public String findPassword(String userPw) throws Exception;

	public void create(User user)throws Exception;
	
	public void addUserPlus(User user) throws Exception;

}