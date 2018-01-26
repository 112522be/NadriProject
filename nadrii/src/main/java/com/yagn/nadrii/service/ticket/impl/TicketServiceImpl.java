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
	public Map<String, Object> getTicketList(OpenApiSearch openApiSearch) throws Exception {
		
		Map<String, Object> map = ticketDao.getTicketList(openApiSearch);
		
		return map;
	}
	
	@Override
	public DetailIntro getTicket(int contentId, int contentTypeId) throws Exception {
		
		return ticketDao.getDetailIntro(contentId, contentTypeId);
	}
	
	public DetailImage getDetailImage(int contentId) throws Exception {
		
		return ticketDao.getDetailImage(contentId);
	}
	
}
