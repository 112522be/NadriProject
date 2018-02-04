package com.yagn.nadrii.web.trip;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.TripService;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;


@RestController
@RequestMapping("/trip/*")
public class TripRestController {
	
	

	
	@Autowired
	@Qualifier("tripServiceImpl")
	private TripService tripService;
	
		
	public TripRestController() {
		System.out.println(this.getClass());
	}
	
	

		
	///*
	//�ڹ��� ����Ʈ
	@RequestMapping(value="json/listMuseum/{pageNo}/{areaCode}/{localName}")
	public Map listMuseum(@PathVariable("pageNo")int pageNo,@PathVariable("areaCode")String areaCode, @PathVariable("localName")String localName,HttpServletRequest request) throws Exception{
		if(areaCode.equals("0")) {
			areaCode="";
		}
		
		
		if(localName.equals("0")) {
			localName ="";
			//System.out.println("���� �� 13 ��������");
		}
		
		System.out.println(pageNo+"  RestController");
		System.out.println(areaCode +" : "+localName);
		System.out.println("RestController listMuseum");
		
		Map map = new HashMap();
		
		System.out.println("/trip/json/listMuseum");
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060100",areaCode, localName);
		/*
		List list = new ArrayList();
		for (int i = 0; i < ((List)tripMap.get("list")).size(); i++) {
			
		}*/
				
		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		map.put("list", tripMap.get("list"));
		
		
		
		return map;
	}
	
	///*
	//���ð� ����Ʈ
	@RequestMapping(value="json/listExhibit/{pageNo}/{areaCode}/{localName}")
	public Map listExhibit(@PathVariable("pageNo")int pageNo,@PathVariable("areaCode")String areaCode, @PathVariable("localName")String localName) throws Exception{
		
		System.out.println("RestController listExhibit");
		
		if(areaCode.equals("0")) {
			areaCode="";
		}
		
		if(localName.equals("0")) {
			localName ="";
			System.out.println("���� �� 13 ��������");
		}
		System.out.println(areaCode +" : "+localName);
		
		Map map = new HashMap();
				
		System.out.println("/trip/json/listExhibit");
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060300",areaCode, localName);
		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		map.put("list", tripMap.get("list"));
		
		
		
		return map;
	}
	
	
	//ü��� ����Ʈ
	@RequestMapping(value="json/listExperience/{pageNo}/{areaCode}/{localName}")
	public Map listExperience(@PathVariable("pageNo")int pageNo,@PathVariable("areaCode")String areaCode, @PathVariable("localName")String localName) throws Exception{
		
		System.out.println("RestController listExperience");
		if(areaCode.equals("0")) {
			areaCode="";
		}
		
		if(localName.equals("0")) {
			localName ="";
			System.out.println("���� �� 13 ��������");
		}
		System.out.println(areaCode +" : "+localName);
		
		Map map = new HashMap();
		
		System.out.println("/trip/json/listExperience");
		
		Map tripMap = tripService.listTrip(pageNo,"12","A02","A0203","A02030200",areaCode, localName);
		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		map.put("list", tripMap.get("list"));
		
		
		
		return map;
	}
	
	
	//�μӸ��� ����Ʈ
	@RequestMapping(value="json/listTradition/{pageNo}/{areaCode}/{localName}")
	public Map listTradition(@PathVariable("pageNo")int pageNo,@PathVariable("areaCode")String areaCode, @PathVariable("localName")String localName) throws Exception{
		
		System.out.println("RestController listTradition");
		if(areaCode.equals("0")) {
			areaCode="";
		}
		
		if(localName.equals("0")) {
			localName ="";
			System.out.println("���� �� 13 ��������");
			
		}
		System.out.println(areaCode +" : "+localName);
		Map map = new HashMap();
		
		System.out.println("/trip/json/listTradition");
		
		Map tripMap = tripService.listTrip(pageNo,"12","A02","A0201","A02010600",areaCode, localName);
		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		map.put("list", tripMap.get("list"));
		
		
		return map;
	}
	
	
	//�̼��� ����Ʈ	
	@RequestMapping(value="json/listGallery/{pageNo}/{areaCode}/{localName}")
	public Map listGallery(@PathVariable("pageNo")int pageNo,@PathVariable("areaCode")String areaCode, @PathVariable("localName")String localName) throws Exception{
		
		System.out.println("RestController listGallery");
		if(areaCode.equals("0")) {
			areaCode="";
		}
		
		if(localName.equals("0")) {
			localName ="";
		}
		System.out.println(areaCode +" : "+localName);
		Map map = new HashMap();
		
		System.out.println("/trip/json/listMuseum");
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060500",areaCode, localName);
		
		
		map.put("areaCode", areaCode);
		map.put("localName", localName);
		map.put("list", tripMap.get("list"));
		
		
		return map;
	}
	//*/
	
