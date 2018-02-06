package com.yagn.nadrii.service.purchase.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.KakaoPayRequest;
import com.yagn.nadrii.service.domain.KakaoPayResponse;
import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.purchase.PurchaseDao;
import com.yagn.nadrii.service.ticket.impl.KakaoApiDaoImpl;

@Repository("purchaseKakaoDaoImpl")
public class PurchaseKakaoDaoImpl implements PurchaseDao {

	/// Field
	
	/// Constructor
	public PurchaseKakaoDaoImpl() {
		System.out.println(this.getClass());
	}
	
	/// KakaoPay API properties
	@Value("#{kakaoApiProperties['kakaoKey']}")
	private String kakaoKey;
	
	@Value("#{kakaoApiProperties['kakaoPayURL']}")
	private String kakaoPayURL;
	
	public static final KakaoPayResponse sendPostKakaoURL(KakaoPayRequest kakaoPayRequest, String kakaoPayURL, String kakaoKey) throws Exception {
		
		System.out.println("\n[purchaseKakaoDaoImpl.java]::sendPostKakaoURL");
		
		HttpClient httpClient = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(kakaoPayURL);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		httpPost.setHeader("Authorization", kakaoKey);
		
		HttpEntity httpEntity = new ByteArrayEntity(kakaoPayRequest.toString().getBytes("utf-8"));
		httpPost.setEntity(httpEntity);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		KakaoPayResponse kakaoPayResponse = new ObjectMapper().readValue(
				EntityUtils.toString(httpResponse.getEntity()), KakaoPayResponse.class);
		
		System.out.println("[1.Check]==>"+kakaoPayResponse.toString());
		
		return kakaoPayResponse;
		
	}
	
	

	@Override
	public KakaoPayResponse addKakaoPayment(KakaoPayRequest kakaoPayRequest) {
		
		System.out.println("\n[purchaseKakaoDaoImpl.java]::addKakaoPayment");
		
		KakaoPayResponse kakaoPayResponse = new KakaoPayResponse();
		
		try {
			kakaoPayResponse = PurchaseKakaoDaoImpl.sendPostKakaoURL(kakaoPayRequest, kakaoPayURL, kakaoKey);
			
			System.out.println("[2.Check]==>"+kakaoPayResponse.toString());
			
		} catch (Exception e) {
			
		}
		
		return kakaoPayResponse;
	}

	////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		
	}
	
	@Override
	public List<Purchase> getBasketList(Map<String, Object> map) throws Exception {
		return null;
	}
	
	@Override
	public int getTotalCount(String buyerId) throws Exception {
		return 0;
	}
	
	
	
	
	
	
} // end of class
