package com.yagn.nadrii.web.odsay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yagn.nadrii.service.odsay.OdsayService;

//@Controller
//@RequestMapping("/odsay/*")
public class OdsayController {
	
	@Autowired
	@Qualifier("odsayServiceImpl")
	private OdsayService odsayService;
		
	public OdsayController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="getXY", method=RequestMethod.GET)
	public String getXY() throws Exception {

		System.out.println("/getXY");

		return "forward:/odsay/getXY.jsp";
	}
}
