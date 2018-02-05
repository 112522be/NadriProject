package com.yagn.nadrii.web.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yagn.nadrii.service.domain.Purchase;
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
			@PathVariable("flag") String flag
			) {
		
		System.out.println("\n /purchase/addPurchase : POST");
	
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
			
			System.out.println(purchase.toString());
			
//			purchaseService.addPurchase(purchase);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping(value = "listBasket")
	public String listBasket(
			Model model
			) {
		
		System.out.println("\n /purchase/listBasket");
		
		
		try {
			
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return "forward:/ticket/listBasket.jsp";
	}
	
	
	
	
	
} // end of class
