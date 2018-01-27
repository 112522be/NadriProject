package com.yagn.nadrii.web.wish;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yagn.nadrii.service.wish.WishService;

@Repository
@RequestMapping("/wish/*")
public class WishRestController {
	
	@Autowired
	@Qualifier("wishServiceImpl")
	private WishService wishService;
	
	
	
	public void addWishFromTrip() {
		System.out.println("addWishFromTrip");
		
	}
	
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
