package com.yagn.nadrii.web.ticket;

import java.util.Map;

import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.SearchFestival;
import com.yagn.nadrii.service.domain.TourTicket;
import com.yagn.nadrii.service.ticket.TicketService;

// [행사정보 조회] 
@Controller
@RequestMapping("/ticket/*")
public class TicketController {

	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	/// Constructor
	public TicketController() {
			System.out.println(this.getClass());
		}
	
	/// Page process
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['numOfRows']}")
	int numOfRows;
	
	@RequestMapping(value = "listTicket", method = RequestMethod.GET)
	public String listTicket(

			@ModelAttribute("tourTicket") TourTicket tourTicket,
			Model model
			
			) throws Exception {
		
		System.out.println("\n/ticket/listTicket : GET");
		
		Map<String, Object> map = ticketService.getTicketList();
		
		/*
		System.out.println("\n==========[searchFestival]");
		System.out.println(map.get("searchFestivalList"));
		System.out.println("\n==========[detailIntro]");
		System.out.println(map.get("detailIntroList"));
		System.out.println("\n==========[tourTicket]");
		System.out.println(map.get("tourTicketList"));
		//*/
	
//		model.addAttribute("searchFestival", map.get("searchFestivalList"));
//		model.addAttribute("detailIntro", map.get("detailIntroList"));
		model.addAttribute("tourTicket", map.get("tourTicketList"));
		
		return "forward:/ticket/listTicket.jsp";
	}
	
	@RequestMapping(value = "getTicket", method = RequestMethod.POST)
	public String getTicket(
		@ModelAttribute("tourTicket") TourTicket tourTicket,
		Model model
			) throws Exception {
		
		System.out.println("\n/ticket/getTicket : POST");
		
		
		return "forward:/ticket/getTicket.jsp";
	}
	
} // end of class
