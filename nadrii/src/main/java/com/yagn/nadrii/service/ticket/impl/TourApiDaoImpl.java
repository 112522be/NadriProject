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
							+ "&arrange=B"			//추후 정렬 추가할것(4가지)
							));

			JSONObject sfJsonObj = (JSONObject) JSONValue.parse(searchFestivalSB.toString());
			JSONObject sfResponse = (JSONObject) sfJsonObj.get("response");
			JSONObject sfHeader = (JSONObject) sfResponse.get("header");

			JSONObject sfBody = (JSONObject) sfResponse.get("body");
			ObjectMapper sfBodyMapper = new ObjectMapper();
			OpenApiPage openApiPage = new OpenApiPage();
			openApiPage = sfBodyMapper.readValue(sfBody.toJSONString(), OpenApiPage.class);

			map.put("totalCount", openApiPage.getTotalCount());

			JSONObject sfItems = (JSONObject) sfBody.get("items");
			JSONArray sfItem = (JSONArray) sfItems.get("item");

			List<TourTicket> tourTicketList = new ArrayList<TourTicket>();

			for (int i = 0; i < sfItem.size(); i++) {

				JSONObject itemValue = (JSONObject) sfItem.get(i);

				ObjectMapper objectMapper = new ObjectMapper();
				searchFestival = new SearchFestival();
				searchFestival = objectMapper.readValue(itemValue.toJSONString(), SearchFestival.class);

				detailIntro = new DetailIntro();
				detailIntro = this.getDetailIntro(searchFestival.getContentid(), searchFestival.getContenttypeid());

				tourTicket = new TourTicket();

				tourTicket.setTitle(searchFestival.getTitle().replaceAll(" 2018", ""));
				tourTicket.setContentid(searchFestival.getContentid());
				tourTicket.setContenttypeid(searchFestival.getContenttypeid());
				
				System.out.println("\n[1. 타이틀 확인] ==> " + searchFestival.getTitle());
				if (searchFestival.getFirstimage() == null || searchFestival.getFirstimage() == "") {
					System.out.println("[사진이 없어서 네이버 이미지 검색 호출]");
					String image = ticketService.getNaverImage(searchFestival.getTitle());
					tourTicket.setFirstimage(image);
				} else {
					tourTicket.setFirstimage(searchFestival.getFirstimage());
				}
				tourTicket.setEventstartdate(searchFestival.getEventstartdate());
				tourTicket.setEventenddate(searchFestival.getEventenddate());
				tourTicket.setReadcount(searchFestival.getReadcount());
				tourTicket.setEventplace(detailIntro.getEventplace());

				/*
				// searchFestival domain set
				tourTicket.setFirstimage2(searchFestival.getFirstimage2());
				tourTicket.setTel(searchFestival.getTel());
				tourTicket.setAreacode(searchFestival.getAreacode());
				tourTicket.setSigungucode(searchFestival.getSigungucode());

				// detailIntro domain set
				tourTicket.setPlaytime(detailIntro.getPlaytime());
				tourTicket.setAgelimit(detailIntro.getAgelimit());
				tourTicket.setBookingplace(detailIntro.getBookingplace());
				tourTicket.setDiscountinfofestival(detailIntro.getDiscountinfofestival());
				tourTicket.setEventhomepage(detailIntro.getEventhomepage());
				tourTicket.setFestivalgrade(detailIntro.getFestivalgrade());
				tourTicket.setPlaceinfo(detailIntro.getPlaceinfo());
				tourTicket.setProgram(detailIntro.getProgram());
				tourTicket.setSpendtimefestival(detailIntro.getSpendtimefestival());
				tourTicket.setSponsor1tel(detailIntro.getSponsor1tel());
				tourTicket.setSponsor2tel(detailIntro.getSponsor2tel());
				tourTicket.setSponsor1(detailIntro.getSponsor1());
				tourTicket.setSponsor2(detailIntro.getSponsor2());
				tourTicket.setSubevent(detailIntro.getSubevent());
				
				//*/
//				String priceInfo = detailIntro.getUsetimefestival();
//				List<String> priceList = ticketService.getTicketPrice(detailIntro.getUsetimefestival());
				tourTicket.setUsetimefestival(ticketService.getTicketPrice(detailIntro.getUsetimefestival()));
				
				/*
				List<String> priceList = new ArrayList<String>();
				List<String> entranceFee = new ArrayList<String>();
				
				System.out.println("\n[2. 입장권 정보 확인] ==> " + priceInfo);
				
				// 가격정보가 들어있는 있다면......
				if (priceInfo.contains("000") || priceInfo.contains("00")) {

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
				//*/	
				
				tourTicketList.add(tourTicket);

				map.put("tourTicketList", tourTicketList);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}

	public DetailIntro getDetailIntro(int contentId, int contentTypeId) {

		System.out.println("//======");
		System.out.println("[tourApiDaoImpl.java]::getDetailIntro");

		try {

			StringBuilder detailIntroSB = TourApiDaoImpl.sendGetTourURL(new StringBuilder(detailIntroURL + essentialURL
					+ "&introYN=Y" + "&contentId=" + contentId + "&contentTypeId=" + contentTypeId));

			JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailIntroSB.toString());

			JSONObject diResponse = (JSONObject) diJsonObj.get("response");
			JSONObject diHeader = (JSONObject) diResponse.get("header");
			JSONObject diBody = (JSONObject) diResponse.get("body");
			JSONObject diItems = (JSONObject) diBody.get("items");
			JSONObject diItem = (JSONObject) diItems.get("item");

			ObjectMapper objectMapper = new ObjectMapper();
			detailIntro = new DetailIntro();
			detailIntro = objectMapper.readValue(diItem.toJSONString(), DetailIntro.class);

			if (detailIntro.getAgelimit() == "" || detailIntro.getAgelimit() == null) {
				detailIntro.setAgelimit("관련정보없음");
			}
			if (detailIntro.getBookingplace() == "" || detailIntro.getBookingplace() == null) {
				detailIntro.setBookingplace("관련정보없음");
			}
			if (detailIntro.getDiscountinfofestival() == "" || detailIntro.getDiscountinfofestival() == null) {
				detailIntro.setDiscountinfofestival("관련정보없음");
			}
			if (detailIntro.getEventhomepage() == "" || detailIntro.getEventhomepage() == null) {
				detailIntro.setEventhomepage("관련정보없음");
			}
			if (detailIntro.getEventplace() == "" || detailIntro.getEventplace() == null) {
				detailIntro.setEventplace("관련정보없음");
			}
			if (detailIntro.getFestivalgrade() == "" || detailIntro.getFestivalgrade() == null) {
				detailIntro.setFestivalgrade("관련정보없음");
			}
			if (detailIntro.getPlaceinfo() == "" || detailIntro.getPlaceinfo() == null) {
				detailIntro.setPlaceinfo("관련정보없음");
			}
			if (detailIntro.getPlaytime() == "" || detailIntro.getPlaytime() == null) {
				detailIntro.setPlaytime("관련정보없음");
			}
			if (detailIntro.getProgram() == "" || detailIntro.getProgram() == null) {
				detailIntro.setProgram("관련정보없음");
			}
			if (detailIntro.getSpendtimefestival() == "" || detailIntro.getSpendtimefestival() == null) {
				detailIntro.setSpendtimefestival("관련정보없음");
			}
			if (detailIntro.getSponsor1tel() == "" || detailIntro.getSponsor1tel() == null) {
				detailIntro.setSponsor1tel("관련정보없음");
			}
			if (detailIntro.getSponsor2tel() == "" || detailIntro.getSponsor2tel() == null) {
				detailIntro.setSponsor2tel("관련정보없음");
			}
			if (detailIntro.getSponsor1() == "" || detailIntro.getSponsor1() == null) {
				detailIntro.setSponsor1("관련정보없음");
			}
			if (detailIntro.getSponsor2() == "" || detailIntro.getSponsor2() == null) {
				detailIntro.setSponsor2("관련정보없음");
			}
			if (detailIntro.getSubevent() == "" || detailIntro.getSubevent() == null) {
				detailIntro.setSubevent("관련정보없음");
			}
			if (detailIntro.getUsetimefestival() == "" || detailIntro.getUsetimefestival() == null) {
				detailIntro.setUsetimefestival("무료");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return detailIntro;
	}
	
	public DetailImage getDetailImage(int contentId, String title) throws Exception {

		System.out.println("\n[tourApiDaoImpl.java]::getDetailImage");
		System.out.println("[getDetailImage 인코딩 확인]==>" + title);
		
		DetailImage detailImage = new DetailImage();

		StringBuilder detailImageSB = TourApiDaoImpl.sendGetTourURL(new StringBuilder(
				detailImageURL + essentialURL + "&contentId=" + contentId + "&imageYN=Y" + "&subImageYN=Y"));

		JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailImageSB.toString());
		JSONObject diResponse = (JSONObject) diJsonObj.get("response");
		JSONObject diHeader = (JSONObject) diResponse.get("header");
		JSONObject diBody = (JSONObject) diResponse.get("body");

		if (diBody.get("items").toString().equals("")) {
			
			System.out.println("[사진 타이틀 확인]==>" + title);
			String image = ticketService.getNaverImage(title);
			detailImage.setOriginimgurl(image);	
			System.out.println("\n[getNaverImage로 부터 받은 이미지 :: ]==>" + image);
			
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
	
	public List<String> getTicketPrice(String priceInfo) {

		System.out.println("\n[tourApiDaoImpl.java]::getTicketPrice");

		List<String> priceList = new ArrayList<String>();
		List<String> entranceFee = new ArrayList<String>();

		System.out.println("\n[2. 입장권 정보 확인] ==> " + priceInfo);
		
		try {
			// 가격정보가 들어있는 있다면......
			if (priceInfo.contains("000") || priceInfo.contains("00")) {

				System.out.println("\n[3. 숫자를 포함한 문구 확인] ==> " + priceInfo);

				String[] priceSplit = priceInfo.split(" |/|:");
				
				System.out.println("\n[4. 파싱 갯수 확인]==>"+priceSplit.length);
				
				for (int k = 0; k < priceSplit.length; k++) {
					System.out.println("\n[4. 파싱 값 확인] ==>" + priceSplit[k]);

					// split 한 array에서 가격정보만 선택
					if (priceSplit[k].contains("000") || priceSplit[k].contains("00")) {

						System.out.println("\n[5. 가격 정보가 들어있는 배열 값 확인] ==> " + priceSplit[k]);
						String priceValue = priceSplit[k].replaceAll("[^0-9]", "");
						System.out.println("\n[6. 요금 확인] ==> " + priceValue);

						priceList.add(priceValue);
						System.out.println("\n[7. 가격 리스트 값 확인]==>" + priceList.size());						
						
						for (int j = 0; j < priceList.size(); j++) {
							System.out.println("		[8. 리스트에 저장된 요금 값 확인] ==>" + priceList.get(j));
							System.out.println("");
							// tourTicket.setUsetimefestival(priceList);
						}
					}
				}

			} else if (priceInfo.equals("")) {
				System.out.println("[9. 입장권 NULL :: '무료' 라고 출력]");
				entranceFee.add("무료");
				return entranceFee;
				// tourTicket.setUsetimefestival(entranceFee);

			} else {
				System.out.println("[10. 정보 그대로 출력]");
				entranceFee.add(priceInfo);
				return entranceFee;
				// tourTicket.setUsetimefestival(entranceFee);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return priceList;
	}
	
	
	////////////////////////////////////////////////////////////////////////////////
	public String getNaverImage(String title) throws Exception {
		return null;
	}
	
	public String getKakaoImage(String title) throws Exception {
		return null;
	}
	
} // end of class
