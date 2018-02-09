package com.yagn.nadrii.web.join;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.join.JoinService;

@RestController
@RequestMapping("/join/*")
public class JoinRestController {
	
	///Field
	@Autowired
	@Qualifier("joinServiceImpl")
	private JoinService joinService;
		
	public JoinRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addJoin/{groupNo}", method=RequestMethod.POST)
	public Join addJoin(@PathVariable int groupNo, HttpSession session) throws Exception {

		System.out.println("/join/json/addJoin :: POST");
		
		Join join = new Join();
		
		join.setGroupNo(groupNo);
		join.setGroupRole(2);
		join.setUserId(((User)session.getAttribute("loginUser")).getUserId());
				
		joinService.addJoin(join);
		
		return join;
	}
	
	@RequestMapping(value="json/deleteJoin/{groupNo}", method=RequestMethod.POST)
	public Join deleteJoin(@PathVariable int groupNo, HttpSession session) throws Exception {

		System.out.println("/join/json/deleteJoin");
		
		Join join = new Join();
		
		join.setGroupNo(groupNo);
		join.setUserId(((User)session.getAttribute("loginUser")).getUserId());
				
		joinService.deleteJoin(join);
		
		return join;
	}
	
	@RequestMapping(value="json/getJoinMemberList/{groupNo}" , method=RequestMethod.GET)
	public Map getJoinMemeberList(@PathVariable int groupNo) throws Exception {
		
		System.out.println("/join/json/getJoinMemberList");
		
		Search search = new Search();
		search.setSearchKeyword(Integer.toString(groupNo));
		
		return joinService.getJoinMemberList(search);
	}
		
	@RequestMapping(value="json/listJoin")
	public Map listJoin(@RequestBody Search search) throws Exception{
		
		System.out.println("/listJoin");

		Map<String , Object> map=joinService.getJoinList(search);
		
		return map;
	}
}