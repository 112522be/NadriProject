package com.yagn.nadrii.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.user.UserDao;


//==> È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ DAO CRUD ï¿½ï¿½ï¿½ï¿½
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		System.out.println(user);
		sqlSession.insert("UserMapper.addUser", user);
	}

	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}

	// ï¿½Ô½ï¿½ï¿½ï¿½ Page Ã³ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Ã¼ Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}

	@Override
	public int checkId(String user) throws Exception {
		System.out.println("´Ù¿À °ª : " + user);
		return sqlSession.selectOne("UserMapper.checkId" , user);
	}

	@Override
	public User loginProc(User user) throws Exception {
		System.out.println("¾ÆÀÌµð ºñ¹Ð¹øÈ£" +user);
		return sqlSession.selectOne("UserMapper.loginProc", user);
	}

	public String findId(String userId) throws Exception {
		System.out.println("¾ÆÀÌµð Ã£±â" +userId);
		return sqlSession.selectOne("UserMapper.faindId",userId);
	}

	public String findPassword(String userPw) throws Exception {
		System.out.println("ºñ¹Ð¹øÈ£ Ã£±â" +userPw);
		return sqlSession.selectOne("UserMapper.faindPassword", userPw);
	}
	
	public void addUserPlus(User user) throws Exception{
		
		System.out.println("Ãß°¡Á¤º¸ ÀÔ·Â..." + user.toString());
		sqlSession.selectOne("UserMapper.addUserPlus", user);
	}
}