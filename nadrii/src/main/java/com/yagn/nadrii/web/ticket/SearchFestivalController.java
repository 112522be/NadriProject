package com.yagn.nadrii.web.ticket;

import java.util.Map;

import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model2.mvc.common.OpenApiPage;
import com.model2.mvc.common.OpenApiSearch;
import com.model2.mvc.service.domain.DetailIntro;
import com.model2.mvc.service.domain.SearchFestival;
import com.model2.mvc.service.ticket.TicketService;

// [행사정보 조회] 
@Controller
@RequestMapping("/ticket/*")
public class SearchFestivalController {

	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	/// Constructor
	public SearchFestivalController() {
			System.out.println(this.getClass());
		}
	
	/// Page process
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['numOfRows']}")
	int numOfRows;
	
	@RequestMapping(value = "listTicket", method = RequestMethod.GET)
	public String listTicket(
			
//			@ModelAttribute("openApiPage") OpenApiPage openApiPage, 
//			@ModelAttribute("openApiSearch") OpenApiSearch openApiSearch, 
//			@ModelAttribute("searchFestival") SearchFestival searchFestival,
//			@ModelAttribute("detailIntro") DetailIntro detailIntro,
			Model model
			
			) throws Exception {
		
		System.out.println("\n/ticket/listTicket : GET");
		
		/*
		System.out.println("[1]==>" + openApiPage);
		System.out.println("[2]==>" + openApiSearch);
		System.out.println("[3]==>" + searchFestival);
		System.out.println("[4]==>" + detailIntro);
		
		if(openApiSearch.getPageNo() == 0) {
			openApiSearch.setPageNo(1);
		}
		openApiSearch.setNumOfRows(numOfRows);
		

		OpenApiPage resultPage = new OpenApiPage(
				openApiSearch.getPageNo(), 
				((Integer) map.get("totalCount")).intValue(), 
				pageUnit,
				numOfRows
				);
		//*/
		
		
		Map<String, Object> map = ticketService.getSearchFestival();
		
		
		
		
		model.addAttribute("searchFestival", map.get("list"));
		
		return "forward:/ticket/listTicket.jsp";
	}
	
	
	
	/// Method
	/*
	@RequestMapping(value = "listTicket", method = RequestMethod.GET)
	public String listTicket(
			@ModelAttribute("openApiSearch") OpenApiSearch openApiSearch, 
			@ModelAttribute("searchFestival") SearchFestival searchFestival,
			@ModelAttribute("detailIntro") DetailIntro detailIntro,
			Model model
			) throws Exception {

		System.out.println("/ticket/listTicket : GET");

		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";
			
		String myKey = "ay3zIymuP5LX%2BGZhKC44TDdl68jrGAk5sMJ2Ry5GkBV0TvUP14kU13EG1mkNneM4GQOTPDsVuj2%2BCKLpcwcvfg%3D%3D"
				+ "&_type=json"
				;

		// Essential
		String serviceKey = "?ServiceKey=" + myKey;				
		String mobileOS = "&MobileOS=ETC"; 						
		String mobileApp = "&MobileApp=AppTest"; 				
		 
		// Page
		int numOfRows = 200;
		int pageNo = 1;
		
		// Option
		String listYN = "Y";			// 목록 구분 (Y=목록, N=개수)
		String arrange = "B";			// (A=제목순, B=조회순, C=수정일순, D=생성일순) 
										// 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)
		int contentTypeId = 15;			// 컨텐트 타입 ID
		int areaCode = 1;				// 지역코드
		int sigunguCode = 18;			// 시군구 코드
		String cat1 = "&cat1=";			// 대분류
		String cat2 = "&cat2=";			// 중분류
		String cat3 = "&cat3=";			// 소분류
		int eventStartDate = 20180101;	// 이벤트 시작일
		int eventEndDate = 20180331;	// 이벤트 종료일
		
		
		HttpGet httpGet = new HttpGet( url + serviceKey + mobileOS + mobileApp 
				+ "&numOfRows=" + numOfRows
				+ "&eventStartDate=" + eventStartDate
//				+ "&eventEndDate=" + eventEndDate
//				+ "&areaCode=" + areaCode
//				+ "&sigunguCode=" + sigunguCode
				+ "&arrange=" + arrange
				);
		System.out.println("=====");
		System.out.println(httpGet);
		
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		HttpResponse httpResponse = httpClient.execute(httpGet);
		System.out.println(httpResponse);
		System.out.println();

		HttpEntity httpEntity = httpResponse.getEntity();

		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
		
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		
		JSONObject response = (JSONObject) jsonobj.get("response");
		JSONObject header = (JSONObject) response.get("header");
		JSONObject body = (JSONObject) response.get("body");
		JSONObject items = (JSONObject) body.get("items");
		
		JSONArray item = (JSONArray) items.get("item");
		
		List list = new ArrayList();
		for (int i = 0; i < item.size(); i++) {
			JSONObject itemValue = (JSONObject) item.get(i);
			ObjectMapper resultMapper = new ObjectMapper();
			searchFestival = new SearchFestival();
			searchFestival = resultMapper.readValue(itemValue.toJSONString(), SearchFestival.class);
			
//			System.out.println("\n=====");
//			System.out.println("[contentID] : "+searchFestival.getContentid());	
			
			list.add(searchFestival);
			
//			System.out.println("\n=====" + "[" + (i+1) + "]");
//			System.out.println(searchFestival);
		}		
		
		model.addAttribute("searchFestival", list);
		
		return "forward:/ticket/listTicket.jsp";
	}
	//*/
	
} // end of class
