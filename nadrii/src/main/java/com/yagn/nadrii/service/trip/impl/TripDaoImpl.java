package com.yagn.nadrii.service.trip.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.service.trip.TourAPlUrlManage;
import com.yagn.nadrii.service.trip.TourApiDomain;
import com.yagn.nadrii.service.trip.TripDao;


@Repository("tripDaoImpl")
public class TripDaoImpl implements TripDao {

	
	
	public TripDaoImpl() {
		System.out.println(this.getClass());
		
	}

	public List listTrip(int pageNo) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		TourAPlUrlManage tourAPlUrlManage = new TourAPlUrlManage();
			
		tourAPlUrlManage.setContentTypeId("14");
		tourAPlUrlManage.setCat1("A02");
		
		tourAPlUrlManage.setCat2("A0206");
		tourAPlUrlManage.setCat3("A02060100");
		tourAPlUrlManage.setPageNo(pageNo);
				
		HttpGet httpGet = new HttpGet(tourAPlUrlManage.urlMaking()); 
		
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
			TourApiDomain tourDomain = new TourApiDomain();
			tourDomain = objectMapper.readValue(obj.toJSONString(), TourApiDomain.class);
			list.add(tourDomain);
		}
				
		
		return list;
	}
	
	
}
