package com.yagn.nadrii.web.comm;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
							HttpServletRequest request) {
		Community community = commService.getComm(postNo);
		request.setAttribute("community", community);
		return "forward:/comm/getComm.jsp";
	}
	
	@RequestMapping("listComm")
	public String listComm(@ModelAttribute("search") Search search,
							HttpServletRequest request) {
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		System.out.println(search.getCurrentPage());
		System.out.println("pagesize : "+pageSize);
		System.out.println("pageUnit :: "+pageUnit);
		if(search.getPageSize() == 0) {
			search.setPageSize(pageSize);
		}else {
			pageSize = search.getPageSize();
		}
		
		// Business logic 수행
		Map<String , Object> map=commService.listComm(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("Page :: "+resultPage);
		
		// Model 과 View 연결
		request.setAttribute("list", map.get("list"));
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search);
		return "forward:/comm/listComm.jsp";
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