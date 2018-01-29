package com.yagn.nadrii.web.wish;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.yagn.nadrii.service.domain.Trip;

import com.yagn.nadrii.service.trip.TripService;
import com.yagn.nadrii.service.wish.WishService;

@RestController
@RequestMapping("/wish/*")
public class WishRestController {
	
	@Autowired
	@Qualifier("wishServiceImpl")
	private WishService wishService;
	
	
	@Autowired
	@Qualifier("tripServiceImpl")
	private TripService tripService;
	
	//userId는 세션을 통해 받는 것이고, 
	
	
	public WishRestController() {
		System.out.println(this.getClass());
	}
/*
	public void addWishFromTrip() {
		System.out.println("addWishFromTrip");
		Trip trip
		
	}
	*/
	public void addWishFromPost() {
		System.out.println("addWishFromPost");
	}
	
	public void getWish() {
		System.out.println("getWish");
	}
	
	public void listWish() {
		System.out.println("listWish");
	}
	
	public void deleteWish() {
		System.out.println("deleteWish");
		
	}
	

}
