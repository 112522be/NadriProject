package com.yagn.nadrii.service.trip;

import java.util.List;

public interface TripDao {
	
	public List listTrip(TourAPlUrlManage tourAPlUrlManage) throws Exception;
	
	public TourApiDomain getTrip()throws Exception;
}
