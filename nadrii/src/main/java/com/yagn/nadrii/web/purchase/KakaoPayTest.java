package com.yagn.nadrii.web.purchase;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.yagn.nadrii.service.domain.KakaoPayRequest;
import com.yagn.nadrii.service.domain.KakaoPayResponse;


public class KakaoPayTest {
//	public static void main(String[] args) throws Exception {
//		KakaoPayTest.readyPay();
//	}
//	
	public static KakaoPayResponse readyPay(KakaoPayRequest sendObject) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		// Yuri Key
//		httpPost.setHeader("Authorization", "KakaoAK 4b28333571585dcb2ddd1265aa46c29b");
		
		httpPost.setHeader("Authorization", "KakaoAK 68171e6db798333d82b92ae249926a4e");
		
		HttpEntity httpEntity = new ByteArrayEntity(sendObject.toString().getBytes("utf-8"));
		httpPost.setEntity(httpEntity);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
//		HttpEntity httpEntity01 = httpResponse.getEntity();
//		System.out.println("???????"+EntityUtils.toString(httpEntity01));
//		InputStream is = httpEntity01.getContent();
//		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
//		JSONObject resObject = (JSONObject)JSONValue.parse(br);
//		ObjectMapper objectMapper01 = new ObjectMapper();
		KakaoPayResponse responseDomain =new ObjectMapper().readValue(EntityUtils.toString(httpResponse.getEntity()), KakaoPayResponse.class);
		System.out.println("여기 : "+responseDomain);
		return responseDomain;
		
	}

	public static KakaoPayResponse completePay(KakaoPayRequest kakaoPayRequest) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		String url = "https://kapi.kakao.com/v1/payment/approve";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
//		httpPost.setHeader("Authorization", "KakaoAK 4b28333571585dcb2ddd1265aa46c29b");
		httpPost.setHeader("Authorization", "KakaoAK 68171e6db798333d82b92ae249926a4e");
		
		HttpEntity httpEntity = new ByteArrayEntity(kakaoPayRequest.toString().getBytes("utf-8"));
		httpPost.setEntity(httpEntity);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
//		HttpEntity httpEntity01 = httpResponse.getEntity();
//		System.out.println("???????"+EntityUtils.toString(httpEntity01));
//		InputStream is = httpEntity01.getContent();
//		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
//		JSONObject resObject = (JSONObject)JSONValue.parse(br);
//		ObjectMapper objectMapper01 = new ObjectMapper();
		KakaoPayResponse responseDomain =new ObjectMapper().readValue(EntityUtils.toString(httpResponse.getEntity()), KakaoPayResponse.class);
		System.out.println("여기22 : "+responseDomain);
		return responseDomain;
	}
}
