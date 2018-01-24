package com.yagn.nadrii.service.ticket.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yagn.nadrii.service.ticket.TicketService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", 
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml", 
										"classpath:config/context-transaction.xml" })
public class TicketServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;

	@Test
	public void testGetTicketListAll() throws Exception {

		Map<String, Object> map = ticketService.getTicketList();

		@SuppressWarnings("unchecked")
		List<Object> list = (List<Object>) map.get("tourTicketList");
		Assert.assertEquals(10, list.size());

		// ==> console 확인
		System.out.println("[testGetProdcutProduct] : " + list);

	}
	 
	 
} // end of class