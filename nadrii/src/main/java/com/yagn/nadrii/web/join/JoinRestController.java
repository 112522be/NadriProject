package com.yagn.nadrii.web.join;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.join.JoinService;

@RestController
@RequestMapping("/join/*")
public class JoinRestController {
	
	///Field
	@Autowired
	@Qualifier("joinServiceImpl")
	private JoinService joinService;
		
	public JoinRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="json/addJoin", method=RequestMethod.POST)
	public Join addJoin(@RequestBody Join join) throws Exception {

		System.out.println("/join/json/addJoin :: POST");
		
		joinService.addJoin(join);
		
		return join;
	}
	
	@RequestMapping(value="json/getJoin/{joinNo}" , method=RequestMethod.GET)
	public Join getJoin(@PathVariable int joinNo) throws Exception {
		
		System.out.println("/getJoin");
	
		return joinService.getJoin(joinNo);
	}
	
	@RequestMapping(value="json/updateJoin", method=RequestMethod.POST)
	public Join updateJoin(@RequestBody Join join) throws Exception{

		System.out.println("/updateJoin");
		
		joinService.updateJoin(join);
		
		return joinService.getJoin(join.getJoinNo());
	}
	
	
	@RequestMapping(value="json/listJoin")
	public Map listJoin(@RequestBody Search search) throws Exception{
		
		System.out.println("/listJoin");

		Map<String , Object> map=joinService.getJoinList(search);
		
		return map;
	}
}