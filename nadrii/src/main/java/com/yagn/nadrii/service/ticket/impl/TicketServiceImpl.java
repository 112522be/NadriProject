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
	private TicketDao tourDao;
	
	@Autowired
	@Qualifier("naverApiDaoImpl")
	private TicketDao naverDao;
	
	public void setTourDao(TicketDao tourDao) {
		this.tourDao = tourDao;
	}
	
	public void setNaverDao(TicketDao naverDao) {
		this.naverDao = naverDao;
	}
	
	/// Constructor
	public TicketServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> getTicketList(OpenApiSearch openApiSearch) throws Exception {
		Map<String, Object> map = tourDao.getTicketList(openApiSearch);
		return map;
	}
	
	@Override
	public DetailIntro getTicket(int contentId, int contentTypeId) throws Exception {
		return tourDao.getDetailIntro(contentId, contentTypeId);
	}
	
	@Override
	public DetailImage getDetailImage(int contentId) throws Exception {
		return tourDao.getDetailImage(contentId);
	}
	
}
