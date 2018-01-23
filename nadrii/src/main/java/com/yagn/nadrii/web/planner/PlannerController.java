package com.yagn.nadrii.web.planner;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.common.Page;
import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Planner;
import com.yagn.nadrii.service.planner.PlannerService;

//@Controller
//@RequestMapping("/planner/*")
public class PlannerController {
	
	///Field
//	@Autowired
//	@Qualifier("plannerServiceImpl")
	private PlannerService plannerService;
		
	public PlannerController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="addPlanner", method=RequestMethod.GET )
	public String addPlanner() throws Exception{
	
		System.out.println("/planner/addPlanner : GET");
		
		return "redirect:/planner/addPlannerView.jsp";
	}
	
	@RequestMapping( value="addPlanner", method=RequestMethod.POST )
	public String addPlanner( @ModelAttribute("planner") Planner planner ) throws Exception {

		System.out.println("/planner/addPlanner : POST");
		//Business Logic
		plannerService.addPlanner(planner);
		
		return "redirect:/planner/loginView.jsp";
	}
	
	@RequestMapping( value="getPlanner", method=RequestMethod.GET )
	public String getPlanner( @RequestParam("postNo") int postNo , Model model ) throws Exception {
		
		System.out.println("/planner/getPlanner : GET");
		//Business Logic
		Planner planner = plannerService.getPlanner(postNo);
		// Model �� View ����
		model.addAttribute("planner", planner);
		
		return "forward:/planner/getPlanner.jsp";
	}
	
	@RequestMapping( value="updatePlanner", method=RequestMethod.GET )
	public String updatePlanner( @RequestParam("postNo") int postNo , Model model ) throws Exception{

		System.out.println("/planner/updatePlanner : GET");
		//Business Logic
		Planner planner = plannerService.getPlanner(postNo);
		// Model �� View ����
		model.addAttribute("planner", planner);
		
		return "forward:/planner/updatePlanner.jsp";
	}

	@RequestMapping( value="updatePlanner", method=RequestMethod.POST )
	public String updatePlanner( @ModelAttribute("planner") Planner planner , Model model , HttpSession session) throws Exception{

		System.out.println("/planner/updatePlanner : POST");
		//Business Logic
		plannerService.updatePlanner(planner);

		return "redirect:/planner/getPlanner?postNo="+planner.getPostNo();
	}
	
	@RequestMapping( value="listPlanner" )
	public String listPlanner( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/planner/listPlanner : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		Map<String , Object> map=plannerService.getPlannerList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/planner/listPlanner.jsp";
	}
}