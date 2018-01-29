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
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.NaverImage;
import com.yagn.nadrii.service.domain.SearchFestival;
import com.yagn.nadrii.service.ticket.TicketDao;
import com.yagn.nadrii.service.ticket.TicketService;

@Repository("naverApiDaoImpl")
public class NaverApiDaoImpl implements TicketDao {
	
	/// Field
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
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
	
	public String getNaverImage(String title) {
		
		System.out.println("\n[NaverApiDaoImpl.java]::getNaverImage");
		
		String naverReturnImage = "";
		
		try {
			String encodeTitle = URLEncoder.encode(title, "UTF-8");

			StringBuilder naverImageSB = NaverApiDaoImpl
					.sendGetNaverURL(new StringBuilder(searchImageURL + "query=" + encodeTitle // (필수) 검색할 문자열
							+ "&display=100" // 검색결과 출력 건수 (10(기본값), 100(최대))
//							+ "&filter=large" // 사이즈 필터 (all (기본값),large, medium, small)
//							+ "&sort=sim" // 정렬 옵션 (sim (유사도순), date (날짜순))
			), clientID, clientSecret);

			JSONObject niJsonObj = (JSONObject) JSONValue.parse(naverImageSB.toString());

			if (niJsonObj.get("total").toString().equals("0")) {

				// Daum Search 추가할 부분
				System.out.println("[Naver has not found Image...idiot]");

				String image = ticketService.getKakaoImage(title);

//				String rePresntImage = "http://pimage.design.co.kr/cms/contents/direct/info_id/63068/1371545650140.jpg";

				return image;

			} else {

				System.out.println("[Naver has found Image...awesome]");

				JSONArray niItems = (JSONArray) niJsonObj.get("items");

				/// 이미지 Response 후에 사이즈 크기 가장 큰것 찾는 algorithm
				int minImage = 300;
				for (int i = 0; i < niItems.size(); i++) {
					JSONObject itemsValue = (JSONObject) niItems.get(i);

					ObjectMapper objectMapper = new ObjectMapper();
					naverImage = new NaverImage();
					naverImage = objectMapper.readValue(itemsValue.toJSONString(), NaverImage.class);

					if (Integer.parseInt(naverImage.getSizeheight()) > minImage) {

						minImage = Integer.parseInt(naverImage.getSizeheight());
						naverReturnImage = naverImage.getThumbnail();
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return naverReturnImage;
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
	public String getKakaoImage(String title) throws Exception {
		return null;
	}
	
	
	
} // end of class
