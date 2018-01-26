package com.yagn.nadrii.service.ticket;

import java.util.Map;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;

public interface TicketDao {

	/// TourAPI
	public Map<String, Object> getTicketList(OpenApiSearch openApiSearch) throws Exception;
	
	public DetailIntro getDetailIntro(int contentId, int contentTypeId) throws Exception;
	
	public DetailImage getDetailImage(int contentId) throws Exception;
	
	
	/// NaverAPI
	public String getNaverImage(String title) throws Exception;
	
}
