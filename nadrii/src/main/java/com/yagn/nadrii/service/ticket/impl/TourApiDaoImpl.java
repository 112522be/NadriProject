package com.yagn.nadrii.service.ticket.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.DetailIntro;
import com.model2.mvc.service.domain.SearchFestival;
import com.model2.mvc.service.ticket.TicketDao;
import com.model2.mvc.service.ticket.TicketService;


@Service("tourApiDaoImpl")
public class TourApiDaoImpl implements TicketDao {
	
	/// Field
	private SearchFestival searchFestival;
	private DetailIntro	 detailIntro;
	
	@Value("#{tourapiProperties['searchFestivalURL']}")
	private String searchFestivalURL;

	@Value("#{tourapiProperties['essentialURL']}")
	private String essentialURL;
	
	@Value("#{tourapiProperties['detailIntroURL']}")
	private String detailIntroURL;
	
	/// Constructor
	public TourApiDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public static final StringBuilder sendGetURL(StringBuilder urlBuilder) throws Exception {
		
		System.out.println("\n[TourApiDaoImpl.java]::sendGetURL");

		URL url = new URL(urlBuilder.toString());
		
		System.out.println("\n[URL Check] ==>" + url);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		System.out.println("//=====\n");
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		rd.close();
		conn.disconnect();

		return sb;

	}
	
	public Map<String, Object> getSearchFestival() throws Exception {
		
		System.out.println("\n[TourApiDaoImpl.java]::getSearchFestival");
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		
		StringBuilder searchFestivalSB = TourApiDaoImpl.sendGetURL(new StringBuilder(searchFestivalURL + essentialURL));
		
		JSONObject sfJsonObj = (JSONObject) JSONValue.parse(searchFestivalSB.toString());
		JSONObject sfResponse = (JSONObject) sfJsonObj.get("response");
		JSONObject sfHeader = (JSONObject) sfResponse.get("header");
		JSONObject sfBody = (JSONObject) sfResponse.get("body");
		JSONObject sfItems = (JSONObject) sfBody.get("items");
		JSONArray sfItem = (JSONArray) sfItems.get("item"); 

		/* parse data confirm
		System.out.println("[sfJsonObj] ==>" + sfJsonObj);
		System.out.println("//=====");
		System.out.println("[sfResponse] ==>" + sfResponse);
		System.out.println("//=====");
		System.out.println("[sfHeader] ==>" + sfHeader);
		System.out.println("//=====");
		System.out.println("[sfBody] ==>" + sfBody);
		System.out.println("//=====");
		System.out.println("[sfItems] ==>" + sfItems);
		System.out.println("//=====");
		System.out.println("[sfItem] ==>" + sfItem);
		System.out.println("//=====");
		//*/
		
		List<SearchFestival> searchFestivalList = new ArrayList<SearchFestival>();
		
		for (int i = 0; i < sfItem.size(); i++) {
			JSONObject itemValue = (JSONObject) sfItem.get(i);
			ObjectMapper objectMapper = new ObjectMapper();
			searchFestival = new SearchFestival();
			searchFestival = objectMapper.readValue(itemValue.toJSONString(), SearchFestival.class);

			searchFestivalList.add(searchFestival);
			returnMap.put("list", searchFestivalList);
			
		}
		
		return returnMap;
		
	}

	public Map<String, Object> getDetailIntro(int ContentId, int ContentTypeId) throws Exception {
		
		System.out.println("\n[TourApiDaoImpl.java]::getDetailIntro");

		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<DetailIntro> detailIntroList = new ArrayList<DetailIntro>();

//		SearchFestival searchFestival = new SearchFestival();

		StringBuilder detailIntroSB = TourApiDaoImpl
				.sendGetURL(new StringBuilder(searchFestivalURL + essentialURL 
						+ "&introYN=Y" 
						+ "&contentId="	+ ContentId 
						+ "&contentTypeId=" + ContentTypeId
						));
		
		JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailIntroSB.toString());

		JSONObject diResponse = (JSONObject) diJsonObj.get("response");
		JSONObject diHeader = (JSONObject) diResponse.get("header");
		JSONObject diBody = (JSONObject) diHeader.get("body");
		JSONObject diItems = (JSONObject) diBody.get("items");
		JSONObject diItem = (JSONObject) diItems.get("item");

		ObjectMapper valueMapper = new ObjectMapper();
		DetailIntro detailIntro = new DetailIntro();
		detailIntro = valueMapper.readValue(diItem.toJSONString(), DetailIntro.class);

		detailIntroList.add(detailIntro);

		returnMap.put("list", detailIntroList);

		return returnMap;
	}
	
}
