package com.yagn.nadrii.service.trip;

import java.util.List;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetDetailUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPlListUrlManage;

public interface TripDao {
	
	public List listTrip(TourAPlListUrlManage tourAPlUrlManage) throws Exception;
	
	public TourApiDomain getTrip(TourAPIGetUrlManage tourAPIGetUrlManage)throws Exception;
	
	public TourApiDomain getTripDetail(TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage)throws Exception;
	
	public String naverImageSearch(String target) throws Exception;
	
	public void addTrip(Trip trip)throws Exception;
	
	public Trip getTrip(int postNo) throws Exception;
	
	public List<Trip> listTrip(Search search) throws Exception;
	
	public void updateViewCount(int postNo) throws Exception;
	
	public Trip getTripFromDB(String contentid) throws Exception;
}
