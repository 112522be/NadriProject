package com.yagn.nadrii.service.trip;

import java.util.Map;

public interface TripService {
	
	public Map listTrip(TourAPlListUrlManage tourAPlUrlManage) throws Exception;
	
	public TourApiDomain getTrip(TourAPIGetUrlManage tourAPIGetUrlManage) throws Exception;
	
	public TourApiDomain getTripDetail(TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage)throws Exception;

}
