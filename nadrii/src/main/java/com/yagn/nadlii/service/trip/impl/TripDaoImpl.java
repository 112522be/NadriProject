package com.yagn.nadlii.service.trip.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.yagn.nadlii.service.domain.TourTripInfo;
import com.yagn.nadlii.service.trip.TripDao;
import com.yagn.nadlii.service.trip.url.TourApiUrlManage;

public class TripDaoImpl implements TripDao {

	
	
	
	@Override
	public List listTripFromTour() throws Exception{
		
		
		//DB 접속만 하고 검색 조건(TourApiUrlManage)는 컨트롤러로 옮기기
		HttpClient httpClient = new DefaultHttpClient();
		TourApiUrlManage tourApiUrlManage = new TourApiUrlManage();
		tourApiUrlManage.urlClean();
		tourApiUrlManage.urlBaseSet();
		tourApiUrlManage.setType("areaBasedList?");
		tourApiUrlManage.setCat2("A0206");
		tourApiUrlManage.setCat3("A02060300");
		tourApiUrlManage.setPageNo(1);
		tourApiUrlManage.setNumOfRows(12);
		tourApiUrlManage.urlMaking();
		
		System.out.println(tourApiUrlManage.urlMaking());
		
		HttpGet httpGet = new HttpGet(tourApiUrlManage.urlMaking()); 
		
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		
		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println("[1 : jsonobj] ==>" + jsonobj);
		System.out.println("===================================================");
		JSONObject response = (JSONObject) jsonobj.get("response");
		System.out.println("[2 : response] ==>" + response);
		System.out.println("===================================================");
		JSONObject header = (JSONObject) response.get("header");
		System.out.println("[3 : header] ==>" + header);
		System.out.println("===================================================");
		JSONObject body = (JSONObject) response.get("body");
		System.out.println("[4 : body] ==>" + body);
		System.out.println("===================================================");
		JSONObject items = (JSONObject) body.get("items");
		System.out.println("[5 : items] ==>" + items);
		System.out.println("===================================================");
		JSONArray jsonArray = (JSONArray)items.get("item");
		System.out.println(jsonArray);
		
		List list = new ArrayList();
		for(int i=0;i<jsonArray.size();++i) {
			JSONObject obj = (JSONObject)jsonArray.get(i);
			System.out.println(obj);
			ObjectMapper objectMapper = new ObjectMapper();
			TourTripInfo tourTripInfo = new TourTripInfo();
			tourTripInfo = objectMapper.readValue(obj.toJSONString(), TourTripInfo.class);
			list.add(tourTripInfo);
		}
		
		return list;
	}
	
	
	
}
