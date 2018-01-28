package com.yagn.nadrii.service.ticket.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.NaverImage;
import com.yagn.nadrii.service.domain.SearchFestival;
import com.yagn.nadrii.service.ticket.TicketDao;

@Repository("naverApiDaoImpl")
public class NaverApiDaoImpl implements TicketDao {
	
	/// Field
	private NaverImage naverImage;

	@Autowired
	@Value("#{naverApiProperties['clientID']}")
	private String clientID;

	@Value("#{naverApiProperties['clientSecret']}")
	private String clientSecret;

	@Value("#{naverApiProperties['searchImageURL']}")
	private String searchImageURL;
	
	/// Constructor
	public NaverApiDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public static final StringBuilder sendGetNaverURL(StringBuilder urlBuilder, String clientID, String clientSecret) throws Exception {
		
		System.out.println("\n[NaverApiDaoImpl.java]::sendGetNaverURL");
		
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
		
		StringBuilder naverImageSB = NaverApiDaoImpl.sendGetNaverURL
				(new StringBuilder(searchImageURL 
						+ "query=" + encodeTitle		//
						+ "&display=50"					//
						+ "&filter=large"				//
						+ "&sort=date"					//
						), clientID, clientSecret);
		
		JSONObject niJsonObj = (JSONObject) JSONValue.parse(naverImageSB.toString());
		System.out.println("\n[niJsonObj] ==>" + niJsonObj);
		
		JSONArray niItems = (JSONArray) niJsonObj.get("items");
		System.out.println("\n[niItems] ==>" + niItems);
		
		for (int i = 0; i < niItems.size(); i++) {
			JSONObject itemsValue = (JSONObject) niItems.get(i);
			
			ObjectMapper objectMapper = new ObjectMapper();
			naverImage = new NaverImage();
			naverImage = objectMapper.readValue(itemsValue.toJSONString(), NaverImage.class);
			
			System.out.println("\n\n" + (i+1) +" 번째 이미지 : "
			+ naverImage.getThumbnail()
			+ " / "
			+ naverImage.getSizeheight()
			);
		}

		System.out.println("\n[naverImage] :: " + naverImage);
		
		return naverImage.getThumbnail();
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
