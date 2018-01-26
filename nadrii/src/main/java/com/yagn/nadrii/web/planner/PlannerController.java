package com.yagn.nadrii.web.planner;

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
	
}