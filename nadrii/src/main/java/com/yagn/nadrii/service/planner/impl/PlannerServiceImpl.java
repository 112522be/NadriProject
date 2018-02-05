package com.yagn.nadrii.service.planner.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Planner;
import com.yagn.nadrii.service.planner.PlannerDao;
import com.yagn.nadrii.service.planner.PlannerService;

@Service("plannerServiceImpl")
public class PlannerServiceImpl implements PlannerService{
	
	///Field
	@Autowired
	@Qualifier("plannerDaoImpl")
	private PlannerDao plannerDao;
	public void setPlannerDao(PlannerDao plannerDao) {
		this.plannerDao = plannerDao;
	}
	
	///Constructor
	public PlannerServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addPlanner(Planner planner) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PlannerService/addPlanner 立加");
		plannerDao.addPlanner(planner);
		System.out.println("PlannerService/addPlanner 荐青肯丰");
	}

	@Override
	public Map<String, Object> getMyPlannerList(Search search, String plannerMakerId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PlannerService/getMyPlannerList 立加");
		
		List<Planner> list = plannerDao.getMyPlannerList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		int totalCount = plannerDao.getTotalCount(search);
		
		map.put("list", list);
		map.put("search", search);
		map.put("totalCount", totalCount);
		
		System.out.println("PlannerService/getMyPlannerList 荐青肯丰");
		
		return map;
	}

	@Override
	public Map<String, Object> getUserPlannerList(Search search) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PlannerService/getUserPlannerList 立加");
		
		List<Planner> list = plannerDao.getUserPlannerList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		
		System.out.println("PlannerService/getUserPlannerList 荐青肯丰");
		
		return map;
	}

	@Override
	public Planner getPlanner(int postNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PlannerService/getPlanner 立加");
		
		return plannerDao.getPlanner(postNo);
	}

}
