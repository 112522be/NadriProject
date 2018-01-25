package com.yagn.nadrii.service.trip;

import java.util.List;

import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetDetailUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPlListUrlManage;

public interface TripDao {
	
	public List listTrip(TourAPlListUrlManage tourAPlUrlManage) throws Exception;
	
	public TourApiDomain getTrip(TourAPIGetUrlManage tourAPIGetUrlManage)throws Exception;
	
	public TourApiDomain getTripDetail(TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage)throws Exception;
	
	public String naverImageSearch(String target) throws Exception;
}
