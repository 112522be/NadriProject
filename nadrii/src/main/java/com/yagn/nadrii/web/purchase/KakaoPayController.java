package com.yagn.nadrii.web.purchase;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.service.domain.KakaoPayRequest;
import com.yagn.nadrii.service.domain.KakaoPayResponse;
import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.domain.User;


@Controller
@RequestMapping("/kakaoPay/*")
public class KakaoPayController {
	
	private KakaoPayRequest kakaoPayRequest;
	
	@RequestMapping(value="readyPay", method=RequestMethod.POST)
	public String readyPay(
			@ModelAttribute("kakaoPayRequest") KakaoPayRequest kakaoPayRequest
			) throws Exception {
		
		KakaoPayResponse kakaoPayResponse = KakaoPayTest.readyPay(kakaoPayRequest);
		kakaoPayRequest.setTid(kakaoPayResponse.getTid());
		
		this.kakaoPayRequest = kakaoPayRequest;
		return "redirect:"+kakaoPayResponse.getNext_redirect_pc_url();
	}
	
	@RequestMapping("completePay")
	public String completePay(@RequestParam String pg_token, HttpServletRequest request) throws Exception{
		kakaoPayRequest.setPg_token(pg_token);
		KakaoPayResponse response = KakaoPayTest.completePay(kakaoPayRequest);
		Purchase purchase = new Purchase();
		User user = new User();
		user.setUserId(kakaoPayRequest.getPartner_user_id());
		purchase.setBuyer(user);
		request.setAttribute("purchase", purchase);
		return "/purchase/addPurchase.jsp";	
	}
}
