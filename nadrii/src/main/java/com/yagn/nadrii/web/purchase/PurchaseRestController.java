package com.yagn.nadrii.web.purchase;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	/// Constructor
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addPurchase/basket", method=RequestMethod.POST)
	public void addPurchase(
			@RequestBody JSONObject basket
			) {
		
		System.out.println("\n/purchase/json/addPurchase/flag=basket : POST");
		System.out.println("What is this ?? " + basket.toString());
		
		Purchase purchase = new Purchase();
		
		try {
			
			
			//purchaseService.addPurchase(purchase);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	
	}
	
} // end of class
