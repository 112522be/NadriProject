package com.yagn.nadrii.service.trip;

import java.util.List;

public interface TripDao {
	
	public List listTrip(TourAPlListUrlManage tourAPlUrlManage) throws Exception;
	
	public TourApiDomain getTrip(TourAPIGetUrlManage tourAPIGetUrlManage)throws Exception;
	
	public TourApiDomain getTripDetail(TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage)throws Exception;
}
