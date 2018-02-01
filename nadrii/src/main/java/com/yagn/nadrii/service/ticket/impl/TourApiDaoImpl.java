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
			// System.out.println("current date check :: " + simpleDateFormat.format(new Date()));

			StringBuilder searchFestivalSB = TourApiDaoImpl.sendGetTourURL(new StringBuilder(
					searchFestivalURL + essentialURL 
					+ "&eventStartDate=" + simpleDateFormat.format(new Date())
							+ "&pageNo=" + openApiSearch.getPageNo() 
							+ "&numOfRows=" + openApiSearch.getNumOfRows()
							+ "&arrange=B"			
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
				
				System.out.println("\n[1. Title Check] ==> " + searchFestival.getTitle());
				if (searchFestival.getFirstimage() == null || searchFestival.getFirstimage() == "") {
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
				
				System.out.println("\n[2. ����� ���� Ȯ��] ==> " + priceInfo);
				
				// ���������� ����ִ� �ִٸ�......
				if (priceInfo.contains("000") || priceInfo.contains("00")) {

					System.out.println("\n[3. ���ڸ� ������ ���� Ȯ��] ==> " + priceInfo);

					String[] priceSplit = priceInfo.split(" |/");
					for (int k = 0; k < priceSplit.length; k++) {
						System.out.println("[4. �Ľ� �� Ȯ��] ==>" + priceSplit[k]);

						// split �� array���� ���������� ����
						if (priceSplit[k].contains("000") || priceSplit[k].contains("00")) {

							System.out.println("\n[5. ���� ������ ����ִ� �迭 �� Ȯ��] ==> " + priceSplit[k]);
							String priceValue = priceSplit[k].replaceAll("[^0-9]", "");
							System.out.println("[6. ��� Ȯ��] ==> " + priceValue);

							priceList.add(priceValue);
							
							for (int j = 0; j < priceList.size(); j++) {
								System.out.println("		[7. ����Ʈ�� ����� ��� �� Ȯ��] ==>" + priceList.get(j));
								System.out.println("");
								tourTicket.setUsetimefestival(priceList);
							}
						}
					}
				
				} else if (priceInfo.equals("")) {
					System.out.println("[8. ����� NULL :: '����' ��� ���]");
					entranceFee.add("����");
					tourTicket.setUsetimefestival(entranceFee);

				} else {
					System.out.println("[9. ���� �״�� ���]");
					entranceFee.add(priceInfo);
					tourTicket.setUsetimefestival(entranceFee);
				}

				
				System.out.println("[10. ������ �� Ȯ��] ==> " + priceList.toString());
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
				detailIntro.setAgelimit("There is no Data");
			}
			if (detailIntro.getBookingplace() == "" || detailIntro.getBookingplace() == null) {
				detailIntro.setBookingplace("There is no Data");
			}
			if (detailIntro.getDiscountinfofestival() == "" || detailIntro.getDiscountinfofestival() == null) {
				detailIntro.setDiscountinfofestival("There is no Data");
			}
			if (detailIntro.getEventhomepage() == "" || detailIntro.getEventhomepage() == null) {
				detailIntro.setEventhomepage("There is no Data");
			}
			if (detailIntro.getEventplace() == "" || detailIntro.getEventplace() == null) {
				detailIntro.setEventplace("There is no Data");
			}
			if (detailIntro.getFestivalgrade() == "" || detailIntro.getFestivalgrade() == null) {
				detailIntro.setFestivalgrade("There is no Data");
			}
			if (detailIntro.getPlaceinfo() == "" || detailIntro.getPlaceinfo() == null) {
				detailIntro.setPlaceinfo("There is no Data");
			}
			if (detailIntro.getPlaytime() == "" || detailIntro.getPlaytime() == null) {
				detailIntro.setPlaytime("There is no Data");
			}
			if (detailIntro.getProgram() == "" || detailIntro.getProgram() == null) {
				detailIntro.setProgram("There is no Data");
			}
			if (detailIntro.getSpendtimefestival() == "" || detailIntro.getSpendtimefestival() == null) {
				detailIntro.setSpendtimefestival("There is no Data");
			}
			if (detailIntro.getSponsor1tel() == "" || detailIntro.getSponsor1tel() == null) {
				detailIntro.setSponsor1tel("There is no Data");
			}
			if (detailIntro.getSponsor2tel() == "" || detailIntro.getSponsor2tel() == null) {
				detailIntro.setSponsor2tel("There is no Data");
			}
			if (detailIntro.getSponsor1() == "" || detailIntro.getSponsor1() == null) {
				detailIntro.setSponsor1("There is no Data");
			}
			if (detailIntro.getSponsor2() == "" || detailIntro.getSponsor2() == null) {
				detailIntro.setSponsor2("There is no Data");
			}
			if (detailIntro.getSubevent() == "" || detailIntro.getSubevent() == null) {
				detailIntro.setSubevent("There is no Data");
			}
			if (detailIntro.getUsetimefestival() == "" || detailIntro.getUsetimefestival() == null) {
				detailIntro.setUsetimefestival("Free");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return detailIntro;
	}
	
	public DetailImage getDetailImage(int contentId, String title) throws Exception {

		System.out.println("\n[tourApiDaoImpl.java]::getDetailImage");
		
		DetailImage detailImage = new DetailImage();

		StringBuilder detailImageSB = TourApiDaoImpl.sendGetTourURL(new StringBuilder(
				detailImageURL + essentialURL + "&contentId=" + contentId + "&imageYN=Y" + "&subImageYN=Y"));

		JSONObject diJsonObj = (JSONObject) JSONValue.parse(detailImageSB.toString());
		JSONObject diResponse = (JSONObject) diJsonObj.get("response");
		JSONObject diHeader = (JSONObject) diResponse.get("header");
		JSONObject diBody = (JSONObject) diResponse.get("body");

		if (diBody.get("items").toString().equals("")) {
			
			String image = ticketService.getNaverImage(title);
			detailImage.setOriginimgurl(image);	
			
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

		System.out.println("\n[2] ==> " + priceInfo);
		
		try {
			// ���������� ����ִ� �ִٸ�......
			if (priceInfo.contains("000") || priceInfo.contains("00")) {

				System.out.println("\n[3] ==> " + priceInfo);

				String[] priceSplit = priceInfo.split(" |/|:");
				
				System.out.println("\n[4]==>"+priceSplit.length);
				
				for (int k = 0; k < priceSplit.length; k++) {
					System.out.println("\n[4] ==>" + priceSplit[k]);

					if (priceSplit[k].contains("000") || priceSplit[k].contains("00")) {

						System.out.println("\n[5] ==> " + priceSplit[k]);
						String priceValue = priceSplit[k].replaceAll("[^0-9]", "");
						System.out.println("\n[6] ==> " + priceValue);

						priceList.add(priceValue);
						System.out.println("\n[7]==>" + priceList.size());						
						
						for (int j = 0; j < priceList.size(); j++) {
							System.out.println("		[8] ==>" + priceList.get(j));
							System.out.println("");
							// tourTicket.setUsetimefestival(priceList);
						}
					}
				}

			} else if (priceInfo.equals("")) {
				System.out.println("[9. if it's Null]");
				entranceFee.add("Free");
				return entranceFee;
				// tourTicket.setUsetimefestival(entranceFee);

			} else {
				System.out.println("[10. if it's not Null]");
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
