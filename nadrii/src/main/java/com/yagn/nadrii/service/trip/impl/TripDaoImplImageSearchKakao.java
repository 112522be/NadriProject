package com.yagn.nadrii.service.trip.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;


import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.KakaoImage;
import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.TripDao;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetDetailUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPlListUrlManage;

public class TripDaoImplImageSearchKakao implements TripDao{

	@Override
	public List listTrip(TourAPlListUrlManage tourAPlUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TourApiDomain getTrip(TourAPIGetUrlManage tourAPIGetUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TourApiDomain getTripDetail(TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String naverImageSearch(String target) throws Exception {
		List list = new ArrayList();
		int display = 100;
        String kakaoRestKey = "KakaoAK 61ac37b7b651475f235157189e22f998";
        
        try {
            String text = URLEncoder.encode(target, "UTF-8");
            String apiURL = "https://dapi.kakao.com/v2/search/image?query="+ text+"&page=1&size=80"; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", kakaoRestKey);
            
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
            }
            
            /*
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            System.out.println(response.toString());
            */
            JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
            System.out.println("JsonObject : "+jsonobj);
            JSONArray items = (JSONArray)jsonobj.get("documents");
            System.out.println("documents : "+ items);
            
            
            for (int i = 0; i < items.size(); i++) {
            	JSONObject tempObj = (JSONObject)items.get(i);
            	//System.out.println(tempObj);
            	ObjectMapper objectMapper = new ObjectMapper();
				KakaoImage kakaoImage = new KakaoImage();
				kakaoImage = objectMapper.readValue(tempObj.toString(), KakaoImage.class);
				list.add(kakaoImage);
				System.out.println(kakaoImage.getImage_url());
			}
            	
            //https://developers.kakao.com/docs/restapi/search#이미지-검색
        } catch (Exception e) {
            System.out.println(e);
        }
        if(list.size()!=0) {
        	return ( (KakaoImage)list.get(0) ).getImage_url();
        }else {
        	return "이미지 없음";
        }
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
	public void updateViewCount(int postNo) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	

}
