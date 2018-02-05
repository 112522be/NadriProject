package com.yagn.nadrii.web.planner;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.common.Page;
import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Planner;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.planner.PlannerService;

@Controller
@RequestMapping("/planner/*")
public class PlannerController {
	
	///Field
	@Autowired
	@Qualifier("plannerServiceImpl")
	private PlannerService plannerService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public PlannerController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addPlanner", method=RequestMethod.POST)
	public String addPlanner(@ModelAttribute("planner")Planner planner) throws Exception{
		
		System.out.println("PlannerController/addPlanner 접속");
		System.out.println("planner :: "+planner);
		planner.setFlag("pl");
		planner.setPlannerMakerId("test01");
		planner.setPhoto("kk");
		planner.setText("what the fuck");
		plannerService.addPlanner(planner);
		System.out.println("PlannerController/addPlanner 수행완료");
		
		return "redirect:../planner/json/getMyPlannerList";
	}
	
	@RequestMapping(value="json/getMyPlannerList", method=RequestMethod.GET)
	public String getMyPlannerList(@ModelAttribute("search")Search search, User user,
			HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("PlannerController/getMyPlannerList 접속");
		
		//userId 를 session 에서 받아와 처리
//		user = (User)session.getAttribute("userId");
//		System.out.println("user :: "+ user);
//		
		
		
		//
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		System.out.println("currentPage :: " + search.getCurrentPage());
		System.out.println("pageSize :: " + pageSize);
		System.out.println("pageUnit ::" + pageUnit);
		
		if(search.getPageSize() == 0) {
			search.setPageSize(pageSize);
		}else {
			pageSize = search.getPageSize();
		}
		
		String plannerMakerId = user.getUserId();
		System.out.println("UserId :: " + plannerMakerId);
		

		Map<String , Object> map = plannerService.getMyPlannerList(search, plannerMakerId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("Page :: "+resultPage);
		
		System.out.println("::::::   "+map.get("list"));
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search);
		
		System.out.println("PlannerController/getMyPlannerList 완료");
		
		return "forward:/planner/listMyPlanner.jsp";
	}
	
	@RequestMapping(value="getUserPlannerList", method=RequestMethod.GET)
	public String getUserPlannerList(@RequestParam("search")Search search) throws Exception{
		
		System.out.println("PlannerController/getUserPlannerList 접속");
		
		plannerService.getUserPlannerList(search);
		
		System.out.println("PlannerController/getUserPlannerList 완료");
		
		return "forward:/planner/listUserPlanner.jsp";
	}
	
	@RequestMapping(value="getPlanner", method=RequestMethod.GET)
	public String getPlanner(@RequestParam("postNo")int postNo, HttpServletRequest request) throws Exception{
		
		System.out.println("PlannerController/getPlanner 접속");
		System.out.println("::::: "+postNo);
		Planner planner = plannerService.getPlanner(postNo);
		
		request.setAttribute("planner", planner);
		
		System.out.println("PlannerController/getPlanner 완료");
		
		return "forward:/planner/getPlanner.jsp";
	}
	

}