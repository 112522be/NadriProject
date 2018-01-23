package com.yagn.nadrii.service.trip;

import java.util.Map;

public interface TripService {
	
	public Map listTrip(TourAPlUrlManage tourAPlUrlManage) throws Exception;
	
	public TourApiDomain getTrip(TourAPlUrlManage tourAPlUrlManage) throws Exception;

}
