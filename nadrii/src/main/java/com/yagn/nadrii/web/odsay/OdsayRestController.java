package com.yagn.nadrii.web.odsay;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//import com.model2.mvc.web.odsay.OdsayClientApp;
//
//import test.domain.BusSearch;
//import test.domain.BusTerminal;

/*
//@RestController
//@RequestMapping("/openApi/*")
=======
//@RestController
//@RequestMapping("/odsay/*")
>>>>>>> refs/remotes/origin/master
public class OdsayRestController {
	public OdsayRestController() {
		System.out.println("odsay Constructor....");
	}
	
<<<<<<< HEAD
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
=======

>>>>>>> refs/remotes/origin/master
}
//*/