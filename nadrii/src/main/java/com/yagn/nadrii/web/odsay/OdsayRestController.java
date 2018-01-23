package com.yagn.nadrii.web.odsay;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.web.odsay.OdsayClientApp;

import test.domain.BusSearch;
import test.domain.BusTerminal;

@RestController
@RequestMapping("/openApi/*")
public class OdsayRestController {
	public OdsayRestController() {
		System.out.println("odsay Constructor....");
	}
	
	@RequestMapping(value="getBusID", method=RequestMethod.POST)
	public BusTerminal getBusID(@RequestBody BusTerminal busTerminal ) throws Exception {
		return OdsayClientApp.getTerminalID(busTerminal.getStationName());
	}
	
	@RequestMapping("getBusList")
	public BusSearch getBusList(@RequestBody BusSearch busSearch) throws Exception{
		busSearch = OdsayClientApp.getBusInfo(busSearch.getStartStationID(), busSearch.getEndStationID());
		return busSearch;
	}
	
	@RequestMapping("getPubTransPath")
	public String getPubTransPath(@RequestParam double sx, double sy, double ex, double ey) throws Exception{
		System.out.println("여기 접근....");
		return OdsayClientApp.getPubTransPath(sx, sy, ex, ey);
	}
				
}
