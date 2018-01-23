package com.yagn.nadrii.web.trip;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.service.trip.TourAPlUrlManage;
import com.yagn.nadrii.service.trip.TourApiDomain;
import com.yagn.nadrii.service.trip.TripService;


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
		TourAPlUrlManage tourAPlUrlManage = new TourAPlUrlManage();
		tourAPlUrlManage.urlClean();
		tourAPlUrlManage.setContentTypeId("14");
		tourAPlUrlManage.setType("areaBasedList?");
		tourAPlUrlManage.setCat1("A02");
		tourAPlUrlManage.setCat2("A0206");
		tourAPlUrlManage.setCat3("A02060100");
		tourAPlUrlManage.setPageNo(pageNo);
		
		System.out.println((tourAPlUrlManage.urlMaking()).trim());
		
		System.out.println("/trip/listMuseum");
		
		Map tripMap = tripService.listTrip(tourAPlUrlManage); 
		
		map.put("trip", "listMuseum");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		
		
		
		return "forward:/Trip/listTrip.jsp";
	}
	
	@RequestMapping(value="getMuseum")
	public String getMuseum(TourApiDomain tourApiDomain, @RequestParam("contentId") String contentId, @RequestParam("contentTypeId") String contentTypeId) throws Exception{
		System.out.println("/trip/getMuseum");
		
		
		TourAPlUrlManage tourAPlUrlManage = new TourAPlUrlManage();
		tourAPlUrlManage.urlClean();
		tourAPlUrlManage.setType("detailCommon?");
		tourAPlUrlManage.setContentId(contentId);
		tourAPlUrlManage.setContentTypeId(contentTypeId);
		
		tourApiDomain = tripService.getTrip(tourAPlUrlManage);
					
		return "forward:/Trip/getTrip.jsp";
	}
	
	

}
