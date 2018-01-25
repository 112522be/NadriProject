package com.yagn.nadrii.service.trip;

import org.junit.Test;

import com.yagn.nadrii.service.comm.impl.CommDaoImpl;
import com.yagn.nadrii.service.domain.Community;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.impl.TripDaoImpl;

public class Triptest {
	
	private Trip trip;
	
	private TripDaoImpl tripDaoImpl;
	
	@Test
	public void addTripTest() throws Exception {
		tripDaoImpl = new TripDaoImpl();
		trip = new Trip();
		trip.setLng("test경도");
		trip.setLat("test위도");
		trip.setAddress("test 주소지");
		trip.setContentId("123456");
		trip.setContentTypeId("12");
		trip.setCreatedTime("01/01/01");
		trip.setDescription("test설명지");
		trip.setThumbnailImageFile("이미지 없음");
		trip.setTripName("test여행지");
		
		
		tripDaoImpl.addTrip(trip);
		
		
		
	}
	
	//@Test
	public void testtest() throws Exception{
		CommDaoImpl commDaoImpl = new CommDaoImpl();
	
		System.out.println(commDaoImpl.getComm(20001));
				
	}

}
