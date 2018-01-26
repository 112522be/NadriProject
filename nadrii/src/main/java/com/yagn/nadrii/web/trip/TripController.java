package com.yagn.nadrii.web.trip;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.service.trip.TripService;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetDetailUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPlListUrlManage;


@Controller
@RequestMapping("/trip/*")
public class TripController {
	
	@Autowired
	@Qualifier("tripServiceImpl")
	private TripService tripService;
	
		
	public TripController() {
		System.out.println(this.getClass());
	}


	@RequestMapping(value="listMuseum")	
	public String listMuseum(Map map, @RequestParam("pageNo")int pageNo) throws Exception{
		TourAPlListUrlManage tourAPlUrlManage = new TourAPlListUrlManage();
		tourAPlUrlManage.urlClean();
		tourAPlUrlManage.setContentTypeId("14");
		tourAPlUrlManage.setType("areaBasedList?");
		tourAPlUrlManage.setCat1("A02");
		tourAPlUrlManage.setCat2("A0206");
		tourAPlUrlManage.setCat3("A02060100");
		tourAPlUrlManage.setPageNo(pageNo);
		tourAPlUrlManage.setNumOfRows(12);
				
		System.out.println((tourAPlUrlManage.urlMaking()).trim());
		
		System.out.println("/trip/listMuseum");
		
		Map tripMap = tripService.listTrip(tourAPlUrlManage); 
		
		map.put("trip", "Museum");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		
		
		
		return "forward:/Trip/listTrip2.jsp";
	}
	
	@RequestMapping(value="getTrip")
	public String getMuseum(Map map, @RequestParam("contentId") String contentId, @RequestParam("contentTypeId") String contentTypeId) throws Exception{
		System.out.println("/trip/getMuseum");
				
		//기본 상세 정보 가져오기
		TourAPIGetUrlManage tourAPIGetUrlManage = new TourAPIGetUrlManage();
		tourAPIGetUrlManage.urlClean();
		tourAPIGetUrlManage.setContentId(contentId);
		tourAPIGetUrlManage.setContentTypeId(contentTypeId);
					
		// 가격 정보 가져오기
		TourAPIGetDetailUrlManage tourAPIGetDetailUrlManage = new TourAPIGetDetailUrlManage();
		tourAPIGetDetailUrlManage.setContentId(contentId);
		tourAPIGetDetailUrlManage.setContentTypeId(contentTypeId);
		
		TourApiDomain tourApiDomain = tripService.getTrip(tourAPIGetUrlManage);
		TourApiDomain feeDomain = tripService.getTripDetail(tourAPIGetDetailUrlManage);
		
		
		map.put("getTrip", tourApiDomain);
		map.put("getDetail",feeDomain );			
		return "forward:/Trip/getTrip.jsp";
	}
	
	
	@RequestMapping(value="/listExhibit")
	public String listExhibit(Map map, @RequestParam("pageNo")int pageNo) throws Exception{
		TourAPlListUrlManage tourAPlUrlManage = new TourAPlListUrlManage();
		tourAPlUrlManage.urlClean();
		tourAPlUrlManage.setContentTypeId("14");
		tourAPlUrlManage.setType("areaBasedList?");
		tourAPlUrlManage.setCat1("A02");
		tourAPlUrlManage.setCat2("A0206");
		tourAPlUrlManage.setCat3("A02060300");
		tourAPlUrlManage.setPageNo(pageNo);
		tourAPlUrlManage.setNumOfRows(12);
				
		System.out.println((tourAPlUrlManage.urlMaking()).trim());
		
		System.out.println("/trip/listExhibit");
		
		Map tripMap = tripService.listTrip(tourAPlUrlManage); 
		
		map.put("trip", "Exhibit");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		
				
		return "forward:/Trip/listTrip2.jsp";
	}
	
	
	@RequestMapping(value="/listGallery")
	public String listGallery(Map map, @RequestParam("pageNo")int pageNo) throws Exception{
		TourAPlListUrlManage tourAPlUrlManage = new TourAPlListUrlManage();
		tourAPlUrlManage.urlClean();
		tourAPlUrlManage.setContentTypeId("14");
		tourAPlUrlManage.setType("areaBasedList?");
		tourAPlUrlManage.setCat1("A02");
		tourAPlUrlManage.setCat2("A0206");
		tourAPlUrlManage.setCat3("A02060500");
		tourAPlUrlManage.setPageNo(pageNo);
		tourAPlUrlManage.setNumOfRows(12);
				
		System.out.println((tourAPlUrlManage.urlMaking()).trim());
		
		System.out.println("/trip/listGallery");
		
		Map tripMap = tripService.listTrip(tourAPlUrlManage); 
		
		map.put("trip", "Gallery");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		
				
		return "forward:/Trip/listTrip2.jsp";
	}
	
	@RequestMapping(value="/listExperience")
	public String listExperience(Map map, @RequestParam("pageNo")int pageNo) throws Exception{
		TourAPlListUrlManage tourAPlUrlManage = new TourAPlListUrlManage();
		tourAPlUrlManage.urlClean();
		tourAPlUrlManage.setContentTypeId("12");
		tourAPlUrlManage.setType("areaBasedList?");
		tourAPlUrlManage.setCat1("A02");
		tourAPlUrlManage.setCat2("A0203");
		tourAPlUrlManage.setCat3("A02030200");
		tourAPlUrlManage.setPageNo(pageNo);
		tourAPlUrlManage.setNumOfRows(12);
				
		System.out.println((tourAPlUrlManage.urlMaking()).trim());
		
		System.out.println("/trip/listExperience");
		
		Map tripMap = tripService.listTrip(tourAPlUrlManage); 
		
		map.put("trip", "Experience");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		
				
		return "forward:/Trip/listTrip2.jsp";
	}

	@RequestMapping(value="/listTradition")
	public String listHistory(Map map, @RequestParam("pageNo")int pageNo) throws Exception{
		TourAPlListUrlManage tourAPlUrlManage = new TourAPlListUrlManage();
		tourAPlUrlManage.urlClean();
		tourAPlUrlManage.setContentTypeId("12");
		tourAPlUrlManage.setType("areaBasedList?");
		tourAPlUrlManage.setCat1("A02");
		tourAPlUrlManage.setCat2("A0201");
		tourAPlUrlManage.setCat3("A02010600");
		tourAPlUrlManage.setPageNo(pageNo);
		tourAPlUrlManage.setNumOfRows(12);
				
		System.out.println((tourAPlUrlManage.urlMaking()).trim());
		
		System.out.println("/trip/listTradition");
		
		Map tripMap = tripService.listTrip(tourAPlUrlManage); 
		
		map.put("trip", "Tradition");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		
				
		return "forward:/Trip/listTrip2.jsp";
	}
}
