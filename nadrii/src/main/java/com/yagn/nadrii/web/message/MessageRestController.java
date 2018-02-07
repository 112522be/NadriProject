package com.yagn.nadrii.web.message;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.message.MessageService;

@RestController
@RequestMapping("/message/")
public class MessageRestController {

	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	
	public Map addMessage() {
		Map map = new HashMap();
		
		
		
		return map; 
	}
	
}
