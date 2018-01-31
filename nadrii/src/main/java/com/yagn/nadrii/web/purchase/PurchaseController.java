package com.yagn.nadrii.web.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value="addPurchase")
	public String addPurchase(
			
			) {
		
		System.out.println("/purchase/addPurchase : GET / POST");
	
		try {
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	
		return null;
	
	}
	
} // end of class
