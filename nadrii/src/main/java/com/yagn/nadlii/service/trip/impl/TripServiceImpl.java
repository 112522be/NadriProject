package com.yagn.nadlii.service.trip.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yagn.nadlii.service.trip.TripDao;
import com.yagn.nadlii.service.trip.TripService;

public class TripServiceImpl implements TripService{

	private TripDao tripDao;
	
	public Map listTrip() throws Exception {
		Map map = new HashMap();
		
		List list = tripDao.listTripFromTour();
		map.put("list", list);
		
		return map;
	}

}
