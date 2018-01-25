package com.yagn.nadrii.service.trip.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.TripDao;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetDetailUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPlListUrlManage;

public class TripDaoImpl implements TripDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public TripDaoImpl() {
	}

	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public List listTrip(TourAPlListUrlManage tourAPlUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TourApiDomain getTrip(TourAPIGetUrlManage tourAPIGetUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TourApiDomain getTripDetail(TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String naverImageSearch(String target) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void addTrip(Trip trip) throws Exception {
		sqlSession.insert("TripMapper.addTrip", trip);
	}


	@Override
	public Trip getTrip(int postNo) throws Exception {
		return sqlSession.selectOne("TripMapper.getTrip", postNo);
	}


	@Override
	public List<Trip> listTrip(Search search) throws Exception {
		//
		return sqlSession.selectList("TripMapper.listTrip",search);
	}


	@Override
	public void updateViewCount(int postNo) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
