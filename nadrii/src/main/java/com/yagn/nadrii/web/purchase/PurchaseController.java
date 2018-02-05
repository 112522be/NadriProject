package com.yagn.nadrii.web.purchase;

import java.util.HashMap;
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

import com.yagn.nadrii.common.OpenApiPage;
import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.purchase.PurchaseService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	/// Constructor
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	/// Page process
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addPurchase/{flag}", method=RequestMethod.POST)
	public String addBasket(
			@ModelAttribute("purchase") Purchase purchase,
			@PathVariable("flag") String flag,
			HttpSession session,
			Map<String, Object> map
			) {
		
		System.out.println("\n /purchase/addPurchase : POST");
	
		User user = new User();		
		try {
			
			purchase.setFlag(flag);

			int totalTicketPrice = 0;
			if (purchase.getTicketPrice() != null) {
				for (int i = 0; i < purchase.getTicketPrice().length; i++) {
					int price = Integer.parseInt(purchase.getTicketPrice()[i]);
					int priceCount = Integer.parseInt(purchase.getTicketCount()[i]);
					
					totalTicketPrice += price * priceCount;
				}
			}
			purchase.setTotalTicketPrice(totalTicketPrice);	
			
			user = (User) session.getAttribute("loginUser");
			
			System.out.println(purchase.toString());
			
//			purchaseService.addPurchase(purchase);
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		map.put("user", user);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping(value = "listBasket")
	public String listBasket(
			@ModelAttribute("openApiSearch") OpenApiSearch openApiSearch,
			HttpSession session,
			Map<String, Object> map
			) {
		
		System.out.println("\n /purchase/listBasket");
		
		User user = new User();
		OpenApiPage resultPage = new OpenApiPage();
		Map<String, Object> returnMap = new HashMap<>();
		
		try {
			
			if (openApiSearch.getPageNo() == 0) {
				openApiSearch.setPageNo(1);
			}
			openApiSearch.setNumOfRows(pageSize);
			
			user = (User) session.getAttribute("loginUser");
			System.out.println(user.toString());
//			String buyerId = user.getUserId();
			String buyerId = "test01";
			System.out.println("[Session userId Check]==>" + buyerId);
			
//			returnMap = purchaseService.getBasketList(openApiSearch, user.getUserId());
			returnMap = purchaseService.getBasketList(openApiSearch, buyerId);
			
			System.out.println("\n[1]"+returnMap.get("list"));
			System.out.println("\n[1]"+returnMap.get("totalCount"));
			
			resultPage = new OpenApiPage(openApiSearch.getPageNo(), ((Integer) returnMap.get("totalCount")).intValue(),
					pageUnit, pageSize);
			System.out.println("[resultPage]" + resultPage);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		map.put("user", user);
		map.put("list", returnMap.get("list"));
		map.put("resultPage", resultPage);
		map.put("openApiSearch", openApiSearch);
		
		
		return "forward:/purchase/listBasket.jsp";
	}
	
	
	
	
	
} // end of class
