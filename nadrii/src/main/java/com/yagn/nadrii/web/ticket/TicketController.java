package com.yagn.nadrii.web.ticket;

import java.net.URLDecoder;
import java.util.List;
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
		
//		System.out.println(map.get("tourTicketList"));
		
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
		System.out.println("[getTicket 인코딩 확인]==>" + title);
		
		String decodeTitle = URLDecoder.decode(title, "UTF-8");
		
		DetailIntro detailIntro = ticketService.getTicket(contentId, contentTypeId);
		DetailImage detailImage = ticketService.getDetailImage(contentId, decodeTitle);
		
		TourTicket tourTicket = new TourTicket();
		tourTicket.setTitle(decodeTitle);
		tourTicket.setContentid(contentId);
		tourTicket.setContenttypeid(contentTypeId);
		
		model.addAttribute("detailIntro", detailIntro);
		model.addAttribute("detailImage", detailImage);
		model.addAttribute("tourTicket", tourTicket);
		
		return "forward:/ticket/getTicket.jsp";
	}
	
	@RequestMapping(value = "addBooking", method = RequestMethod.POST)
	public String addBooking (
			@RequestParam("bookingDate") String bookingDate,
			@ModelAttribute("tourTicket") TourTicket tourTicket,
			@ModelAttribute("detailIntro") DetailIntro detailIntro,
			@ModelAttribute("detailImage") DetailImage detailImage,
			Model model
			) {
		
		System.out.println("\n /ticket/addBooking : POST");
		
		System.out.println("\n[예매일자 확인]==>" + bookingDate);
		System.out.println("\n[tourTicket 확인]==>" + tourTicket.toString());
		System.out.println("\n[detailImage 확인]==>" + detailImage.toString());
		System.out.println("\n[detailIntro 확인]==>" + detailIntro.toString());
		
		String priceInfo = detailIntro.getUsetimefestival();
		try {
			
			List<String> priceList = ticketService.getTicketPrice(priceInfo);
			
			for (int i = 0; i < priceList.size(); i++) {
				System.out.println("[리턴 값 확인]==>"+priceList.get(i));
			}
			
			tourTicket.setUsetimefestival(priceList);
			
			System.out.println("\n[tourTicket 도메인 확인]==>" + tourTicket.getUsetimefestival());
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		model.addAttribute("bookingDate", bookingDate);
		model.addAttribute("priceList", tourTicket.getUsetimefestival());
		
		return "forward:/ticket/addBookingView.jsp";
	}
	
	
} // end of class
