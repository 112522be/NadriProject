package com.yagn.nadrii.service.group.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Group;
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.group.GroupDao;
import com.yagn.nadrii.service.group.GroupService;;

@Service("groupServiceImpl")
public class GroupServiceImpl implements GroupService{
	
	///Field
	@Autowired
	@Qualifier("groupDaoImpl")
	private GroupDao groupDao;
	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}
	
	///Constructor
	public GroupServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public int addGroup(Group group) throws Exception {
		return groupDao.addGroup(group);
	}

	public Group getGroup(int groupNo) throws Exception {
		return groupDao.getGroup(groupNo);
	}

	public Map<String , Object > getGroupList(Search search) throws Exception {
		List<Group> list= groupDao.getGroupList(search);
		int totalCount = groupDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateGroup(Group group) throws Exception {
		groupDao.updateGroup(group);
	}
	
	public void deleteGroup(Group group) throws Exception {
		groupDao.deleteGroup(group);
	}
}