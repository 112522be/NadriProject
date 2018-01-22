package com.yagn.nadrii.service.ticket;

import java.util.Map;

public interface TicketDao {

	public Map<String, Object> getSearchFestival() throws Exception;
	
	public Map<String, Object> getDetailIntro(int ContentId, int ContentTypeId) throws Exception;
	
}
