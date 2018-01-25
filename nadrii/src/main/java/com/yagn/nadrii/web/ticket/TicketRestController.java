package com.yagn.nadrii.web.ticket;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yagn.nadrii.common.OpenApiPage;
import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.SearchFestival;
import com.yagn.nadrii.service.domain.TourTicket;
import com.yagn.nadrii.service.ticket.TicketService;

// [행사정보 조회] 
@Controller
@RequestMapping("/ticket/*")
public class TicketRestController {

	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	/// Constructor
	public TicketRestController() {
			System.out.println(this.getClass());
		}
	
	/// Page process
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "json/listTicket", method = RequestMethod.POST)
	public Map<String, Object> listTicket(
			
			@RequestBody OpenApiSearch openApiSearch
			
			) throws Exception {
		
		System.out.println("\n/ticket/listTicket : GET");
		
		if(openApiSearch.getPageNo() == 0 ){
			openApiSearch.setPageNo(1);
		} 
		openApiSearch.setNumOfRows(pageSize);
		
		Map<String, Object> map = ticketService.getTicketList(openApiSearch);
		
		OpenApiPage resultPage = new OpenApiPage(
				openApiSearch.getPageNo(), 
				((Integer)map.get("totalCount")).intValue(), 
				pageUnit, 
				pageSize
				);
		
//		Map<String, Object> returnMap = new HashMap<>();
		
		map.put("tourTicket", map.get("tourTicketList"));
		map.put("resultPage", resultPage);
		
		return map; 
	}
	
} // end of class
