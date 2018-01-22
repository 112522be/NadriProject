package com.yagn.nadlii.service.group;

import java.util.Map;

import com.yagn.nadlii.common.Search;
import com.yagn.nadlii.service.domain.Group;
  
public interface GroupService {
	
	public void addGroup(Group group) throws Exception;
	
	public Group getGroup(int groupNo) throws Exception;
	 
	public Map<String , Object> getGroupList(Search search) throws Exception;
	
	public void updateGroup(Group group) throws Exception;
	
	public void deleteGroup(Group group) throws Exception;
}