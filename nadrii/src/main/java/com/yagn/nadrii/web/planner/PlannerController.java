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
	
	@RequestMapping("addPlannerView")
	public String addPlannerView(User user, HttpSession session) throws Exception{
		
		System.out.println("PlannerController/addPlannerView 접속");
		//session 에 저장된 userId 값을 가져옴
		user = (User)session.getAttribute("loginUser");
		System.out.println("user :: "+ user);
				
		//user가 접속했는지 확인
		if(user == null) {
			System.out.println("로그인한 회원만 사용가능합니다.");
			return "forward:/user/loginView.jsp";
		}
		
		System.out.println("addPlannerView로 이동");
		
		return "forward:../planner/addPlannerView.jsp";
	}
	
	@RequestMapping(value="addPlanner", method=RequestMethod.POST)
	public String addPlanner(@ModelAttribute("planner")Planner planner, User user, HttpSession session) throws Exception{
		
		System.out.println("PlannerController/addPlanner 접속");
		
		user = (User)session.getAttribute("loginUser");
		String plannerMakerId = user.getUserId();
		System.out.println("로그인한 유저 ID : "+plannerMakerId);
		
		planner.setFlag("pl");
		planner.setPlannerMakerId(plannerMakerId);
		planner.setPhoto("kk");
		
		System.out.println("planner :: "+planner);
		
		plannerService.addPlanner(planner);
		
		System.out.println("PlannerController/addPlanner 접속완료");
		
		return "redirect:/planner/getMyPlannerList";
	}
	
	@RequestMapping(value="getMyPlannerList", method=RequestMethod.GET)
	public String getMyPlannerList(@ModelAttribute("search")Search search, User user,
			HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("PlannerController/getMyPlannerList 접속");
		
		//session 에 저장된 userId 값을 가져옴
		user = (User)session.getAttribute("loginUser");
		System.out.println("user :: "+ user);
		
		//user가 접속했는지 확인
		if(user == null) {
			System.out.println("로그인한 회원만 사용가능합니다.");
			return "forward:/user/loginView.jsp";
		}
		
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
		System.out.println("list ::" +map.get("list"));
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search);
		
		System.out.println("PlannerController/getMyPlannerList 접속완료");
		
		return "forward:/planner/listMyPlanner.jsp";
	}
	
	@RequestMapping(value="getUserPlannerList", method=RequestMethod.GET)
	public String getUserPlannerList(@ModelAttribute("search")Search search, String plannerMakerId, 
			HttpServletRequest request) throws Exception{
		
		System.out.println("PlannerController/getUserPlannerList 접속");
		
		plannerMakerId = null;
		
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
		
		Map<String , Object> map = plannerService.getUserPlannerList(search, plannerMakerId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("Page :: "+resultPage);
		System.out.println("list ::" +map.get("list"));
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search);
		
		System.out.println("PlannerController/getUserPlannerList 접속완료");
		
		return "forward:/planner/listUserPlanner.jsp";
	}
	
	@RequestMapping(value="getPlanner", method=RequestMethod.GET)
	public String getPlanner(@RequestParam("postNo")int postNo, HttpServletRequest request) throws Exception{
		
		System.out.println("PlannerController/getPlanner 접속");
		System.out.println("postNo :: "+postNo);
		Planner planner = plannerService.getPlanner(postNo);
		
		//db에서 가져온 x,y좌표를 파싱하여 저장
		String[] lat = planner.getLat().split(",");
		String[] lng = planner.getLng().split(",");
		
		int latLength = lat.length;
		
		System.out.println(latLength);
		
		System.out.println("lat :: "+lat);
		System.out.println("lng :: "+lng);
		
		request.setAttribute("planner", planner);
		request.setAttribute("lat", lat);
		request.setAttribute("lng", lng);
		request.setAttribute("latLength", latLength);
		
		System.out.println("PlannerController/getPlanner 접속완료");
		
		return "forward:/planner/getPlanner.jsp";
	}
	
	@RequestMapping(value="deletePlanner", method=RequestMethod.GET)
	public String deletePlanner(@RequestParam("postNo")int postNo, HttpServletRequest request) throws Exception{
		
		System.out.println("PlannerController/deletePlanner 접속");
		
		plannerService.deletePlanner(postNo);
		
		System.out.println("PlannerController/deletePlanner 완료");
		
		return "forward:/planner/getMyPlannerList";
	}

}