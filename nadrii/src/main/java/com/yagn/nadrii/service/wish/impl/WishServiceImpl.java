package com.yagn.nadrii.service.wish.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.service.domain.Wish;
import com.yagn.nadrii.service.wish.WishDao;
import com.yagn.nadrii.service.wish.WishService;


@Service("wishServiceImpl")
public class WishServiceImpl implements WishService{

	
	@Autowired
	@Qualifier("wishDaoImpl")
	private WishDao wishDao;
	
	
	
	public WishServiceImpl() {
		System.out.println(this.getClass());
	}
	

	@Override
	public void addWishListFromTrip(Wish wish) throws Exception {
		System.out.println("WishService addWishListFromTrip");
		wishDao.addWishListFromTrip(wish);
		
		
	}

	@Override
	public void addWishListFromPost(Wish wish) throws Exception {
		System.out.println("WishService addWishListFromPost");
		wishDao.addWishListFromPost(wish);
		
		
	}

	@Override
	public Wish getWish(int wishNo) throws Exception {
		System.out.println("WishService getWish");
		return wishDao.getWish(wishNo)	;
	}

	@Override
	public Map listWish(String userId) throws Exception {
		System.out.println("WishService listwish");
		Map map = new HashMap();
		List list = wishDao.listWish(userId);
		map.put("list", list);
		
		return map;
	}

	@Override
	public void deleteWish(int wishNo) throws Exception {
		System.out.println("WishService deleteWish");
		wishDao.deleteWish(wishNo);		
		
	}


	@Override
	public Wish getWishByTripNo(String userId,int tripNo) throws Exception {
		System.out.println("WishService getWishByTripNo");
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("tripNo", tripNo);
		System.out.println("¸ÁÇß´Ï?" + wishDao.getWishByTripNo(map));
		return wishDao.getWishByTripNo(map);
		
	}

	
}
