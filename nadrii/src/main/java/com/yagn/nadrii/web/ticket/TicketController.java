package com.yagn.nadrii.web.ticket;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.common.OpenApiPage;
import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.TourTicket;
import com.yagn.nadrii.service.domain.User;
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
			@RequestParam(value="searchCondition", required=false, defaultValue="") String searchCondition,
			Map<String, Object>	map
			) {
		
		System.out.println("\n /ticket/listTicket : GET / POST");
		System.out.println("\n[openApiSearch domain check] ==> " + openApiSearch.toString());
		System.out.println(searchCondition);
		
		OpenApiPage resultPage = new OpenApiPage();
		Map<String, Object> returnMap = new HashMap<>();
		
		try {

			if (openApiSearch.getPageNo() == 0) {
				openApiSearch.setPageNo(1);
			}
			openApiSearch.setNumOfRows(pageSize);

			if (openApiSearch.getSearchCondition() == null) {
				openApiSearch.setSearchCondition("B");
			} else {
				openApiSearch.setSearchCondition(searchCondition);
			}
			
			returnMap = ticketService.getTicketList(openApiSearch);
			resultPage = new OpenApiPage(openApiSearch.getPageNo(), ((Integer) returnMap.get("totalCount")).intValue(),
					pageUnit, pageSize);

			System.out.println("[resultPage]" + resultPage);

		} catch (Exception e) {
			System.out.println(e);
		}
		
		map.put("resultPage", resultPage);
		map.put("tourTicket", returnMap.get("tourTicketList"));
		
		return "forward:/ticket/listTicket.jsp";
	}
	
	@RequestMapping(value = "getTicket", method = RequestMethod.GET)
	public String getTicket(
		@RequestParam("contentId") int contentId,	
		@RequestParam("contentTypeId") int contentTypeId,
		@RequestParam("title") String encodeTitle,
		Map<String, Object> map
			) {
		
		System.out.println("\n /ticket/getTicket : GET");
		
		DetailIntro detailIntro = new DetailIntro();
		DetailImage detailImage = new DetailImage();
		TourTicket tourTicket = new TourTicket();
		
		try {

			String decodeTitle = URLDecoder.decode(encodeTitle, "UTF-8");

			detailIntro = ticketService.getTicket(contentId, contentTypeId);
			detailImage = ticketService.getDetailImage(tourTicket.getContentid(), decodeTitle);

			System.out.println("\n\n[entrance Fee check] ==> " + detailIntro.getUsetimefestival());
			
			
			tourTicket = new TourTicket();
			tourTicket.setTitle(decodeTitle);
			tourTicket.setContentid(contentId);
			tourTicket.setContenttypeid(contentTypeId);
			
			System.out.println("\n\n[1]==> " + detailIntro.toString());
			System.out.println("\n\n[2]==> " + detailImage.toString());
			System.out.println("\n\n[3]==> " + tourTicket.toString());

		} catch (Exception e) {
			System.out.println(e);
		}
		
		map.put("detailIntro", detailIntro);
		map.put("detailImage", detailImage);
		map.put("tourTicket", tourTicket);
		
		return "forward:/ticket/getTicket.jsp";
	}
	
	@RequestMapping(value = "addBooking", method = RequestMethod.POST)
	public String addBooking (
			@RequestParam("bookingDate") String bookingDate,
			@ModelAttribute("tourTicket") TourTicket tourTicket,
			@ModelAttribute("detailIntro") DetailIntro detailIntro,
			@ModelAttribute("detailImage") DetailImage detailImage,
			HttpSession session,
			Map<String, Object> map
			) {
		
		System.out.println("\n /ticket/addBooking : POST");
		
		System.out.println("\n[예매일자 확인]==>" + bookingDate);
		System.out.println("\n[tourTicket 확인]==>" + tourTicket.toString());
		System.out.println("\n[detailImage 확인]==>" + detailImage.toString());
		System.out.println("\n[detailIntro 확인]==>" + detailIntro.toString());
		
		String priceInfo = detailIntro.getUsetimefestival();
		
		User user = new User();
		try {
			
			List<String> priceList = ticketService.getTicketPrice(priceInfo);
			
			for (int i = 0; i < priceList.size(); i++) {
				System.out.println("[리턴 값 확인]==>"+priceList.get(i));
			}
			
			tourTicket.setUsetimefestival(priceList);
			System.out.println("\n[tourTicket 도메인 확인]==>" + tourTicket.getUsetimefestival());
			
			user = (User) session.getAttribute("loginUser");
			
			System.out.println(user.toString());
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		map.put("user", user);
		map.put("bookingDate", bookingDate);
		map.put("priceList", tourTicket.getUsetimefestival());
		
		return "forward:/ticket/addBookingView.jsp";
	}
	
	
} // end of class
