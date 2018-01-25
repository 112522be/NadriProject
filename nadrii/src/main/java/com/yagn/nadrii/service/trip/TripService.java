package com.yagn.nadrii.service.trip;

import java.util.Map;

import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetDetailUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPlListUrlManage;

public interface TripService {
	
	public Map listTrip(TourAPlListUrlManage tourAPlUrlManage) throws Exception;
	
	public TourApiDomain getTrip(TourAPIGetUrlManage tourAPIGetUrlManage) throws Exception;
	
	public TourApiDomain getTripDetail(TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage)throws Exception;

}
