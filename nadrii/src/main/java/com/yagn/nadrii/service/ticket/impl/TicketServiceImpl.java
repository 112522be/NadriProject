package com.yagn.nadrii.service.ticket.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.SearchFestival;
import com.yagn.nadrii.service.ticket.TicketDao;
import com.yagn.nadrii.service.ticket.TicketService;

@Service("ticketServiceImpl")
public class TicketServiceImpl implements TicketService {
	
	/// Field
	@Autowired
	@Qualifier("openApiDaoImpl")
	private TicketDao openApiDao;
	
	public void setOpenApiDao(TicketDao openApiDao) {
		this.openApiDao = openApiDao;
	}
	
	
	/// Constructor
	public TicketServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> getTicketList(OpenApiSearch openApiSearch) throws Exception {
		Map<String, Object> map = openApiDao.getTicketList(openApiSearch);
		return map;
	}
	
	@Override
	public DetailIntro getTicket(int contentId, int contentTypeId) throws Exception {
		return openApiDao.getDetailIntro(contentId, contentTypeId);
	}
	
	@Override
	public DetailImage getDetailImage(int contentId) throws Exception {
		return openApiDao.getDetailImage(contentId);
	}
	
	@Override
	public String getNaverImage(String title) throws Exception {
		return openApiDao.getNaverImage(title);
	}
}
