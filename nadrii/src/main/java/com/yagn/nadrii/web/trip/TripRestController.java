package com.yagn.nadrii.web.trip;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.trip.TourAPlListUrlManage;
import com.yagn.nadrii.service.trip.TripService;


@RestController
@RequestMapping("/trip/*")
public class TripRestController {
	
	@Autowired
	@Qualifier("tripServiceImpl")
	private TripService tripService;
	
		
	public TripRestController() {
		System.out.println(this.getClass());
	}


	@RequestMapping(value="json/listMuseum/{pageNo}")
	public Map listMuseum(@PathVariable("pageNo")int pageNo) throws Exception{
		
		System.out.println("RestController list Museum");
		TourAPlListUrlManage tourAPlUrlManage = new TourAPlListUrlManage();
		tourAPlUrlManage.urlClean();
		tourAPlUrlManage.setType("areaBasedList?");
		tourAPlUrlManage.setContentTypeId("14");
		tourAPlUrlManage.setCat1("A02");
		tourAPlUrlManage.setCat2("A0206");
		tourAPlUrlManage.setCat3("A02060100");
		tourAPlUrlManage.setPageNo(pageNo);
		
		Map map = new HashMap();
		
		System.out.println("/trip/json/listMuseum");
		
		Map tripMap = tripService.listTrip(tourAPlUrlManage); 
		map.put("trip", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		System.out.println(pageNo);
		
		
		return map;
	}
	
	
	

}
