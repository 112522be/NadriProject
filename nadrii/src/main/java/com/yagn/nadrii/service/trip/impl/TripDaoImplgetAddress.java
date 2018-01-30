package com.yagn.nadrii.service.trip.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.TripDao;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;


@Repository("tripDaoImplAddress")
public class TripDaoImplgetAddress implements TripDao {

	@Override
	public List listTrip(int pageNo, String contentTypeId, String cat1, String cat2, String cat3) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TourApiDomain getTrip(String contentid, String contentTypeid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TourApiDomain getTripDetail(String contentid, String contentTypeid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String naverImageSearch(String target) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addTrip(Trip trip) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Trip getTrip(int postNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Trip> listTrip(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateViewCount(String contentId) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Trip getTripFromDB(String contentId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getClientAddress(String lat, String lng) throws Exception {
		
		System.out.println("주소 찾기");
		
		String location = lat+","+lng;
		System.out.println(location);
		
		String apiURL = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+location
				+"&key=AIzaSyDYYP7KaUehmZqd8b5QrXK1G81Gi0ZoQIM&language=ko";
		URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
              
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
        List list = new ArrayList();
        JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
        System.out.println("JsonObject : "+jsonobj);
        JSONArray results = (JSONArray)jsonobj.get("results");
        JSONObject temp = (JSONObject)results.get(0);
               
        JSONArray addressComponents = (JSONArray)temp.get("address_components");
        for (int i = 0; i < addressComponents.size(); i++) {
			JSONObject types = (JSONObject)addressComponents.get(i);
			list.add(types);
			System.out.println(types);
		}
        List wordList = new ArrayList();
        
        for (int i = 0; i < list.size(); i++) {
			String value = (((JSONObject)list.get(i)).get("short_name")).toString();
			System.out.println(value);
			wordList.add(value);
			
		}
        
		return wordList;
	}

}
