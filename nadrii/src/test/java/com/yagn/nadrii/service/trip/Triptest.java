package com.yagn.nadrii.service.trip;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Trip;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })


public class Triptest {
	
	private Trip trip;
	
	@Autowired
	@Qualifier("tripDaoImpla")
	private TripDao tripDao;
	
	//private TripDaoImpl tripDaoImpl;
	
	//@Test
	public void addTripTest() throws Exception {
		
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
		
		
		tripDao.addTrip(trip);
		
		
		
	}
	
	//@Test
	public Trip getTripTest() throws Exception{
		trip =tripDao.getTrip(20004);
		System.out.println(trip);
		return trip;
		
	}
	
	@Test
	public void listTrip() throws Exception{
		Search search = new Search();
		search.setSearchCondition("1");
		search.setSearchKeyword("%주소지%");
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		List list = tripDao.listTrip(search);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			
		}
		
		
	}
	
	//@Test
	public void updateViewCount() throws Exception{
		trip = this.getTripTest();
		
		if(trip==null) {
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
			tripDao.addTrip(trip);
			
			
		}else {
		
			tripDao.updateViewCount(trip.getPostNo());
		}
		
	}
	

}
