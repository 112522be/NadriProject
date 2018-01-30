package com.yagn.nadrii.service.planner.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Planner;
import com.yagn.nadrii.service.planner.PlannerDao;


public class PlannerDaoImpl implements PlannerDao{
	
	///Field
//	@Autowired
//	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PlannerDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addPlanner(Planner planner) throws Exception {
		sqlSession.insert("PlannerMapper.addPlanner", planner);
	}

	public Planner getPlanner(int postNo) throws Exception {
		return sqlSession.selectOne("PlannerMapper.getPlanner", postNo);
	}
	
	public void updatePlanner(Planner planner) throws Exception {
		sqlSession.update("PlannerMapper.updatePlanner", planner);
	}

	public List<Planner> getPlannerList(Search search) throws Exception {
		return sqlSession.selectList("PlannerMapper.getPlannerList", search);
	}

	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("PlannerMapper.getTotalCount", search);
	}
}