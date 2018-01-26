package com.yagn.nadrii.web.comm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.comm.CommService;

@RestController
@RequestMapping("/comm/*")
public class CommRestController {
	
	@Autowired
	@Qualifier("commServiceImpl")
	private CommService commService;
	
	@RequestMapping("listHashTag")
	public void listHashTag() {
		return ;
	}
}
