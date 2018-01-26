package com.yagn.nadrii.service.planner.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Planner;
import com.yagn.nadrii.service.planner.PlannerDao;
import com.yagn.nadrii.service.planner.PlannerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("plannerServiceImpl")
public class PlannerServiceImpl implements PlannerService{
	
	///Field
//	@Autowired
//	@Qualifier("plannerDaoImpl")
	private PlannerDao plannerDao;
	public void setPlannerDao(PlannerDao plannerDao) {
		this.plannerDao = plannerDao;
	}
	
	///Constructor
	public PlannerServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addPlanner(Planner planner) throws Exception {
		plannerDao.addPlanner(planner);
	}

	public Planner getPlanner(int postNo) throws Exception {
		return plannerDao.getPlanner(postNo);
	}

	public Map<String , Object > getPlannerList(Search search) throws Exception {
		List<Planner> list= plannerDao.getPlannerList(search);
		int totalCount = plannerDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updatePlanner(Planner planner) throws Exception {
		plannerDao.updatePlanner(planner);
	}
}
