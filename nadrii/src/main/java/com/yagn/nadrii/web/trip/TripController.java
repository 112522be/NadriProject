package com.yagn.nadrii.web.trip;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		System.out.println("/trip/listMuseum");
		
		Map tripMap = tripService.listTrip(); 
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		
		
		
		return "forward:/Trip/listTrip.jsp";
	}
	
	
	

}
