package com.yagn.nadrii.web.trip;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.domain.Trip;
import com.yagn.nadrii.service.trip.TripService;
import com.yagn.nadrii.service.trip.domain.TourApiDomain;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetDetailUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPIGetUrlManage;
import com.yagn.nadrii.service.trip.urlmanage.TourAPlListUrlManage;


@RestController
@RequestMapping("/trip/*")
public class TripRestController {
	
	@Autowired
	@Qualifier("tripServiceImpl")
	private TripService tripService;
	
		
	public TripRestController() {
		System.out.println(this.getClass());
	}


	//�ڹ��� ����Ʈ
	@RequestMapping(value="json/listMuseum/{pageNo}")
	public Map listMuseum(@PathVariable("pageNo")int pageNo) throws Exception{
		
		System.out.println("RestController listMuseum");
		
		Map map = new HashMap();
		
		System.out.println("/trip/json/listMuseum");
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060100");
		
		
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		System.out.println(pageNo);
		
		
		return map;
	}
	
	
	//���ð� ����Ʈ
	@RequestMapping(value="json/listExhibit/{pageNo}")
	public Map listExhibit(@PathVariable("pageNo")int pageNo) throws Exception{
		
		System.out.println("RestController listExhibit");
		Map map = new HashMap();
		
		System.out.println("/trip/json/listExhibit");
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060300");
		
		
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		System.out.println(pageNo);
		
		
		return map;
	}
	
	
	//ü��� ����Ʈ
	@RequestMapping(value="json/listExperience/{pageNo}")
	public Map listExperience(@PathVariable("pageNo")int pageNo) throws Exception{
		
		System.out.println("RestController listExperience");
		
		Map map = new HashMap();
		
		System.out.println("/trip/json/listExperience");
		
		Map tripMap = tripService.listTrip(pageNo,"12","A02","A0203","A02030200");
		
		
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		System.out.println(pageNo);
		
		
		return map;
	}
	
	
	//�μӸ��� ����Ʈ
	@RequestMapping(value="json/listTradition/{pageNo}")
	public Map listTradition(@PathVariable("pageNo")int pageNo) throws Exception{
		
		System.out.println("RestController listTradition");
		
		Map map = new HashMap();
		
		System.out.println("/trip/json/listTradition");
		
		Map tripMap = tripService.listTrip(pageNo,"12","A02","A0201","A02010600");
		
		
		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		System.out.println(pageNo);
		
		
		return map;
	}
	
	
	//�̼��� ����Ʈ	
	@RequestMapping(value="json/listGallery/{pageNo}")
	public Map listGallery(@PathVariable("pageNo")int pageNo) throws Exception{
		
		System.out.println("RestController listGallery");
		
		Map map = new HashMap();
		
		System.out.println("/trip/json/listMuseum");
		
		Map tripMap = tripService.listTrip(pageNo,"14","A02","A0206","A02060500");
		
		

		map.put("list", tripMap.get("list"));
		map.put("pageNo", pageNo);		
		System.out.println(pageNo);
		
		
		return map;
	}
	
	
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
	@RequestMapping("json/addTripToDB/{contentId}/{contentTypeId}")
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
	
	@RequestMapping("json/getClientAddress")
	public void getClientAddress(@RequestBody JSONObject location)throws Exception {
		String lat = (Double)location.get("lat")+"";
		String lng = (Double)location.get("lng")+"";
		System.out.println("���޹��� JSON :   " +location);
		System.out.println("Latitude : " + lat +" , Longitude : "+ lng);
		
		List list = tripService.getClientAddress(lat, lng);
		
	}
	
}