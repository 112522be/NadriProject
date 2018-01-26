package com.yagn.nadrii.service.trip;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.comm.impl.CommDaoImpl;
import com.yagn.nadrii.service.domain.Community;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.impl.TripDaoImpl;

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
		trip.setLng("test�浵");
		trip.setLat("test����");
		trip.setAddress("test �ּ���");
		trip.setContentId("123456");
		trip.setContentTypeId("12");
		trip.setCreatedTime("01/01/01");
		trip.setDescription("test������");
		trip.setThumbnailImageFile("�̹��� ����");
		trip.setTripName("test������");
		
		
		tripDao.addTrip(trip);
		
		
		
	}
	
	//@Test
	public void getTripTest() throws Exception{
		trip =tripDao.getTrip(20000);
		System.out.println(trip);
		
	}
	
	//@Test
	public void listTrip() throws Exception{
		Search search = new Search();
		search.setSearchCondition("1");
		search.setSearchKeyword("%�ּ���%");
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		List list = tripDao.listTrip(search);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			
		}
		
		
	}
	
	@Test
	public void updateViewCount() throws Exception{
		
		
	}
	

}
