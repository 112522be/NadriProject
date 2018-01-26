package com.yagn.nadrii.service.planner;

import java.util.List;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Planner;

public interface PlannerDao {

	public void addPlanner(Planner planner) throws Exception;
	
	public Planner getPlanner(int postNo) throws Exception;
	
	public void updatePlanner(Planner planner) throws Exception;
	
	public List<Planner> getPlannerList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
}