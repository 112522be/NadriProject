package com.yagn.nadrii.web.user;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yagn.nadrii.service.common.CommentService;
import com.yagn.nadrii.service.domain.Comments;
import com.yagn.nadrii.service.domain.Message;
import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.domain.kakaoLogin.TokenResponse;
import com.yagn.nadrii.service.domain.naverLogin.NaverLoginResponse;
import com.yagn.nadrii.service.like.LikeService;
import com.yagn.nadrii.service.message.MessageService;
import com.yagn.nadrii.service.purchase.PurchaseService;
import com.yagn.nadrii.service.user.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {

	// @Autowired
	// JavaMailSender mailSender;
	// boolean result;

	// @Autowired
	// private JavaMailSender mailSender;

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	@Autowired
	@Qualifier("likeServiceImpl")
	private LikeService likeService;
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	public UserController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser() throws Exception {
		return "redirect:/user/addUserView.jsp";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute User user) throws Exception {
		System.out.println(this.getClass() + "/user/addUser.POST");

		System.out.println("\nuserId==" + user.getUserId());

		/// GetQRCode ///////////////////////////////////////////
		Purchase purchase = new Purchase();
		purchase.setBuyerId(user.getUserId());
		String getQRCode = purchaseService.getQRCode(purchase);
		System.out.println("\n[getQRCode Check]==>" + getQRCode);
		user.setQrCode(getQRCode);
		System.out.println("\n[User Domain Check]==>" + user.toString());
		/////////////////////////////////////////////////////////

		userService.addUser(user);

		Map map = new HashMap();

		return "redirect:/index.jsp";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception {

		System.out.println(this.getClass() + "/login.GET");
		return "redirect:/user/loginView.jsp";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute User user, HttpSession session, HttpServletRequest request, Map map)
			throws Exception {
		System.out.println(this.getClass() + "/login.POST");
		String userId = user.getUserId();
		String password = user.getPassword();

		user = userService.getUser(userId);
		System.out.println(user);
		if (user != null) {
			if (user.getPassword().equals(password)) {
				session = request.getSession(true);
				session.setAttribute("loginUser", user);
				return "redirect:/index.jsp";

			} else {
				map.put("systemMessage", "pwError");
				return "forward:/user/loginView.jsp";
			}

		} else {
			map.put("systemMessage", "IdError");
			return "forward:/user/loginView.jsp";
		}

	}

	@RequestMapping(value = "/logout")
	public String logout(Map map, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println(this.getClass() + ".getPassword().POST");
		session = request.getSession(true);
		session.removeAttribute("loginUser");
		return "forward:/index.jsp";

	}

	@RequestMapping(value = "/findIdPg", method = RequestMethod.GET)
	public String getUserId() throws Exception {
		System.out.println(this.getClass() + ".getUserId().GET");
		return "forward:/user/findIdUser.jsp";
	}

	@RequestMapping(value = "/findIdPg", method = RequestMethod.POST)
	public String getUserId(@ModelAttribute User user, Map map) throws Exception {
		user = userService.getUserByEmail(user.getEmail());
		map.put("user", user);
		return "forward:/user/beanPage.jsp";
	}

	@RequestMapping(value = "/findPasswordPg", method = RequestMethod.GET)
	public String getPassword() throws Exception {
		System.out.println(this.getClass() + ".getPassword()");
		return "forward:/user/findIdUser.jsp";
	}

	@RequestMapping(value = "/findPasswordPg", method = RequestMethod.POST)
	public String getPassword(@ModelAttribute User user, Map map) throws Exception {
		System.out.println(this.getClass() + ".getPassword().POST");

		System.out.println(user);
		user = userService.getPassword(user);
		System.out.println(user);
		map.put("user", user);
		return "forward:/user/beanPage.jsp";

	}

	@RequestMapping(value = "addUserPlus", method = RequestMethod.GET)
	public String addUserPlus() throws Exception {
		System.out.println("추가정보입력");

		return "forward:/user/addUserViewPlus.jsp";
	}
	
/*	@RequestMapping(value="addUserPlus", method=RequestMethod.POST)
	public String addUserPlus( @ModelAttribute("user")User user, Model model, HttpSession session) throws Exception{

<<<<<<< HEAD
	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println((User)session.getAttribute("loginUser"));
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		List<Comments> comments = commentService.listCommentById(userId);
		List<Message> messages = messageService.listMessage(userId);
		request.setAttribute("comments", comments);
		request.setAttribute("messages", messages);
=======
		System.out.println("addUserPlus :: POST");
		
		System.out.println("\n[1] ==>" + user);
		
		System.out.println("생년 월일 >>" + user.getBirth());
		System.out.println("프로필 >>" + user.getProfileImageFile());
		System.out.println("핸드폰 번호 >>" + user.getPhone());
		System.out.println("사용자 이름 >>" + user.getUserName());
		System.out.println("자녀수 >>" + user.getChildren());
		System.out.println("성 별 >>" +user.getGender());

		user.setUserId( ((User) session.getAttribute("loginUser")).getUserId());
		
		System.out.println(user);
		
		if(user.getGender() == null) {
			user.setGender("");
		}
		
		userService.addUserPlus(user);
		
//		return null;
		//return "forward:/user/getUser?userId="+user.getUserId();
		return "redirect:/user/getUser?userId="+user.getUserId();
	}*/
	
	
	@RequestMapping(value="getUser", method=RequestMethod.GET)
	public String getUser(){
		return "forward:/user/getUser.jsp";
	}

	// email 인증
	final String username = "kimjh2218@gmail.com";
	final String password = "god2218923";

	/**
	 * 메인페이지
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/main")
	public String main() throws Exception {
		System.out.println("메인페이지!!");
		return "redirect:/index.jsp";
	}

	//////////////////// 이메일////////////////////////////////
	@RequestMapping(value = "check", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> emailAuth(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws Exception {
		String email = request.getParameter("email");
		String authNum = "";

		authNum = randomNum(); // 램덤 인증번호
		System.out.println("authNum : " + authNum);
		User user = new User();
		user.setCheckSuccess(authNum);
		System.out.println("email : " + email);
		sendEmail(email.toString(), authNum); // 메일발송
		request.getSession().setAttribute("confirmNum", authNum);
		Map<String, Object> mv = new HashMap<String, Object>();
		mv.put("email", email);
		mv.put("authNum", authNum);
		return mv;
	}

	@RequestMapping(value = "checkSuccess", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkSuccess(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String confirmNum = request.getParameter("confirmNum");

		Map<String, Object> mv = new HashMap<String, Object>();

		System.out.println("confirmNum : " + confirmNum); // user가 입력한 인증 번호
		if (confirmNum.equals(request.getSession().getAttribute("confirmNum"))) {
			System.out.println(" 인증완료");
			mv.put("result", "success");
		} else {
			System.out.println(" 인증번호 안맞음");
			mv.put("result", "fail");
		}
		return mv;
	}

	private void sendEmail(String email, String authNum) throws UnsupportedEncodingException {
		String host = "smtp.gmail.com";
		String subject = "나들이 이메일 인증번호";
		String fromName = "나들이 관리자";
		String from = "kimjh2218@gmail.com";
		String password = "top0347923";
		// String to01 = email;

		String content = "인증번호 [" + authNum + "]";

		try {

			Properties props = new Properties();

			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.ssl.trust", host);
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "587");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, password);
				}
			});
			System.out.println("랜덤" + content);
			MimeMessage message = new MimeMessage(mailSession);
			// message.setFrom(new InternetAddress("from@no-spam.com"));
			message.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			System.out.println("message!!" + message);
			InternetAddress[] address = { new InternetAddress(email, authNum) };
			System.out.println("address1" + address);
			message.setRecipients(javax.mail.Message.RecipientType.TO, address);
			message.setSentDate(new java.util.Date());
			message.setSubject(subject);
			message.setContent(content, "text/html; charset=UTF-8");
			System.out.println("message" + message);
			Transport.send(message);
			System.out.println("Transport!!");
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	
			//////////////////////////////////////////////////////////////////////////////////////////
				
				@RequestMapping(value="updateUser", method=RequestMethod.POST)
				public String addUserPlus( @ModelAttribute("user")User user, Model model, HttpSession session) throws Exception{

					System.out.println("addUserPlus :: POST");
					
					System.out.println("\n[1] ==>" + user);
					
					System.out.println("비밀번호 >>" + user.getPassword());
					System.out.println("생년 월일 >>" + user.getBirth());
					System.out.println("프로필 >>" + user.getProfileImageFile());
					System.out.println("핸드폰 번호 >>" + user.getPhone());
					System.out.println("사용자 이름 >>" + user.getUserName());
					System.out.println("자녀수 >>" + user.getChildren());
					System.out.println("성 별 >>" +user.getGender());

					user.setUserId( ((User) session.getAttribute("loginUser")).getUserId());
					
					System.out.println(user);
					
					if(user.getGender() == null) {
						user.setGender("");
					}
					
					userService.updateUser(user);
					
//					return null;
					//return "forward:/user/getUser?userId="+user.getUserId();
					return "redirect:/user/getUser?userId="+user.getUserId();
				}


	@RequestMapping("kakaoLogin")
	public String kakaoLogin(@RequestParam String code, HttpServletRequest request) throws Exception {
		TokenResponse token = LoginRestClient.loginToken(code);
		JSONObject object = LoginRestClient.getProfile(token.getAccess_token());
		User user = new User();
		user.setEmail(object.get("kaccount_email").toString());
		user.setProfileImageFile(((JSONObject) object.get("properties")).get("profile_image").toString());
		user.setUserId(object.get("id").toString());
		request.setAttribute("outerUser", user);
		return "forward:addUserView.jsp";
	}
	
	@RequestMapping("naverLogin")
	public String naverLogin(@RequestParam String code, 
								@RequestParam String state,
								HttpServletRequest request) throws Exception {
		NaverLoginResponse response = LoginRestClient.getNaverToken(code, state);
		System.out.println(response);
		User user = LoginRestClient.getNaverUserInfo(response);
		System.out.println(user);
		request.setAttribute("outerUser", user);
		return "forward:addUserView.jsp";
	}

}

