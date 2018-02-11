package com.yagn.nadrii.service.ticket;

import java.util.List;
import java.util.Map;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;

public interface TicketDao {

	/// TourAPI
	public Map<String, Object> getTicketList(OpenApiSearch openApiSearch) throws Exception;
	
	public DetailIntro getDetailIntro(int contentId, int contentTypeId) throws Exception;
	
	public DetailImage getDetailImage(int contentId, String title) throws Exception;
	
	public List<String> getTicketPrice(String priceInfo) throws Exception;
	
	
	/// NaverAPI
	public String getNaverImage(String title) throws Exception;
	
	
	/// KakaoAPI
	public String getKakaoImage(String title) throws Exception;
	
}