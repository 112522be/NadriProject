package com.yagn.nadrii.service.wish;

import java.util.Iterator;
import java.util.List;

import org.aspectj.lang.annotation.Around;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.comm.CommDao;
import com.yagn.nadrii.service.domain.Community;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.domain.Wish;
import com.yagn.nadrii.service.trip.TripDao;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })


public class Wishtest {
	
	private Wish wish;
	
	@Autowired
	@Qualifier("wishDaoImpl")
	private WishDao wishDao;
	
	@Autowired
	@Qualifier("tripDaoImpla")
	private TripDao tripDao;
	
	@Autowired
	@Qualifier("commDaoImpl")
	private CommDao commDao;
	
	
	String userId = "test01";
		
	//@Test
	public void addWishListFromTripTest() throws Exception {
		
		Trip trip = tripDao.getTrip(20000);
		System.out.println(trip);
		wish = new Wish();
		
		wish.setUserId(userId);
				
		wish.setTripNo(trip.getPostNo());
		wish.setImageFile("testImage");
		//wish.setPostNo(0);
		System.out.println(wish);
		wishDao.addWishListFromTrip(wish);
			
		
	}
	
	//@Test
	public void addWishListFromPostTest() throws Exception{
		String userId= "test01";
		Community community = new Community();
		community = commDao.getComm(30003);
		System.out.println(community);
		
		wish = new Wish();
		wish.setUserId(userId);
		
		wish.setImageFile("testImage");
		wish.setPostNo(community.getPostNo());
				
		wishDao.addWishListFromPost(wish);
		
		System.out.println(wish);
		
	}
	
	//@Test
	public void getWish() throws Exception{
		wish = wishDao.getWish(10001);
		System.out.println(wish);
	}
	
	//@Test
	public void listWish()throws Exception{
		List list = wishDao.listWish("test01");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			
		}
	}
	
	
	@Test
	public void deleteWish() throws Exception{
		wishDao.deleteWish(10001);
		System.out.println(wishDao.getWish(10001));
	}
		
}
