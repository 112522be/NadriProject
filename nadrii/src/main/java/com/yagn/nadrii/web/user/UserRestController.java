package com.yagn.nadrii.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import org.apache.log4j.Logger;
import org.apache.log4j.Priority;
import org.json.simple.JSONObject;

import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.domain.kakaoLogin.TokenResponse;
import com.yagn.nadrii.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController extends SupportController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserRestController(){
		System.out.println(this.getClass());
	}
		
	@RequestMapping(value="json/addUser", method= RequestMethod.POST )
	public Map addUser(@RequestBody JSONObject jsonObject) throws Exception{
		System.out.println(this.getClass()+"/user/json/addUser.POST");
		System.out.println(jsonObject);
		User user = new User();
		user.setUserId((String)jsonObject.get("userId"));
		user.setPassword((String)jsonObject.get("password"));
		user.setEmail((String)jsonObject.get("email"));
		
		Map map = new HashMap();
		String result ="";
		
			System.out.println("user===>" +user);
		
		
		userService.addUser(user);
		
		if(user.getUserId()!=null) {
			result ="success!!";
			
		}else {
			result ="fail !!";
		}
		
		map.put("systemMessage", result);
		
		return map;
		
	}
			
	private String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() *10);
				buffer.append(n);
			}
		return buffer.toString(); 
	}

	@RequestMapping(value="json/login", method=RequestMethod.POST)
	public Map login(@RequestBody JSONObject jsonObject,HttpSession session,HttpServletRequest request) throws Exception {
		
		System.out.println(this.getClass()+"/login.POST");
		
		String userId = (String)jsonObject.get("userId");
		String password = (String)jsonObject.get("password");
		Map map = new HashMap();
		User user = userService.getUser(userId);
		System.out.println(user);
		if(user != null) {
			if(user.getPassword().equals(password)) {
				session = request.getSession(true);
				session.setAttribute("loginUser", user);
				map.put("systemMessage", "success!!!!");
			}else {
				map.put("systemMessage", "pwError");
			}
		}else {
			map.put("systemMessage", "IdError");
		}
		
		return map;		
	}
	
	
	
	@RequestMapping(value="/json/findIdPg",method=RequestMethod.POST)
	public Map getUserId(@RequestBody JSONObject jsonObject)throws Exception{
		
		System.out.println(this.getClass()+"/json/getUserId().Post");
		Map map = new HashMap();
		User user = new User();
		user.setUserId((String)jsonObject.get("userId"));
		user.setPassword((String)jsonObject.get("password"));
		user.setEmail((String)jsonObject.get("email"));
		
		
		System.out.println(user);
		user = userService.getUserByEmail(user.getEmail());
		map.put("systemMessage", user);
		return map;
	}
	
	
	
	@RequestMapping(value="/json/findPasswordPg",method=RequestMethod.POST)
	public Map getPassword(@RequestBody JSONObject jsonObject)throws Exception{
		Map map = new HashMap();
		System.out.println(this.getClass()+"/json/getPassword().POST");
		
		User user = new User();
		user.setUserId((String)jsonObject.get("userId"));
		user.setPassword((String)jsonObject.get("password"));
		user.setEmail((String)jsonObject.get("email"));
		System.out.println(user);
		user = userService.getPassword(user);
		System.out.println(user);
		map.put("systemMessage", user);
		return map;
	}
	
	@RequestMapping(value = "checkId", method=RequestMethod.POST)
    public Object idCheck(String user, Model model) throws Exception {

		System.out.println("[check]");
		
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("[check]!!!"+map);
		int check = userService.checkId(user);
		System.out.println("[check]01"+user);
		map.put("check", String.valueOf(check));
		return map;
    }	
}


