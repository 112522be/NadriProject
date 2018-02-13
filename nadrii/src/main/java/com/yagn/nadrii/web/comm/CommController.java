package com.yagn.nadrii.web.comm;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.common.Page;
import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.comm.CommService;
import com.yagn.nadrii.service.domain.Community;

@Controller
@RequestMapping("/comm/*")
public class CommController {
	
	@Autowired
	@Qualifier("commServiceImpl")
	private CommService commService;
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping("addComm")
	public String addComm(@ModelAttribute Community community) {
		System.out.println("--------"+community);
		int postNo = commService.addComm(community);
		return "redirect:/comm/getComm?postNo="+postNo;
	}
	
	@RequestMapping("getComm")
	public String getComm(@RequestParam int postNo, 
							HttpServletRequest request,
							HttpSession session) {
		if(session.getAttribute("loginUser") == null) {
			return "/user/loginView.jsp";
		}
		Community community = commService.getComm(postNo);
		String[] temps = community.getHashtag().split(",");
		String temp ="";
		for(int i=1;i<temps.length;i++) {
			if(i == 1) {
				temp = "#"+temps[i];
			}else {
				temp += " #"+temps[i];
			}
		}
		community.setHashtag(temp);
		request.setAttribute("community", community);
		return "forward:/comm/getComm.jsp";
	}
	
	@RequestMapping("listComm")
	public String listComm(@ModelAttribute("search") Search search,
							HttpServletRequest request) {
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		System.out.println(search);
		System.out.println("pagesize : "+pageSize);
		System.out.println("pageUnit :: "+pageUnit);
		if(search.getPageSize() == 0) {
			search.setPageSize(pageSize);
		}else {
			pageSize = search.getPageSize();
		}
		
		Map<String , Object> map=commService.listComm(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		request.setAttribute("list", map.get("listComm"));
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search);
		return "forward:/comm/listComm.jsp";
	}
	
	@RequestMapping("updateCommView")
	public String updateCommView(@RequestParam int postNo, HttpServletRequest request) {
		Community community = commService.getComm(postNo);
		String[] temp = community.getHashtag().split(",");
		List<String> hashtags = new ArrayList<>();
		for(int i=1;i<temp.length;i++) {
			hashtags.add(temp[i]);
		}
		request.setAttribute("community", community);
		request.setAttribute("hashtags", hashtags);
		request.setAttribute("menu", "update");
		return "forward:/comm/addComm.jsp";
	}
	
	@RequestMapping("updateComm")
	public String updateComm(@ModelAttribute Community community) {
		commService.updateComm(community);
		return "forward:/comm/getComm?postNo="+community.getPostNo();
	}
	
	@RequestMapping("deleteComm")
	public String deleteComm(@RequestParam int postNo) {
		commService.deleteComm(postNo);
		return "forward:/comm/listComm";
	}
}