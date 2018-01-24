package com.yagn.nadrii.web.odsay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.domain.odsay.outside.OBJ;
import com.yagn.nadrii.service.odsay.OdsayService;

@RestController
@RequestMapping("/odsay/*")
public class OdsayRestController {

	@Autowired
	@Qualifier("odsayServiceImpl")
	private OdsayService odsayService;

	public OdsayRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getPubTransPath")
	public OBJ getOutTerminal(@RequestParam("sx") double sx, @RequestParam("sy") double sy, @RequestParam("ex") double ex, @RequestParam("ey") double ey) throws Exception {
			
		System.out.println("getOutTerminal");
		
		return odsayService.getOutTerminal(sx, sy, ex, ey);
	}
}
