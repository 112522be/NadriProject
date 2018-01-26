package com.yagn.nadrii.service.ticket.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.ticket.TicketDao;

@Repository("naverApiDaoImpl")
public class NaverApiDaoImpl implements TicketDao {
	
	/// Field
	@Autowired
	@Value("#{naverApiProperties['searchImageURL']}")
	public String searchImageURL;

	@Value("#{naverApiProperties['ddddd']}")
	String clientID;

	@Value("#{naverApiProperties['clientSecret']}")
	public String clientSecret;
	
	@Value("#{tourApiProperties['detailImageURL']}")
	public String detailImageURL;
	
	@Value("#{testP['test']}")
	public String test;
	
	/// Constructor
	public NaverApiDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public static final StringBuilder sendGetURL(StringBuilder urlBuilder, String clientID, String clientSecret) throws Exception {
		
		System.out.println("\n[NaverApiDaoImpl.java]::sendGetURL");

		URL url = new URL(urlBuilder.toString());
		
		System.out.println("[url check] ==>" + url);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("X-Naver-Client-Id", clientID);
        conn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

		System.out.println("Response code: " + conn.getResponseCode());
		
		BufferedReader br;
		if (conn.getResponseCode() == 200) {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}

		br.close();
		conn.disconnect();

		return sb;

	}
	
	public String getNaverImage(String title) throws Exception {
		
		System.out.println("\n[NaverApiDaoImpl.java]::getNaverImage");
		
		String encodeTitle = URLEncoder.encode(title, "UTF-8");
		
		System.out.println("1:"+title);
		System.out.println("2:"+encodeTitle);
		System.out.println("3:"+searchImageURL);
		System.out.println("4:"+clientID);
		System.out.println("5:"+clientSecret);
		System.out.println("6:"+test);
		
		StringBuilder naverImageSB = new StringBuilder(searchImageURL + encodeTitle);
		
		System.out.println(naverImageSB);
		
		JSONObject niJsonObj = (JSONObject) JSONValue.parse(naverImageSB.toString());
		String naverImage = niJsonObj.toString();
		
		System.out.println("[valu check] ==>" + niJsonObj);
		
		
		return naverImage;
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	public Map<String, Object> getTicketList(OpenApiSearch openApiSearch) throws Exception {
		return null;
	}
	public DetailIntro getDetailIntro(int contentId, int contentTypeId) throws Exception {
		return null;
	}
	public DetailImage getDetailImage(int contentId) throws Exception {
		return null;
	}
	
} // end of class
