package com.yagn.nadrii.web.user;

import java.util.HashMap;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.purchase.PurchaseService;
import com.yagn.nadrii.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;


	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
	private JavaMailSender mailSender;

		
		public UserController(){
			System.out.println(this.getClass());
		}
		
		@RequestMapping(value="/addUser", method=RequestMethod.GET  )
		public String addUser() throws Exception{
			return "redirect:/user/addUserView.jsp";
		}

		
		@RequestMapping(value="/addUser", method= RequestMethod.POST  )
		public String addUser(@ModelAttribute User user) throws Exception{
			System.out.println(this.getClass()+"/user/addUser.POST");
			
			System.out.println("\nuserId==" +user.getUserId());
			
			/// GetQRCode ///////////////////////////////////////////
			Purchase purchase = new Purchase();
			purchase.setBuyerId(user.getUserId());
			purchase.setBuyerEmail(user.getEmail());
			String getQRCode = purchaseService.getQRCode(purchase);
			System.out.println("\n[getQRCode Check]==>" + getQRCode);
			user.setQrCode(getQRCode);
			System.out.println("\n[User Domain Check]==>" + user.toString());
			/////////////////////////////////////////////////////////
			
			userService.addUser(user);
			
			Map map = new HashMap();
			
			return "redirect:/index.jsp";
		}
			
	private String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() *10);
				buffer.append(n);
			}
		return buffer.toString(); 
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() throws Exception {
		System.out.println(this.getClass()+"/login.GET");
		return "redirect:/user/loginView.jsp";
	}
		
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute User user,HttpSession session,HttpServletRequest request, Map map) throws Exception {
		System.out.println(this.getClass()+"/login.POST");
		String userId = user.getUserId();
		String password = user.getPassword();
		
		user = userService.getUser(userId);
		System.out.println(user);
		if(user != null) {
			if(user.getPassword().equals(password)) {
				session = request.getSession(true);
				session.setAttribute("loginUser", user);
				return "redirect:/index.jsp";				
				
			}else {
				map.put("systemMessage", "pwError");
				return "forward:/user/loginView.jsp";
			}
			
		}else {
			map.put("systemMessage", "IdError");
			return "forward:/user/loginView.jsp";
		}
		
	}
	

	
	@RequestMapping(value="/logout")
	public String logout(Map map,HttpSession session, HttpServletRequest request)throws Exception{
		System.out.println(this.getClass()+".getPassword().POST");
		session = request.getSession(true);
		session.removeAttribute("loginUser");
		return "forward:/index.jsp";
	
	}
	
	
	@RequestMapping(value="/findIdPg",method=RequestMethod.GET)
	public String getUserId()throws Exception{
		System.out.println(this.getClass()+".getUserId().GET");
		return "forward:/user/findIdUser.jsp";
	}
	

	@RequestMapping(value="/findIdPg",method=RequestMethod.POST)
	public String getUserId(@ModelAttribute User user,Map map)throws Exception{
		user = userService.getUserByEmail(user.getEmail());
		map.put("user", user);
		return "forward:/user/beanPage.jsp";
	}
	
	
	@RequestMapping(value="/findPasswordPg",method=RequestMethod.GET)
	public String getPassword()throws Exception{
		System.out.println(this.getClass()+".getPassword()");
		return "forward:/user/findIdUser.jsp";
	}
	


	@RequestMapping(value="/findPasswordPg",method=RequestMethod.POST)
	public String getPassword(@ModelAttribute User user, Map map)throws Exception{
		System.out.println(this.getClass()+".getPassword().POST");
		System.out.println(user);
		user = userService.getPassword(user);
		System.out.println(user);
		map.put("user", user);
		return "forward:/user/beanPage.jsp";
	
	}
	
	
	

} 