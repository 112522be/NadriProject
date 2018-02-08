package com.yagn.nadrii.web.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
//	@Autowired
//	JavaMailSender mailSender;
//	boolean result;
	
//    @Autowired
//    private JavaMailSender mailSender;
	
	///Field
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;

//		JavaMailSender mailSender;
		//setter Method 구현 않음
			
		public UserController(){
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
//	@RequestMapping(value = "checkId", method = { RequestMethod.GET, RequestMethod.POST})
//    public @ResponseBody int idCheck(User user, Model model) {
//        return UserService.checkId(user);
//    }
	
	    final String username="kimjh2218@gmail.com";
	    final String password="god2218923";
	
	    /**
	     * 메인페이지
	     * @return
	     * @throws Exception
	     */
		@RequestMapping(value="/main")
		public String main()throws Exception{
			System.out.println("메인페이지!!");
			return "redirect:/index.jsp";
		}


	// 이메일
		/*@RequestMapping(value="check", method=RequestMethod.POST)
		@ResponseBody
		//public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
		public Map<String,Object> emailAuth(HttpServletResponse response, HttpServletRequest request)throws Exception{	
			String email = request.getParameter("email");
			String authNum= "";
			
			authNum = randomNum();							//램덤 인증번호
			System.out.println("authNum : "+authNum);
			User user = new User();
			user.setCheckSuccess(authNum);
				System.out.println("email : "+email);
			sendEmail(email.toString(), authNum);			//메일발송
			request.getSession().setAttribute("confirmNum", authNum);
			Map<String, Object> mv = new HashMap<String, Object>();
			mv.put("email",email);
			mv.put("authNum",authNum);
			return mv;
		}
		*/
		
		@RequestMapping(value="check", method=RequestMethod.POST)
		@ResponseBody
		//public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
		public Map<String,Object> emailAuth(HttpServletResponse response, HttpServletRequest request, HttpSession session)throws Exception{	
			String email = request.getParameter("email");
			String authNum= "";
			
			authNum = randomNum();							//램덤 인증번호
			System.out.println("authNum : "+authNum);
			User user = new User();
			user.setCheckSuccess(authNum);
				System.out.println("email : "+email);
			sendEmail(email.toString(), authNum);			//메일발송
			request.getSession().setAttribute("confirmNum", authNum);
			Map<String, Object> mv = new HashMap<String, Object>();
			mv.put("email",email);
			mv.put("authNum",authNum);
			return mv;
		}
		
		/*@RequestMapping(value="checkSuccess", method=RequestMethod.POST)
		@ResponseBody
		//public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
		public Map<String,Object> checkSuccess(HttpServletResponse response, HttpServletRequest request)throws Exception{	
			String confirmNum = request.getParameter("confirmNum");
			
			Map<String, Object> mv = new HashMap<String, Object>();
			
			System.out.println("confirmNum : "+confirmNum);			// user가 입력한 인증 번호
			System.out.println("userVo.getCheckSuccess() : "+user.getCheckSuccess());
			if(confirmNum.equals(user.getCheckSuccess())) {		// equals 타입이 object 
				System.out.println(" 인증완료");
				mv.put("result","success");
			}else {
				System.out.println(" 인증번호 안맞음");
				mv.put("result","fail");
			}
			return mv;
		}*/
		
		@RequestMapping(value="checkSuccess", method=RequestMethod.POST)
		@ResponseBody
		//public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
		public Map<String,Object> checkSuccess(HttpServletResponse response, HttpServletRequest request)throws Exception{	
			String confirmNum = request.getParameter("confirmNum");
			
			Map<String, Object> mv = new HashMap<String, Object>();
			
			System.out.println("confirmNum : "+confirmNum);			// user가 입력한 인증 번호
//			System.out.println("user.getCheckSuccess() : "+user.getCheckSuccess());
//			if(confirmNum.equals(user.getCheckSuccess())) {	
			if(confirmNum.equals(request.getSession().getAttribute("confirmNum"))) {
				System.out.println(" 인증완료");
				mv.put("result","success");
			}else {
				System.out.println(" 인증번호 안맞음");
				mv.put("result","fail");
			}
			return mv;
		}

//		@RequestMapping(value="addUserPlus", method= RequestMethod.POST  )
//		public Object addUserPlus(User user, ModelMap model , HttpServletRequest request) throws Exception{
	//
//			try{
//				int cnt = Integer.parseInt(request.getParameter("cnt"));
	//
//		           for(int j = 1; j <= cnt ; j++ ){
//					for(int i = 0; i < request.getParameterValues("ch" + String.valueOf(j)).length ; i++){
//						System.out.println(request.getParameterValues("ch" + String.valueOf(j))[i]);
//					}
//				}	
//			} catch(Exception e){
//				e.printStackTrace();
//			}	
//			System.out.println("추가정보 입력!!");
//			userService.addUserPlus(user);
//			Map<String, String> map = new HashMap<String, String>();
//			map.put("msg", "success");
//			System.out.println("추가정보 입력이다" +map);
//			return map;
//		}
		
		private void sendEmail(String email, String authNum) throws UnsupportedEncodingException {
			 /*  
			String setfrom = "kimjh2218@gmail.com";
			String tomail = email;
			String title = "나들이 관리자";
			String content = "이메일 인증번호는 " +authNum+ "입니다.";
			
			
			
			
			///////////////////   
			String to = "abcd@gmail.com";

		      // Sender's email ID needs to be mentioned
		      String from = "kimjh2218@gmail.com";

		      // Assuming you are sending email from localhost
		      String host = "localhost";

		      // Get system properties
		      
		      MimeMessage message = mailSender.createMimeMessage();
				Properties props = new Properties();
		        
		      try{
		    	  Properties properties = System.getProperties();
		    	  Properties props = new Properties();
		      // Setup mail server
		      properties.setProperty("mail.smtp.host", host);

		      // Get the default Session object.
//		      Session session = Session.getDefaultInstance(properties);

		      
		    	  Session mailSession = Session.getInstance(props,
		    			  new javax.mail.Authenticator() {
		    		  protected PasswordAuthentication getPasswordAuthentication() {
		    			  return new PasswordAuthentication(requestingPrompt, requestingPrompt);
		    			  
		    		  }
		    	  })
		         // Create a default MimeMessage object.
		         Message message = new MimeMessage(mailSession);

		         // Set From: header field of the header.
		         message.setFrom(new InternetAddress(from));

		         // Set To: header field of the header.
		         message.addRecipient(Message.RecipientType.TO,
		                                  new InternetAddress(to));

		         // Set Subject: header field
		         message.setSubject("This is the Subject Line!");

		         // Now set the actual message
		         message.setText("This is actual message");

		         // Send message
		         Transport.send(message);
		         System.out.println("Sent message successfully....");
		      }catch (MessagingException mex) {
		         mex.printStackTrace();
		      }
		   
	      ////////////////////////////////////////////////////////       
	        
	        */
		/*
		private void sendEmail(String email, String authNum) {
		 Properties p = new Properties();
		  p.put("mail.smtp.user", "gmail_id@gmail.com"); // Google계정@gmail.com으로 설정
		  p.put("mail.smtp.host", "smtp.gmail.com");
		  p.put("mail.smtp.port", "465");
		  p.put("mail.smtp.starttls.enable","true");
		  p.put( "mail.smtp.auth", "true");
		 
		  p.put("mail.smtp.debug", "true");
		  p.put("mail.smtp.socketFactory.port", "465");
		  p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		  p.put("mail.smtp.socketFactory.fallback", "false");
		 
		  //Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		 
		  try {
		  // Authenticator auth = new SMTPAuthenticator();
		   Session session = Session.getInstance(p, auth);
		   session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
		 
		   //session = Session.getDefaultInstance(p);
		   MimeMessage msg = new MimeMessage(session);
		   String message = "Gmail SMTP 서버를 이용한 JavaMail 테스트";
		   msg.setSubject("Gmail SMTP 서버를 이용한 JavaMail 테스트");
		   msg.setContent(message, "text/plain;charset=KSC5601");
		   System.out.println("Message: " + msg.getContent());
		   Transport.send(msg);
		   System.out.println("Gmail SMTP서버를 이용한 메일보내기 성공");
		  }
		  catch (Exception mex) { // Prints all nested (chained) exceptions as well
		   System.out.println("I am here??? ");
		   mex.printStackTrace();
		  }
		
	      */  
		
				String host = "smtp.gmail.com";
				String subject = "나들이 이메일 인증번호";
				String fromName="나들이 관리자";
				String from="kimjh2218@gmail.com";
				String password = "top0347923";
//				String to01 = email;
				
				String content= "인증번호 ["+ authNum +"]";
				
				try {
			//		MimeMessage message = mailSender.createMimeMessage();
					Properties props = new Properties();
					
	/*				props.put("mail.smtp.starttls.enable", "true");
					props.put("mail.smtp.debug", "true");
					props.put("mail.smtp.starttls.enable","true");
					props.put("mail.transport.protocol", "smtp");
					props.put("mail.smtp.host", host);
					props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
					props.put("mail.smtp.port", "465");
					props.put("mail.smtp.starttls.enable", "true");
					props.put("mail.smtp.user", from);
					props.put("mail.smtp.auth", "true");
					props.put("mail.smtp.ssl.enable", "true");
					props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
					props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				    props.put("mail.smtp.socketFactory.fallback", "false");
				    props.put("mail.smtp.socketFactory.port", "465");
				    props.put("mail.smtp.starttls.enable", "true");
		*/		    
	/*				props.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
					props.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
					props.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
					props.put("mail.smtp.port", "587");                 // gmail 포트
					*/
					/*props.setProperty("mail.transport.protocol", "smtp");
			        props.setProperty("mail.host", host);
			        props.put("mail.transport.protocol", "smtp");
			        props.put("mail.smtp.auth", "true");
			        props.put("mail.smtp.port", "587");
			        props.setProperty( "mail.smtp.starttls.enable", "true" );
			        props.setProperty("mail.smtp.socketFactory.port", "587");
			        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			        props.put("mail.smtp.socketFactory.fallback", "false");
			        props.setProperty("mail.smtp.quitwait", "false");
			        props.put("mail.smtp.trust", "mail.myHost.com");
					props.put("mail.smtp.user", from);
					props.put("mail.smtp.password", password);*/
					
					props.put("mail.smtp.auth", "true");
					props.put("mail.smtp.starttls.enable", "true");
					props.put("mail.smtp.ssl.trust", host);
					props.put("mail.smtp.host", host);
					props.put("mail.smtp.port", "587");

					Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
							 
						protected PasswordAuthentication getPasswordAuthentication() {
						 return new PasswordAuthentication(from, password );
					}
					});
					System.out.println("랜덤"+content);
					MimeMessage message = new MimeMessage(mailSession);
					//message.setFrom(new InternetAddress("from@no-spam.com"));
					message.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));
					System.out.println("message!!" + message);
					InternetAddress[] address = {new InternetAddress(email,authNum)};
					System.out.println("address1" + address);
					message.setRecipients(Message.RecipientType.TO,
							address);
					message.setSentDate(new java.util.Date());
					message.setSubject(subject);
					message.setContent(content,"text/html; charset=UTF-8");
