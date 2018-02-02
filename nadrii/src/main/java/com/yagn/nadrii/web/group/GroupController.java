package com.yagn.nadrii.web.group;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.common.Page;
import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Group;
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.group.GroupService;
import com.yagn.nadrii.service.join.JoinService;

@Controller
@RequestMapping("/group/*")
public class GroupController {
	
	///Field
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("joinServiceImpl")
	private JoinService joinService;
		
	public GroupController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="addGroup", method=RequestMethod.GET)
	public String addGroup() throws Exception {

		System.out.println("/addGroupView");

		return "forward:/group/addGroupView.jsp";
	}
	
	@RequestMapping(value="addGroup", method=RequestMethod.POST)
	public String addGroup(@ModelAttribute("group") Group group, 
											@ModelAttribute("join") Join join, 	HttpSession session) throws Exception {

		System.out.println("/addGroup");
		
		int groupNo = groupService.addGroup(group);
		
		join.setGroupNo(groupNo);
		join.setGroupRole(1);
		join.setUserId(((User)session.getAttribute("user")).getUserId());
		
		group.setJoin(join);
		
		joinService.addJoin(join);
		
		return "forward:/group/getGroup?groupNo="+groupNo;
	}
	
	@RequestMapping(value="getGroup", method=RequestMethod.GET)
	public String getGroup(@RequestParam("groupNo") int groupNo, Model model) throws Exception {
		
		System.out.println("/getGroup");
		
		Group group = groupService.getGroup(groupNo);
			
		model.addAttribute("group", group);
		
		return "forward:/group/getGroup?groupNo="+groupNo;
		
	}
	
	@RequestMapping(value="updateGroup", method=RequestMethod.GET)
	public String updateGroup(@RequestParam("groupNo") int groupNo, Model model) throws Exception{

		System.out.println("/updateGroupView");

		Group group = groupService.getGroup(groupNo);
	
		model.addAttribute("group", group);
		
		return "forward:/group/updateGroupView.jsp";
	}
	
	@RequestMapping(value="updateGroup", method=RequestMethod.POST)
	public String updateGroup(@ModelAttribute("group") Group group, @ModelAttribute("join") Join join) throws Exception{

		System.out.println("/updateGroup");
		
		groupService.updateGroup(group);
		
		return "forward:/group/getGroup.jsp";
	}
	
	@RequestMapping(value="deleteGroup")
	public String deleteGroup(@RequestParam("groupNo") int groupNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("/deleteGroup");
		
		Group group = groupService.getGroup(groupNo);
		
		Join join = new Join();
		
		join.setGroupNo(groupNo);
		join.setUserId(((User)session.getAttribute("user")).getUserId());
		
		joinService.deleteJoin(join);
		
		group.setJoin(join);
		
		groupService.deleteGroup(group);
		
		model.addAttribute("group", group);
		
		return "forward:/group/listGroup?groupNo="+groupNo;
	}
	
	@RequestMapping(value="listGroup")
	public String listGroup(@ModelAttribute("search") Search search, Model model) throws Exception{
		
		System.out.println("/listGroup");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=groupService.getGroupList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage :: "+resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/group/listGroup.jsp";
	}
}