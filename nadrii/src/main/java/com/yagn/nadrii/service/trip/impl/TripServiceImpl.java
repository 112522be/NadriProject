package com.yagn.nadrii.service.trip.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.service.trip.TourAPlUrlManage;
import com.yagn.nadrii.service.trip.TourApiDomain;
import com.yagn.nadrii.service.trip.TripDao;
import com.yagn.nadrii.service.trip.TripService;

@Service("tripServiceImpl")
public class TripServiceImpl implements TripService {
	
	@Autowired
	@Qualifier("tripDaoImpl")
	private TripDao tripDao;
	
	
	
	public TripServiceImpl() {
		System.out.println(this.getClass());
		
	}



	@Override
	public Map listTrip(TourAPlUrlManage tourAPlUrlManage) throws Exception{
		
		System.out.println("listTrip SerivceImpl");
		Map map = new HashMap();
		
		List list = tripDao.listTrip(tourAPlUrlManage);
		map.put("list", list);
		return map;
	}



	@Override
	public TourApiDomain getTrip(TourAPlUrlManage tourAPlUrlManage) throws Exception {
		
		System.out.println("getTrip SerivceImpl");
		
		TourApiDomain tourApiDomain = tripDao.getTrip(tourAPlUrlManage);
		
		return tourApiDomain;
	}
	
	
	
}
