package com.yagn.nadrii.service.ticket.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.ticket.TicketDao;
import com.model2.mvc.service.ticket.TicketService;

@Service("ticketServiceImpl")
public class TicketServiceImpl implements TicketService {
	
	/// Field
	@Autowired
	@Qualifier("tourApiDaoImpl")
	private TicketDao ticketDao;
	
	public void setTicketDao(TicketDao ticketDao) {
		this.ticketDao = ticketDao;
	}
	
	/// Constructor
	public TicketServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> getSearchFestival() throws Exception {
		
		System.out.println("\n[TicketServiceImpl.java]::getSearchFestival");
		
		Map<String, Object> searchFestivalMap = ticketDao.getSearchFestival();
		
		
//		Map<String, Object> returnMap = ticketDao.getDetailIntro(, ContentTypeId)
		
		return searchFestivalMap;
	}
}
