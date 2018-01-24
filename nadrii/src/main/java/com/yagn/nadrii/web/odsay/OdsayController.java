package com.yagn.nadrii.web.odsay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.service.domain.odsay.outside.OBJ;
import com.yagn.nadrii.service.odsay.OdsayService;

@Controller
@RequestMapping("/odsay/*")
public class OdsayController {
	
	@Autowired
	@Qualifier("odsayServiceImpl")
	private OdsayService odsayService;
		
	public OdsayController(){
		System.out.println(this.getClass());
	}
	@RequestMapping(value="getOBJ")
	public OBJ getOBJ(@RequestParam("sx") double sx, @RequestParam("sy") double sy, @RequestParam("ex") double ex, @RequestParam("ey") double ey) throws Exception {
			
		System.out.println("getOBJ");
		
		return odsayService.getOBJ(sx, sy, ex, ey);
	}
}
