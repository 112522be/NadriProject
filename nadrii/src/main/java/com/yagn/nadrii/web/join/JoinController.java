package com.yagn.nadrii.web.join;

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
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.join.JoinService;

@Controller
@RequestMapping("/join/*")
public class JoinController {
	
	@Autowired
	@Qualifier("joinServiceImpl")
	private JoinService joinService;
		
	public JoinController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addJoin", method=RequestMethod.POST)
	public String addJoin(@ModelAttribute("join") Join join, @RequestParam("groupNo") int groupNo, HttpSession session) throws Exception {

		System.out.println("/addJoin");
	
		join.setGroupNo(groupNo);
		join.setGroupRole(2);
		join.setUserId(((User)session.getAttribute("user")).getUserId());
		
		joinService.addJoin(join);
		
		return "forward:/group/getGroup?groupNo="+groupNo;
	}
	
	@RequestMapping(value="getJoin", method=RequestMethod.GET)
	public String getJoin(@RequestParam("joinNo") int joinNo, Model model) throws Exception {
		
		System.out.println("/getJoin");
		
		Join join = joinService.getJoin(joinNo);
	
		model.addAttribute("join", join);
		
		return "forward:/join/getJoin?joinNo="+joinNo;
		
	}
	
	@RequestMapping(value="listJoin")
	public String listJoin(@ModelAttribute("join") Join join, @ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception{
		
		System.out.println("/listJoin");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		User user = (User)session.getAttribute("user");
		
		join.setUserId(user.getUserId());
		search.setSearchKeyword(join.getUserId());
		
		Map<String , Object> map=joinService.getJoinList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage :: "+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/join/listJoin.jsp";
	}
		
	@RequestMapping(value="deleteJoin")
	public String deletePurchase(@ModelAttribute("join") Join join, @RequestParam("groupNo") int groupNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("/deleteJoin");
		
		join.setGroupNo(groupNo);
		join.setUserId(((User)session.getAttribute("user")).getUserId());
		
		joinService.deleteJoin(join);
		
		model.addAttribute("join", join);
		
		return "forward:/group/getGroup?groupNo="+groupNo;
	}
	

}