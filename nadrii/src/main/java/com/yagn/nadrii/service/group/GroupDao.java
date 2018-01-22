package com.yagn.nadlii.service.group;

import java.util.List;

import com.yagn.nadlii.common.Search;
import com.yagn.nadlii.service.domain.Group;

public interface GroupDao {

	public void addGroup(Group group) throws Exception ;

	public Group getGroup(int groupNo) throws Exception ;

	public List<Group> getGroupList(Search search) throws Exception ;

	public void updateGroup(Group group) throws Exception ;

	public void deleteGroup(Group group) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
}