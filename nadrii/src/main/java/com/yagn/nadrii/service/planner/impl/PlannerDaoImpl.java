package com.yagn.nadrii.service.planner.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Planner;
import com.yagn.nadrii.service.planner.PlannerDao;

@Repository
public class PlannerDaoImpl implements PlannerDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PlannerDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addPlanner(Planner planner) throws Exception {
		System.out.println("PlannerDao/addPlanner ����");
		sqlSession.insert("PlannerMapper.addPlanner", planner);
		System.out.println("PlannerDao/addPlanner ����Ϸ�");
	}
	
	@Override
	public List<Planner> getMyPlannerList(Search	search) throws Exception{
		System.out.println("PlannerDao/getMyPlannerList ����");
		
		Map<String, Object> map = new HashMap<String, Object>();
//		plannerMakerId = "test01";
//		map.put("search", search);
//		map.put("plannerMakerId", plannerMakerId);
		
		return sqlSession.selectList("PlannerMapper.listMyPlanner", search);
	}

	@Override
	public List<Planner> getUserPlannerList(Search search) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PlannerDao/getUserPlannerList ����");
		return sqlSession.selectList("PlannerMapper.listUserPlanner", search);
	}

	@Override
	public Planner getPlanner(int postNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PlannerDao/getPlanner ����");
		return sqlSession.selectOne("PlannerMapper.getPlanner", postNo);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PlannerDao/getTotalCount ����");
		
		return sqlSession.selectOne("PlannerMapper.getTotalCount", search);
	}

}