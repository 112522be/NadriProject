package com.yagn.nadrii.service.ticket.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.OpenApiPage;
import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.SearchFestival;
import com.yagn.nadrii.service.domain.TourTicket;
import com.yagn.nadrii.service.ticket.TicketDao;
import com.yagn.nadrii.service.ticket.TicketService;

@Repository("tourApiDaoImpl")
public class TourApiDaoImpl implements TicketDao {
	
	/// Field
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	private SearchFestival searchFestival;
	private DetailIntro	 detailIntro;
	private DetailImage detailImgae;
	private TourTicket tourTicket;
	
	/// TourAPI properties
	@Value("#{tourApiProperties['searchFestivalURL']}")
	private String searchFestivalURL;
	@Value("#{tourApiProperties['essentialURL']}")
	private String essentialURL;
	@Value("#{tourApiProperties['detailIntroURL']}")
	private String detailIntroURL;
	@Value("#{tourApiProperties['detailImageURL']}")
	private String detailImageURL;
	
	/// Constructor
	public TourApiDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public static final StringBuilder sendGetTourURL(StringBuilder urlBuilder) throws Exception {
		
		System.out.println("\n[TourApiDaoImpl.java]::sendGetTourURL");

		URL url = new URL(urlBuilder.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");

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
	
	
	public Map<String, Object> getTicketList(OpenApiSearch openApiSearch) {
		
		System.out.println("\n[tourApiDaoImpl.java]::getTicketList");

		Map<String, Object> map = new HashMap<String, Object>();

		try {
			// Date currentDate = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			// System.out.println("현재날짜 확인 :: " + simpleDateFormat.format(new Date()));

			StringBuilder searchFestivalSB = TourApiDaoImpl.sendGetTourURL(new StringBuilder(
					searchFestivalURL + essentialURL 
					+ "&eventStartDate=" + simpleDateFormat.format(new Date())
							+ "&pageNo=" + openApiSearch.getPageNo() 
							+ "&numOfRows=" + openApiSearch.getNumOfRows()
							));

			JSONObject sfJsonObj = (JSONObject) JSONValue.parse(searchFestivalSB.toString());
			JSONObject sfResponse = (JSONObject) sfJsonObj.get("response");
			JSONObject sfHeader = (JSONObject) sfResponse.get("header");

			JSONObject sfBody = (JSONObject) sfResponse.get("body");
			ObjectMapper sfBodyMapper = new ObjectMapper();
			OpenApiPage openApiPage = new OpenApiPage();
			openApiPage = sfBodyMapper.readValue(sfBody.toJSONString(), OpenApiPage.class);

			System.out.println("" + openApiPage);

			map.put("totalCount", openApiPage.getTotalCount());

			JSONObject sfItems = (JSONObject) sfBody.get("items");
			JSONArray sfItem = (JSONArray) sfItems.get("item");

			List<TourTicket> tourTicketList = new ArrayList<TourTicket>();

			for (int i = 0; i < sfItem.size(); i++) {

				JSONObject itemValue = (JSONObject) sfItem.get(i);

				ObjectMapper objectMapper = new ObjectMapper();
				searchFestival = new SearchFestival();
				searchFestival = objectMapper.readValue(itemValue.toJSONString(), SearchFestival.class);

				detailIntro = this.getDetailIntro(searchFestival.getContentid(), searchFestival.getContenttypeid());

				tourTicket = new TourTicket();

				// searchFestival domain set
				tourTicket.setContentid(searchFestival.getContentid());
				tourTicket.setContenttypeid(searchFestival.getContenttypeid());
				tourTicket.setEventstartdate(searchFestival.getEventstartdate());
				tourTicket.setEventenddate(searchFestival.getEventenddate());

				System.out.println("\n[1. 타이틀 확인] ==> " + searchFestival.getTitle());
				if (searchFestival.getFirstimage() == null || searchFestival.getFirstimage() == "") {
					String image = ticketService.getNaverImage(searchFestival.getTitle());
					tourTicket.setFirstimage(image);
				} else {
					tourTicket.setFirstimage(searchFestival.getFirstimage());
				}

				tourTicket.setFirstimage2(searchFestival.getFirstimage2());
				tourTicket.setReadcount(searchFestival.getReadcount());
				tourTicket.setTitle(searchFestival.getTitle().replaceAll(" 2018", ""));
				tourTicket.setTel(searchFestival.getTel());
				tourTicket.setAreacode(searchFestival.getAreacode());
				tourTicket.setSigungucode(searchFestival.getSigungucode());

				// detailIntro domain set
				tourTicket.setAgelimit(detailIntro.getAgelimit());
				tourTicket.setBookingplace(detailIntro.getBookingplace());
				tourTicket.setDiscountinfofestival(detailIntro.getDiscountinfofestival());
				tourTicket.setEventhomepage(detailIntro.getEventhomepage());
				tourTicket.setEventplace(detailIntro.getEventplace());
				tourTicket.setFestivalgrade(detailIntro.getFestivalgrade());
				tourTicket.setPlaceinfo(detailIntro.getPlaceinfo());
				tourTicket.setPlaytime(detailIntro.getPlaytime());
				tourTicket.setProgram(detailIntro.getProgram());
				tourTicket.setSpendtimefestival(detailIntro.getSpendtimefestival());
				tourTicket.setSponsor1tel(detailIntro.getSponsor1tel());
				tourTicket.setSponsor2tel(detailIntro.getSponsor2tel());
				tourTicket.setSponsor1(detailIntro.getSponsor1());
				tourTicket.setSponsor2(detailIntro.getSponsor2());
				tourTicket.setSubevent(detailIntro.getSubevent());
				
				
				String priceInfo = detailIntro.getUsetimefestival();
				List<String> entranceFee = new ArrayList<String>();
				List<String> priceList = new ArrayList<String>();

				System.out.println("\n[2. 입장권 정보 확인] ==> " + priceInfo);
				
				// 가격정보가 들어있는 있다면......
				if (detailIntro.getUsetimefestival().contains("000")
						|| detailIntro.getUsetimefestival().contains("00")) {

					System.out.println("\n[3. 숫자를 포함한 문구 확인] ==> " + priceInfo);

					String[] priceSplit = priceInfo.split(" |/");
					for (int k = 0; k < priceSplit.length; k++) {
						System.out.println("[4. 파싱 값 확인] ==>" + priceSplit[k]);

						// split 한 array에서 가격정보만 선택
						if (priceSplit[k].contains("000") || priceSplit[k].contains("00")) {

							System.out.println("\n[5. 가격 정보가 들어있는 배열 값 확인] ==> " + priceSplit[k]);
							String priceValue = priceSplit[k].replaceAll("[^0-9]", "");
							System.out.println("[6. 요금 확인] ==> " + priceValue);

							priceList.add(priceValue);
							
							for (int j = 0; j < priceList.size(); j++) {
								System.out.println("		[7. 리스트에 저장된 요금 값 확인] ==>" + priceList.get(j));
								System.out.println("");
								tourTicket.setUsetimefestival(priceList);
							}
						}
					}
				
				} else if (priceInfo.equals("")) {
					System.out.println("[8. 입장권 NULL :: '무료' 라고 출력]");
					entranceFee.add("무료");
					tourTicket.setUsetimefestival(entranceFee);

				} else {
					System.out.println("[9. 정보 그대로 출력]");
					entranceFee.add(priceInfo);
					tourTicket.setUsetimefestival(entranceFee);
				}

				System.out.println("[10. 도메인 값 확인] ==> " + priceList.toString());
				
				tourTicketList.add(tourTicket);

				map.put("tourTicketList", tourTicketList);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}

	public DetailIntro getDetailIntro(int contentId, int contentTypeId) throws Exception {
		
		System.out.println("//======");
		System.out.println("[tourApiDaoImpl.java]::getDetailIntro");

		StringBuilder detailIntroSB = TourApiDaoImpl
				.sendGetTourURL(new StringBuilder(detailIntroURL + essentialURL 
						+ "&introYN=Y" 
						+ "&contentId="	+ contentId 
						+ "&contentTypeId=" + contentTypeId
						));
		
		JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailIntroSB.toString());

		JSONObject diResponse = (JSONObject) diJsonObj.get("response");
		JSONObject diHeader = (JSONObject) diResponse.get("header");
		JSONObject diBody = (JSONObject) diResponse.get("body");
		JSONObject diItems = (JSONObject) diBody.get("items");
		JSONObject diItem = (JSONObject) diItems.get("item");
		
		ObjectMapper objectMapper = new ObjectMapper();
		detailIntro = new DetailIntro();
		detailIntro = objectMapper.readValue(diItem.toJSONString(), DetailIntro.class);
		
		return detailIntro;
	}
	
	public DetailImage getDetailImage(int contentId) throws Exception {

		System.out.println("\n[tourApiDaoImpl.java]::getDetailImage");

		DetailImage detailImage = new DetailImage();

		StringBuilder detailImageSB = TourApiDaoImpl.sendGetTourURL(new StringBuilder(
				detailImageURL + essentialURL + "&contentId=" + contentId + "&imageYN=Y" + "&subImageYN=Y"));

		JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailImageSB.toString());
		JSONObject diResponse = (JSONObject) diJsonObj.get("response");
		JSONObject diHeader = (JSONObject) diResponse.get("header");
		JSONObject diBody = (JSONObject) diResponse.get("body");

		if (diBody.get("items").toString().equals("")) {
			
			System.out.println("[response] :: Null");
			
			detailImage.setContentid(000000);
			detailImage.setImagename("요청 페이지가 없습니다.");
			detailImage.setOriginimgurl("http://placehold.it/350X230");
			detailImage.setSerialnum("요청 페이지가 없습니다.");
			detailImage.setSmallimageurl("http://placehold.it/350X230");

			return detailImage;
			
		} else {
			
			JSONObject diItems = (JSONObject) diBody.get("items");

			if (diItems.get("item") instanceof JSONObject) {

				System.out.println("[response] :: diItems instanceof = JSONObject");

				JSONObject item = (JSONObject) diItems.get("item");

				ObjectMapper objectMapper = new ObjectMapper();
				detailImage = new DetailImage();
				detailImage = objectMapper.readValue(item.toJSONString(), DetailImage.class);

			}
			
			if (diItems.get("item") instanceof JSONArray) {
				
				System.out.println("[response] :: diItems instanceof = JSONArray");

				JSONArray diItem = (JSONArray) diItems.get("item");
				
				for (int i = 0; i < diItem.size(); i++) {
					
					JSONObject value = (JSONObject) diItem.get(i);
					
					ObjectMapper objectMapper = new ObjectMapper();
					detailImage = new DetailImage();
					detailImage = objectMapper.readValue(value.toJSONString(), DetailImage.class);
				}
			}
		}
		return detailImage;
	}
	
	////////////////////////////////////////////////////////////////////////////////
	public String getNaverImage(String title) throws Exception {
		return null;
	}
	
	public String getKakaoImage(String title) throws Exception {
		return null;
	}
	
} // end of class
