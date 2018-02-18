package com.yagn.nadrii.service.wish;

import java.util.List;
import java.util.Map;

import com.yagn.nadrii.service.domain.Wish;

public interface WishDao {

	public void addWishListFromTrip(Wish wish)throws Exception;
	
	public void addWishListFromPost(Wish wish)throws Exception;
	
	public Wish getWish(int wishNo)throws Exception;
	
	public List<Wish> listWish(String userId) throws Exception;
	
	public void deleteWish(int wishNo) throws Exception;
		
	public Wish getWishByTripNo(Map map) throws Exception;
	
	
}