	//TourAPI���� Ư�� ���پ��̵� �ش��ϴ� �������� get
	@RequestMapping(value="json/getTrip/{contentId}/{contentTypeId}")
	public Map getTrip(@PathVariable("contentId") String contentId, @PathVariable("contentTypeId") String contentTypeId) throws Exception{
		
		System.out.println("RestController/trip/getTrip");
		
		System.out.println(contentId+", "+ contentTypeId);
			
		TourApiDomain tourApiDomain = tripService.getTrip(contentId,contentTypeId);
		TourApiDomain feeDomain = tripService.getTripDetail(contentId,contentTypeId);
		System.out.println(tourApiDomain);
		Map map = new HashMap();
		
		map.put("getTrip", tourApiDomain);
		map.put("getDetail",feeDomain );			
		
		
		
		//�������� �̹� ���� DB�� �ִ����� Ȯ��
		Trip trip = tripService.getTripFromDB(contentId);
		
		//������ ���� ����ؼ� ��ȸ�� Ȯ�� �� Rest ���� ����
		if(trip==null) {
			trip = new Trip();
			trip.setAddress(tourApiDomain.getAddr1());
			trip.setLat(tourApiDomain.getMapy());
			trip.setLng(tourApiDomain.getMapx());
			trip.setThumbnailImageFile(tourApiDomain.getFirstimage2());
			trip.setDescription(tourApiDomain.getOverview());
			trip.setTripName(tourApiDomain.getTitle());
			trip.setCreatedTime((tourApiDomain.getCreatedtime()).substring(0, 8));
			System.out.println(trip.getCreatedTime());
			trip.setContentId(tourApiDomain.getContentid()+"");
			trip.setContentTypeId(tourApiDomain.getContenttypeid()+"");
			tripService.addTriptoDB(trip);
			
		//������ ��ȸ���� 1 ������Ʈ	
		}else {
			tripService.updateViewCount(contentId);
			
		}	
		
		
		return map;
	}
	
	//�츮 DB�� ��� ����
	@RequestMapping(value="json/addTripToDB/{contentId}/{contentTypeId}")
	public Map addTripToDB(@PathVariable("contentId")String contentId, @PathVariable("contentTypeId")String contentTypeId)throws Exception {
		Map map = new HashMap();
		
		Trip trip = tripService.getTripFromDB(contentId);
		
		if(trip ==null) {
		
			TourApiDomain tourApiDomain = tripService.getTrip(contentId, contentTypeId);
			trip = new Trip();
			trip.setAddress(tourApiDomain.getAddr1());
			trip.setLat(tourApiDomain.getMapy());
			trip.setLng(tourApiDomain.getMapx());
			trip.setThumbnailImageFile(tourApiDomain.getFirstimage2());
			trip.setDescription(tourApiDomain.getOverview());
			trip.setTripName(tourApiDomain.getTitle());
			trip.setCreatedTime((tourApiDomain.getCreatedtime()).substring(0, 8));
			System.out.println(trip.getCreatedTime());
			trip.setContentId(tourApiDomain.getContentid()+"");
			trip.setContentTypeId(tourApiDomain.getContenttypeid()+"");
			tripService.addTriptoDB(trip);
		}
		
		map.put("result", tripService.getTripFromDB(contentId));
		return map;
	}
	
	@RequestMapping(value="json/getClientAddress")
	public void getClientAddress(@RequestBody JSONObject location, HttpServletRequest request)throws Exception {
		String lat = (Double)location.get("lat")+"";
		String lng = (Double)location.get("lng")+"";
		System.out.println("���޹��� JSON :   " +location);
		System.out.println("Latitude : " + lat +" , Longitude : "+ lng);
		
		List list = tripService.getClientAddress(lat, lng);
		System.out.println(list);
		String placeName =((String)list.get(1)).trim();
		System.out.println("���ø�::"+placeName);
		if(placeName.equals("����Ư����")) {
			placeName = "����";
		}
		
		String areaCode = tripService.getAreaCode(placeName, "");
		//System.out.println(placeName+"�� �����ڵ��  "+areaCode);
		placeName = ((String)list.get(2)).trim();
		String localName = tripService.getAreaCode(placeName, areaCode);
		//System.out.println(localName+"�� �ʿ���");
		
		HttpSession session = request.getSession(true);
		session.setAttribute("areaCode", areaCode);
		session.setAttribute("localName", localName);
		
	
		
	}
	
	
}