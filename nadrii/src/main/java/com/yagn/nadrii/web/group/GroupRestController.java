package com.yagn.nadrii.web.group;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.yagn.nadrii.common.Search;

import com.yagn.nadrii.common.Search;

import com.yagn.nadrii.service.domain.Group;
import com.yagn.nadrii.service.group.GroupService;

@RestController
@RequestMapping("/group/*")
public class GroupRestController {
	
	///Field
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
		
	public GroupRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="json/addGroup", method=RequestMethod.POST)
	public Group addGroup(@RequestBody Group group) throws Exception {

		System.out.println("/group/json/addGroup :: POST");
		
		groupService.addGroup(group);
		
		return group;
	}
	
	@RequestMapping(value="json/getGroup/{groupNo}" , method=RequestMethod.GET)
	public Group getGroup(@PathVariable int groupNo) throws Exception {
		
		System.out.println("/getGroup");
	
		return groupService.getGroup(groupNo);
	}
	
	@RequestMapping(value="json/updateGroup", method=RequestMethod.POST)
	public Group updateGroup(@RequestBody Group group) throws Exception{

		System.out.println("/updateGroup");
		
		groupService.updateGroup(group);
		
		return groupService.getGroup(group.getGroupNo());
	}
	
	
	@RequestMapping(value="json/listGroup")
	public Map listGroup(@RequestBody Search search) throws Exception{
		
		System.out.println("/listGroup");

		Map<String , Object> map=groupService.getGroupList(search);
		
		return map;
	}
}