package com.yagn.nadrii.service.join.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.join.JoinDao;

@Repository("joinDaoImpl")
public class JoinDaoImpl implements JoinDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public JoinDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addJoin(Join join) throws Exception {
		sqlSession.insert("JoinMapper.addJoin", join);
	}
	
	public void deleteJoin(Join join) throws Exception {
		sqlSession.delete("JoinMapper.deleteJoin", join);
	}

	@Override
	public Join getJoin(int joinNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Join> getJoinList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateJoin(Join join) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}