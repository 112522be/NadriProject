package com.yagn.nadrii.service.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yagn.nadrii.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })



public class UserTest {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Test
	public void addUserTest()throws Exception {
		User user = new User();
		user.setUserId("testermamuri");
		user.setEmail("questsolve@hanmail.net");
		user.setPassword("1234");
		userService.addUser(user);
		
	}

}
