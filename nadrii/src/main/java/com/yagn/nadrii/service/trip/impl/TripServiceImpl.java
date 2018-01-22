package com.yagn.nadrii.service.trip.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.service.trip.TripDao;
import com.yagn.nadrii.service.trip.TripService;

@Service("tripServiceImpl")
public class TripServiceImpl implements TripService {
	
	@Autowired
	@Qualifier("tripDaoImpl")
	private TripDao tripDao;
	
	
	@Override
	public Map listTrip() throws Exception{
		Map map = new HashMap();
		
		List list = tripDao.listTrip();
		map.put("list", list);
		return map;
	}
}
