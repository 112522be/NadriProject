package com.yagn.nadrii.service.planner;

import java.util.Map;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Planner;

public interface PlannerService {

	public void addPlanner(Planner planner) throws Exception;
	
	public Planner getPlanner(int postNo) throws Exception;
	
	public Map<String , Object > getPlannerList(Search search) throws Exception;
	
	public void updatePlanner(Planner planner) throws Exception;
}
