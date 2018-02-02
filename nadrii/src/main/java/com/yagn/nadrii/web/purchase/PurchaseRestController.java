package com.yagn.nadrii.web.purchase;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.domain.DetailImage;
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
		
		Purchase purchase = new Purchase();
		
		try {
			
			JSONObject jsonObj = (JSONObject) JSONValue.parse(basket.toJSONString());
		//	System.out.println("\n[JSONObject jsonObj] ==> " + jsonObj.toString());

			ObjectMapper objectMapper = new ObjectMapper();
			purchase = new Purchase();
			purchase = objectMapper.readValue(jsonObj.toJSONString(), Purchase.class);

			// cancelDate making algorithm
			DateFormat df = new SimpleDateFormat("yyyyMMdd");
			Date bDate = df.parse(purchase.getBookingDate().replaceAll("[^0-9]", ""));
			Calendar cal = Calendar.getInstance();
			cal.setTime(bDate);
			cal.add(Calendar.DATE, -10);

			String cancelDate = df.format(cal.getTime()).substring(0, 4) + "³â "
					+ df.format(cal.getTime()).substring(4, 6) + "¿ù " 
					+ df.format(cal.getTime()).substring(6) + "ÀÏ";
			
			// cancelDate set
			purchase.setCancelDate(cancelDate);
			
			System.out.println("\n[Purchase Domain check] ==> " + purchase.toString());
			System.out.println("\n");
			
			purchaseService.addPurchase(purchase);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("[addPurchase Complete]");
	
	} // end of method

	
} // end of class
