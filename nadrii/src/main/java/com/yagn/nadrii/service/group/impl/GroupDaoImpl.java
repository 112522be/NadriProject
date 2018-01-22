package com.yagn.nadlii.service.group.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yagn.nadlii.common.Search;
import com.yagn.nadlii.service.domain.Group;
import com.yagn.nadlii.service.group.GroupDao;

@Repository("groupDaoImpl")
public class GroupDaoImpl implements GroupDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public GroupDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addGroup(Group group) throws Exception {
		sqlSession.insert("GroupMapper.addGroup", group);
	}

	public Group getGroup(int groupNo) throws Exception {
		return sqlSession.selectOne("GroupMapper.getGroup", groupNo);
	}
	
	public List<Group> getGroupList(Search search) throws Exception {
		return sqlSession.selectList("GroupMapper.getGroupList", search);
	}
	
	public void updateGroup(Group group) throws Exception {
		sqlSession.update("GroupMapper.updateGroup", group);
	}

	public void deleteGroup(Group group) throws Exception {
		sqlSession.delete("GroupMapper.deleteGroup", group);
	}
	
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("GroupMapper.getTotalCount", search);
	}
}