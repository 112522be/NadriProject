package com.yagn.nadrii.web.purchase;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.yagn.nadrii.service.domain.KakaoPayRequest;
import com.yagn.nadrii.service.domain.KakaoPayResponse;
import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.purchase.PurchaseService;
import com.yagn.nadrii.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

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
	
	@RequestMapping(value = "listBasket")
	public String listBasket(
			@ModelAttribute("openApiSearch") OpenApiSearch openApiSearch,
			HttpSession session,
			Map<String, Object> map
			) {
		
		System.out.println("\n /purchase/listBasket");
		
		OpenApiPage resultPage = new OpenApiPage();

		User user = new User();
		Map<String, Object> returnMap = new HashMap<>();
		
		try {
			
			if (openApiSearch.getPageNo() == 0) {
				openApiSearch.setPageNo(1);
			}
			openApiSearch.setNumOfRows(pageSize);
			
			user = (User) session.getAttribute("loginUser");

			returnMap = purchaseService.getBasketList(openApiSearch, user.getUserId());
			
			System.out.println("\n[1]" + returnMap.get("list"));
			
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
	
	// Directly purchasing without basket
	@RequestMapping(value="addPurchase/{flag}", method=RequestMethod.POST)
	public String addBasket(
			@ModelAttribute("purchase") Purchase purchase,
			@PathVariable("flag") String flag,
			HttpSession session,
			Map<String, Object> map
			) {
		
		System.out.println("\n /purchase/addPurchaseView/" + flag + " : POST");
	
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
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		map.put("user", user);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping(value="kakaoPay", method=RequestMethod.POST)
	public String kakaoPay(
			@ModelAttribute("kakaoPayRequest") KakaoPayRequest kakaoPayRequest,
			@ModelAttribute("purchase") Purchase purchase,
			HttpSession session
			) {
		
		System.out.println("\n /purchase/kakaoPay : POST");
//		System.out.println("\n[kakaoPayRequest]==>" + kakaoPayRequest.toString());
//		System.out.println("\n[purchase]==>" + purchase.toString());

		KakaoPayResponse kakaoPayResponse = new KakaoPayResponse();
		
		try {
			
			kakaoPayResponse = purchaseService.addKakaoPayment(kakaoPayRequest);
			kakaoPayRequest.setTid(kakaoPayResponse.getTid());
			this.kakaoPayRequest = kakaoPayRequest;
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		session.setAttribute("purchase", purchase);
		
		return "redirect:"+kakaoPayResponse.getNext_redirect_pc_url();
	}
	
	@RequestMapping(value="kakaoPayComplete")
	public String kakaoPayComplete(
			@RequestParam String pg_token,
			@ModelAttribute("kakaoPayRequest") KakaoPayRequest kakaoPayRequest,
			HttpSession session
			) {
		
		System.out.println("\n /purchase/kakaoPayComplete : POST");
		
		KakaoPayResponse kakaoPayResponse = new KakaoPayResponse();
		Purchase purchase = new Purchase();
		
		try {
			kakaoPayRequest.setPg_token(pg_token);
			kakaoPayResponse = purchaseService.addKakaoPayComplete(kakaoPayRequest);
			
			purchase = (Purchase) session.getAttribute("purchase");
			
			// cancelDate making algorithm
			DateFormat df = new SimpleDateFormat("yyyyMMdd");
			Date bDate = df.parse(purchase.getBookingDate().replaceAll("[^0-9]", ""));
			Calendar cal = Calendar.getInstance();
			cal.setTime(bDate);
			cal.add(Calendar.DATE, -10);

			String cancelDate = df.format(cal.getTime()).substring(0, 4) + "�� "
					+ df.format(cal.getTime()).substring(4, 6) + "�� " + df.format(cal.getTime()).substring(6) + "��";

			// cancelDate set
			purchase.setCancelDate(cancelDate);
			purchase.setBuyer(userService.getUser(purchase.getBuyerId()));
			
			purchaseService.addPurchase(purchase);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "/index.jsp";	
	}
	
	// Purchasing via basket
	@RequestMapping(value="addBasketPurchase", method=RequestMethod.POST)
	public String addBasketPurchase(
			@RequestParam("sumPostNo") String sumPostNo,
			Map<String, Object> map
			) {

		System.out.println("\n /purchase/addBasketPurchaseView : POST");
		System.out.println("\n[sumPostNo]==>" + sumPostNo.toString());
		
		Purchase purchase = new Purchase();
		List<Purchase> list = new ArrayList<Purchase>();
		
		List<String> count = new ArrayList<>();
		List<String> price = new ArrayList<>();
		
		try {
			
			purchase.setSumPostNo(sumPostNo);
			System.out.println("\n[purchase]==>"+purchase);

			list = purchaseService.addBasketTicket(purchase);
			///*
			for (int i = 0; i < list.size(); i++) {
				System.out.println("//[1]=====" + i);
				System.out.println(list.get(i));
			}
			//*/
			
			// ticketPrice split
			for (int i = 0; i < list.size(); i++) {

				String firstParseArr[] = list.get(i).getTicketPriceAll().split("&");
				
				price = new ArrayList<>();	
				count = new ArrayList<>();
				
				for (int j = 0; j < firstParseArr.length; j++) {
					String secondParseArr[] = firstParseArr[j].split("=");

					for (int k = 0; k < secondParseArr.length; k++) {
						
						if (k == 0) {
							price.add(secondParseArr[k].toString());
						} else if (k == 1) {
							count.add(secondParseArr[k].toString());
						}
					}
				}
				list.get(i).setTicketC(count);
				list.get(i).setTicketP(price);
				
				System.out.println("//[2]==========" + i);
				System.out.println(list.get(i).toString());
			}
			
			// ticketPrice & ticket Count sorting
			int totalTicketPrice = 0;
			for (int i = 0; i < list.size(); i++) {
				
				String[] ticketPrice = list.get(i).getTicketP().toArray(new String[i]);
				String[] ticketCount = list.get(i).getTicketC().toArray(new String[i]);
				
				int ticketPriceInt = Integer.parseInt(ticketPrice[i]);
				int ticketCountInt = Integer.parseInt(ticketCount[i]);
				
				totalTicketPrice += ticketPriceInt * ticketCountInt;
				
				list.get(i).setTotalTicketPrice(totalTicketPrice);
				list.get(i).setTaxFree( (int) (totalTicketPrice * 0.05) );
				list.get(i).setTicketPayment((int) (totalTicketPrice + list.get(i).getTaxFree()));
				
				System.out.println("//[3]==========" + i);
				System.out.println(list.get(i).toString());
				
			}

			int totalTicketPrice2 = 0;
			for (int i = 0; i < list.size(); i++) {
				int totalPrice = list.get(i).getTotalTicketPrice();
				totalTicketPrice2 += totalPrice;
			}
			
			purchase.setTotalTicketPrice(totalTicketPrice2);
			purchase.setTaxFree( (int) (totalTicketPrice2 * 0.05) );
			purchase.setTicketPayment((int) (totalTicketPrice2 + purchase.getTaxFree()));
			purchase.setTicketTitle(list.get(0).getTicketTitle());
			if (list.size() > 1 ) {
				purchase.setTicketTitle(list.get(0).getTicketTitle() + " �� " + (list.size() - 1) + " ��");
			} 
			System.out.println("\n[Purchase]");
			System.out.println(purchase.toString());
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		map.put("purchase", purchase);
		map.put("list", list);
		
		return "forward:/purchase/addBasketPurchaseView.jsp";
	}
	
	
	/*
	@RequestMapping(value="getBasketPurchase", method=RequestMethod.GET) 
	public String getBasketPurchase(
			@RequestParam("postNo") String postNo,
			@RequestParam("sumPostNo") String sumPostNo,
			Map<String, Object> map
			) {
		
		System.out.println("\n /purchase/getBasketPurchase : GET");

		System.out.println("\n[postNo] ==> " + postNo);
		System.out.println("\n[sumPostNo] ==> " + sumPostNo);
		
		
		try {
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
	//*/
	
} // end of class
