package com.yagn.nadrii.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.yagn.nadrii.service.domain.User;
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
	
	/**
	 * ȸ������
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="json/loginCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loginCheck( 	@ModelAttribute("user") User user,
			HttpServletRequest request, HttpServletResponse response	){
		
		
		System.out.println("json/loginCheck : POST");
		String userId= request.getParameter("userId");
		String password= request.getParameter("password");
		System.out.println("userId : "+userId);
		System.out.println("password : "+password);
		user.setUserId(userId);
		User loginUser = new User();
		
		Map<String, Object> map =new HashMap<String, Object>();
		
		try {
			loginUser = userService.loginCheck(user);
			
			System.out.println("\n[1]::" + loginUser.toString());


			if (loginUser.getUserId() == null) {
				map.put("msg", "failed");
				
			} else {
				map.put("msg", "success");
				if (loginUser.getUserName() == null) {
					map.put("welcomeSign", loginUser.getUserId());
				} else {
					map.put("welcomeSign", loginUser.getUserName());
				}
				request.getSession().setAttribute("loginUser", loginUser);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return map;
	}
	
	/**
	 * 아이디 중복체크
	 * @param userId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "json/checkId", method=RequestMethod.POST)
	//@ResponseBody
    public Object idCheck(String userId, Model model) throws Exception {

		System.out.println("[check]");
		
		Map<String, String> map = new HashMap<String, String>();
		int check = userService.checkId(userId);

		map.put("check", String.valueOf(check));
		return map;
    }

	
	/**
	 * 
	 * @param userId
	 * @param responsel
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findId", method=RequestMethod.POST)
	//@ResponseBody
	public Map findId(@RequestParam("userId") String userId, HttpServletResponse responsel) throws Exception{
		System.out.println("���̵� ã��" + userId);
		
		Map<String, String> map = new HashMap<String, String>();
		//System.out.println(map.toString());
		//System.out.println(map.get(0));
		String findEmail = "{\"user_email\":\""+map+"\"}";
		
		map.put("eMail", findEmail);
		System.out.println(findEmail);
		
		return map;
	}
}


