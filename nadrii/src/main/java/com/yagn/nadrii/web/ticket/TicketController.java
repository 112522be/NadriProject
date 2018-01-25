package com.yagn.nadrii.web.ticket;

import java.net.URLDecoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.common.OpenApiPage;
import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
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
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "listTicket")
	public String listTicket(
			@ModelAttribute("openApiSearch") OpenApiSearch openApiSearch,
			Model model
			) throws Exception {
		
		System.out.println("\n /ticket/listTicket : GET / POST");

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
			
		System.out.println("[resultPage]"+resultPage);
		
		model.addAttribute("tourTicket", map.get("tourTicketList"));
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/ticket/listTicket.jsp";
	}
	
	@RequestMapping(value = "getTicket", method = RequestMethod.GET)
	public String getTicket(
		@RequestParam("contentId") int contentId,	
		@RequestParam("contentTypeId") int contentTypeId,
		@RequestParam("title") String title,
		Model model
			) throws Exception {
		
		System.out.println("\n /ticket/getTicket : GET");

		String decodeTitle = URLDecoder.decode(title, "UTF-8");
		
		DetailIntro detailIntro = ticketService.getTicket(contentId, contentTypeId);
		DetailImage detailImage = ticketService.getDetailImage(contentId);
		
		TourTicket tourTicket = new TourTicket();
		tourTicket.setTitle(decodeTitle);
		tourTicket.setContentid(contentId);
		tourTicket.setContenttypeid(contentTypeId);
		
		model.addAttribute("detailIntro", detailIntro);
		model.addAttribute("detailImage", detailImage);
		model.addAttribute("tourTicket", tourTicket);
		
		return "forward:/ticket/getTicket.jsp";
	}
	/*
	@RequestMapping(value = "getTicket", method = RequestMethod.POST)
	public String getTicket(
		@RequestParam("contentId") int contentId,	
		@RequestParam("contentTypeId") int contentTypeId,
		@RequestParam("title") String title,
		@RequestParam("firstImage") String firstImage,
		@RequestParam("firstImage2") String firstImage2,
		Model model
			) throws Exception {
		
		System.out.println("\n /ticket/getTicket : POST");
		
		System.out.println(contentId);
		System.out.println(contentTypeId);
		System.out.println(title);
		System.out.println(firstImage);
		System.out.println(firstImage2);
		
		TourTicket tourTicket = new TourTicket();
		tourTicket.setTitle(title);
		tourTicket.setFirstimage(firstImage);
		tourTicket.setFirstimage2(firstImage2);
		
		DetailIntro detailIntro = ticketService.getTicket(contentId, contentTypeId);

		System.out.println("[1]" + tourTicket);
		System.out.println("[2]" + detailIntro);
		
		model.addAttribute("detailIntro", detailIntro);
		model.addAttribute("tourTicket", tourTicket);
		
		System.out.println("\n\n[값확인1111]" + detailIntro);
		
		return "forward:/ticket/getTicket.jsp";
	}
	//*/
	
	
} // end of class