//					message.setText("Dear Mail Crawler," +
//							"\n\n No spam to my email, please!");
				    System.out.println("message" + message);
					Transport.send(message);
					System.out.println("Transport!!");
				} catch (MessagingException e) {
					e.printStackTrace();
				}catch(Exception e) {
					e.printStackTrace();
				}
	        
	    }
		


		
		
		public String randomNum() {
			StringBuffer buffer = new StringBuffer();
			for(int i = 0; i <= 6; i++) {
				int n = (int) (Math.random() *10);
				buffer.append(n);
			}
			return buffer.toString(); 
			}
	
	
	////////////////////////////////////////////////
	
	
	
	/**
	 *  login 페이지
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() throws Exception {
		System.out.println("로그인 페이지");
		return "redirect:/user/loginView.jsp";
	}
		
	//카카오
/*	@Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (Session.getCurrentSession().handleActivityResult(requestCode, resultCode, data)) {
            return;
        }

        super.onActivityResult(requestCode, resultCode, data);
    }
	*/
	/*
	@RequestMapping(value="/oauth", method=RequestMethod.POST)
	public String getKakaoUser(@ModelAttribute("tokenResponse") TokenResponse tokenResponse,
									@RequestParam String code, HttpSession session) throws Exception {
		tokenResponse = KakaoLoginRestClient.loginToken(code);
		System.out.println("카카오 토큰" +code);
		User user = KakaoLoginRestClient.getUserInfo(tokenResponse.getAccess_token());
		session.setAttribute("user", user);
		System.out.println("두번째 카카오" +user);
		session.setAttribute("token", tokenResponse.getAccess_token());
		return "redirect:/user/loginView.jsp";
	}
*/	
	
	@RequestMapping(value="/oauth", produces = "application/json", method= {RequestMethod.GET,RequestMethod.POST})
	public void kakaologin(@RequestParam("code") HttpServletRequest request, HttpServletResponse httpServlet) throws Exception{	
		
		final String AUTH_HOST = "https://kauth.kakao.com";
	    final String tokenRequestUrl = AUTH_HOST + "/oauth/token";

	    String CLIENT_ID = "[REST API Key]"; // 해당 앱의 REST API KEY 정보. 개발자 웹사이트의 대쉬보드에서 확인 가능
	    String REDIRECT_URI = "[Redirect uri]"; // 해당 앱의 설정된 uri. 개발자 웹사이트의 대쉬보드에서 확인 및 설정 가능
	    String code = "[Authorized code]"; // 로그인 과정중 얻은 authorization code 값
	    System.out.println("code" +code);
	    
	    HttpsURLConnection conn = null;
	    OutputStreamWriter writer = null;
	    BufferedReader reader = null;
	    InputStreamReader isr= null;

	    try {
	      final String params = String.format("grant_type=authorization_code&client_id=%s&redirect_uri=%s&code=%s",
	                        CLIENT_ID, REDIRECT_URI, code);

	      final URL url = new URL(tokenRequestUrl);

	      conn = (HttpsURLConnection) url.openConnection();
	      conn.setRequestMethod("POST");
	      conn.setDoOutput(true);

	      writer = new OutputStreamWriter(conn.getOutputStream());
	      writer.write(params);
	      writer.flush();

	      final int responseCode = conn.getResponseCode();
	      System.out.println("\nSending 'POST' request to URL : " + tokenRequestUrl);
	      System.out.println("Post parameters : " + params);
	      System.out.println("Response Code : " + responseCode);

	      isr = new InputStreamReader(conn.getInputStream());
	      reader = new BufferedReader(isr);
	      final StringBuffer buffer = new StringBuffer();
	      String line;
	      while ((line = reader.readLine()) != null) {
	        buffer.append(line);
	      }

	      System.out.println(buffer.toString());

	    } catch (IOException e) {
	      e.printStackTrace();
	    } finally {
	        // clear resources
	        if (writer != null) {
	          try {
	              writer.close();
	           } catch(Exception ignore) {
	           }
	        }
	        if (reader != null) {
	          try {
	              reader.close();
	          } catch(Exception ignore) {
	          }
	        }
	        if (isr != null) {
	            try {
	                isr.close();
	            } catch(Exception ignore) {
	            }
	         }
	    }
	}

	/**
	 * 회원가입 페이지
	 * @return
	 * @throws Exception
	 */
	 //@Cacheable(value = "users", key = "#userId")
	@RequestMapping(value="addUser", method=RequestMethod.GET  )
	public String addUser(HttpServletRequest request, @ModelAttribute User params ) throws Exception{
		/*
		System.out.println("회원가입");
		System.out.println("데이터"+params);		
		if(request.getParameter("facebookId") != null) {
		String fbId = request.getParameter("facebookId");		
		System.out.println("페이스북 아이디 : "+fbId);
		model.addAttribute("facebookId" , fbId );
		}
		//*/
		return "redirect:/user/addUserView.jsp";
	}
	
	/**
	 * 
	 * @param request
	 * @param model
	 * @param session
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addUserFacebook" )
	public String addUserFacebook(HttpServletRequest request, Model model, HttpSession session
		,@ModelAttribute User params 
		) throws Exception{
		
		System.out.println("facebook회원가입");
		
		//String str = URLDecoder.decode(params, "UTF-8");
		
		System.out.println("데이터"+params);		
//	if(uid != null && accessToken != null) {
			
		/*if(email != null) {
			
		System.out.println("uid : " +  uid);
			System.out.println("토큰 : " + accessToken );
			System.out.println("email : " +email);
			
//			model.addAttribute("uid" , uid);
//			model.addAttribute("accessToken", accessToken);
			
			session.setAttribute("uid", uid);
			session.setAttribute("accessToken", accessToken);
			session.setAttribute("email", email);
			
		}*/
		
		if(request.getParameter("facebookId") != null) {
			String fbId = request.getParameter("facebookId");		
			System.out.println("페이스북 아이디 : "+fbId);
			model.addAttribute("facebookId" , fbId );
			}
	
	/*if(uid == "" && accessToken == "") {
	}*/
		return "forward:/user/addUserFacebook.jsp";
	}
	
	/**
	 * 
	 * @param uid
	 * @param accessToke
	 * @param request
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
/*	@RequestMapping(value="addUserFacebook", method = RequestMethod.GET)
	public String addUserFacebook(HttpServletRequest request, Model model, HttpSession session) throws Exception{
		
		System.out.println("facebook회원가입");
		
				if(uid != null && accessToken != null) {
			
			System.out.println("uid" +uid);
			System.out.println("토큰 : " + accessToken );
			
//			model.addAttribute("uid" , uid);
//			model.addAttribute("accessToken", accessToken);
			
			session.setAttribute("uid", uid);
			session.setAttribute("accessToken", accessToken);
		}
		
		return "forword:/user/addUserFacebook.jsp";
	}*/
	
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public String view (HttpServletRequest request, HttpSession seeion) throws Exception{
		System.out.println("카카오 할예정");
		
		return "forward:/user/listUser.jsp";
	}
	
	/**
	 * 회원가입
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/logoutProc", method=RequestMethod.GET)
	public String logoutProc(HttpServletRequest request, Model model, HttpSession session) throws Exception{
	    request.getSession().removeAttribute("loginUser");
		session.invalidate();
	   
		System.out.println("로그아웃 : " + request.getSession().getAttribute("loginUser"));
		
		return "redirect:/index.jsp";
	}
	
	
	
	/**
	 *  아이디 찾기
	 * @param userName
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findIdPg", method=RequestMethod.GET)
	public String faindIdPg() throws Exception{
		System.out.println("아이디 찾기 페이지");
		return "forward:/user/findIdUser.jsp";
	}
	
	/*@RequestMapping(value="findId", method=RequestMethod.POST)
	public String faindId(@ModelAttribute("userId") String userId) throws Exception{
		System.out.println("아이디 찾기");
		return "forward:/user/findUser.jsp";
	}*/
	
	@RequestMapping(value="findPasswordPg", method=RequestMethod.GET)
	public String findPassword(User user, Model model) throws Exception{
		System.out.println("비밀번호 찾기");
		return "forward:/user/findPasswordUser.jsp";
	}
	
	/**
	 * 	추가정보 페이지 이동
	 * @param userId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addUserPlus", method=RequestMethod.GET)
	public String addUserPlus(String userId, Model model) throws Exception{
		System.out.println("추가정보 입력 페이지");
		return "forward:/user/addUserViewPlus.jsp";
	}
	
	/**
	 *  추가정보 입력
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addUserPlus", method=RequestMethod.POST)
	public String addUserPlus( @ModelAttribute("user")User user, Model model, HttpSession session) throws Exception{

		System.out.println("addUserPlus :: POST");
		
		System.out.println("\n[1] ==>" + user);
		
		System.out.println("생년 월일 >>" + user.getbirth());
		System.out.println("프로필 >>" + user.getprofileimageFile());
		System.out.println("핸드폰 번호 >>" + user.getPhone());
		System.out.println("사용자 이름 >>" + user.getUserName());
		System.out.println("자녀수 >>" + user.getchildren());
		System.out.println("성 별 >>" +user.getgender());

		user.setUserId( ((User) session.getAttribute("loginUser")).getUserId());
		
		System.out.println(user);
		
		if(user.getgender() == null) {
			user.setGender("");
		}
		
		userService.addUserPlus(user);
		
//		return null;
		//return "forward:/user/getUser?userId="+user.getUserId();
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser(String userId) throws Exception {
		//	@RequestParam("userId") String userId , Model model 
		System.out.println("/user/getUser : GET");
/*		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);
		*/
		return "forward:/user/getUser.jsp";
	}
}