package com.yagn.nadrii.service.ticket;

import java.util.List;
import java.util.Map;

import com.yagn.nadrii.service.domain.DetailIntro;

public interface TicketDao {

	public Map<String, Object> getSearchFestival() throws Exception;
	
	public DetailIntro getDetailIntro(int ContentId, int ContentTypeId) throws Exception;
	
	
	
}
