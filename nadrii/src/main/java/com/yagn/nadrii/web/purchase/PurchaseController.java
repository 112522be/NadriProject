package com.yagn.nadrii.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.yagn.nadrii.service.domain.KakaoPayRequest;
import com.yagn.nadrii.service.domain.KakaoPayResponse;
import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.purchase.PurchaseService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	/// Field
	private KakaoPayRequest kakaoPayRequest;
	
	
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
		
		System.out.println("\n /purchase/addPurchase/" + flag + " : POST");
	
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
			purchase.setTaxFree((int) (totalTicketPrice * 0.05));
			purchase.setTicketPayment((int) (totalTicketPrice + purchase.getTaxFree()));
			
			user = (User) session.getAttribute("loginUser");
			System.out.println("\n[1]==>"+user.toString());
			System.out.println("\n[2]==>"+purchase.toString());
			
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

			returnMap = purchaseService.getBasketList(openApiSearch, user.getUserId());
			
			System.out.println("\n[1]"+returnMap.get("list"));

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
	
	@RequestMapping(value="kakaoPay", method=RequestMethod.POST)
	public String kakaoPay(
			@ModelAttribute("kakaoPayRequest") KakaoPayRequest kakaoPayRequest
			) {
		
		System.out.println("\n /purchase/kakaoPay : POST");
		
		KakaoPayResponse kakaoPayResponse = new KakaoPayResponse();
		
		try {
			
			kakaoPayResponse = purchaseService.addKakaoPayment(kakaoPayRequest);
			kakaoPayRequest.setTid(kakaoPayResponse.getTid());
			
			this.kakaoPayRequest = kakaoPayRequest;
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		System.out.println("\n\n[kakaoPay complete]");
		
		return "redirect:"+kakaoPayResponse.getNext_redirect_pc_url();
	}
	
	@RequestMapping(value="kakaoPayComplete")
	public String kakaoPayComplete(
			@RequestParam String pg_token, 
			HttpServletRequest request
			) {
		
		System.out.println("\n /purchase/kakaoPayComplete : POST");
		
		KakaoPayResponse kakaoPayResponse = new KakaoPayResponse();
		Purchase purchase = new Purchase();
		User user = new User();

		try {
			kakaoPayRequest.setPg_token(pg_token);
			kakaoPayResponse = purchaseService.addKakaoPayComplete(kakaoPayRequest);
			
			purchase = new Purchase();
			user.setUserId(kakaoPayRequest.getPartner_user_id());
			purchase.setBuyer(user);
			
			request.setAttribute("purchase", purchase);

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;	
//		return "/purchase/addPurchase.jsp";	
	}
	
	
} // end of class
