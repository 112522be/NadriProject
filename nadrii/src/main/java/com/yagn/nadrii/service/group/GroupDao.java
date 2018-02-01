package com.yagn.nadrii.service.group;

import java.util.List;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Group;
import com.yagn.nadrii.service.domain.Join;

public interface GroupDao {

	public int addGroup(Group group) throws Exception ;

	public Group getGroup(int groupNo) throws Exception ;

	public List<Group> getGroupList(Search search) throws Exception ;

	public void updateGroup(Group group) throws Exception ;

	public void deleteGroup(Group group) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
}