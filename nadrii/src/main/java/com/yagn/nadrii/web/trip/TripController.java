package com.yagn.nadrii.web.trip;

import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String listMuseum(Map map, @RequestParam("pageNo")int pageNo, @RequestParam("area")String area, HttpSession session) throws Exception{
				
		System.out.println("/trip/listMuseum");
				
		String areaCode = (String)session.getAttribute("areaCode");
		String localName = (String)session.getAttribute("localName");		
		
		if(area.equals("federal")) {
			localName="";
		}else if(area.equals("national")) {
			areaCode ="";
			localName="";
		}
		
		
		System.out.println(areaCode +":" +localName);
		
		TourAPlListUrlManage tourAPlUrlManage = new TourAPlListUrlManage();
				
		System.out.println((tourAPlUrlManage.urlMaking()).trim());
		
		System.out.println("/trip/listMuseum");
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060100",areaCode,localName); 
		
		map.put("trip", "Museum");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		
		
		
		return "forward:/Trip/listTrip.jsp";
		//return "forward:/Trip/listTrip.jsp";
	}
	
	@RequestMapping(value="getTrip")
	public String getMuseum(Map map, @RequestParam("contentId") String contentId, @RequestParam("contentTypeId") String contentTypeId) throws Exception{
		System.out.println("/trip/getMuseum");
		
		
		TourApiDomain tourApiDomain = tripService.getTrip(contentId,contentTypeId);
		TourApiDomain feeDomain = tripService.getTripDetail(contentId,contentTypeId);
		
		map.put("getTrip", tourApiDomain);
		map.put("getDetail",feeDomain );			
		return "forward:/Trip/getTrip.jsp";
	}
	
	
	@RequestMapping(value="/listExhibit")
	public String listExhibit(Map map, @RequestParam("pageNo")int pageNo, @RequestParam("area")String area, HttpSession session) throws Exception{
				
		System.out.println("/trip/listExhibit");
		
		String areaCode = (String)session.getAttribute("areaCode");
		String localName = (String)session.getAttribute("localName");		
		
		if(area.equals("federal")) {
			localName="";
		}else if(area.equals("national")) {
			areaCode ="";
			localName="";
		}
		
		
		System.out.println(areaCode +":" +localName);
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060300",areaCode,localName);
		
		map.put("trip", "Exhibit");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		
				
		return "forward:/Trip/listTrip.jsp";
	}
	
	
	@RequestMapping(value="/listGallery")
	public String listGallery(Map map, @RequestParam("pageNo")int pageNo, @RequestParam("area")String area, HttpSession session) throws Exception{
		
		System.out.println("/trip/listGallery");
		
		String areaCode = (String)session.getAttribute("areaCode");
		String localName = (String)session.getAttribute("localName");		
		
		if(area.equals("federal")) {
			localName="";
		}else if(area.equals("national")) {
			areaCode ="";
			localName="";
		}
		
		
		System.out.println(areaCode +":" +localName);
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060500",areaCode,localName);
		
		map.put("trip", "Gallery");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		
				
		return "forward:/Trip/listTrip.jsp";
	}
	
	@RequestMapping(value="/listExperience")
	public String listExperience(Map map, @RequestParam("pageNo")int pageNo, @RequestParam("area")String area, HttpSession session) throws Exception{
		
		System.out.println("/trip/listExperience");
		
		String areaCode = (String)session.getAttribute("areaCode");
		String localName = (String)session.getAttribute("localName");		
		
		if(area.equals("federal")) {
			localName="";
		}else if(area.equals("national")) {
			areaCode ="";
			localName="";
		}
		
		System.out.println(areaCode +":" +localName);
		
		Map tripMap = tripService.listTrip(pageNo,"12","A02","A0203","A02030200",areaCode,localName);
		
		map.put("trip", "Experience");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);	
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		
				
		return "forward:/Trip/listTrip.jsp";
	}

	@RequestMapping(value="/listTradition")
	public String listTradition(Map map, @RequestParam("pageNo")int pageNo, @RequestParam("area")String area, HttpSession session) throws Exception{
		
		System.out.println("/trip/listTradition");
		
		String areaCode = (String)session.getAttribute("areaCode");
		String localName = (String)session.getAttribute("localName");		
		
		if(area.equals("federal")) {
			localName="";
		}else if(area.equals("national")) {
			areaCode ="";
			localName="";
		}
				
		System.out.println(areaCode +":" +localName);
		
		Map tripMap = tripService.listTrip(pageNo,"12","A02","A0201","A02010600",areaCode,localName);
		
		map.put("trip", "Tradition");
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		
				
		return "forward:/Trip/listTrip.jsp";
	}
	
	@RequestMapping(value="/getTheme")
	public String getTheme() {
		return"forward:/Trip/getTheme.jsp";
	}
	
}
