package com.yagn.nadrii.service.wish;


import java.util.Map;

import com.yagn.nadrii.service.domain.Wish;

public interface WishService {
	
	public void addWishListFromTrip(Wish wish)throws Exception;
	
	public void addWishListFromPost(Wish wish)throws Exception;
	
	public Wish getWish(int wishNo)throws Exception;
	
	public Map listWish(String userId) throws Exception;
	
	public void deleteWish(int wishNo) throws Exception;

	public Wish getWishByTripNo(String UserId, int tripNo) throws Exception;
}