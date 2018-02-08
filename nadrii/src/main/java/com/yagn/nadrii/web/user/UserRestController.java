package com.yagn.nadrii.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	 * 회원가입
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addUser", method= RequestMethod.GET  )
	//@ResponseBody
	public Object addUser(User user, @RequestParam String uid,
			@RequestParam String accessToken) throws Exception{
		//회원가입
		
		System.out.println("userID :   "+ uid);
		System.out.println("토큰  :   "+ accessToken);
		
		System.out.println("회원가입!!");
		userService.addUser(user);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "success");
		return map;
	}
	
	@RequestMapping(value="loginProc", method=RequestMethod.POST)
	//@ResponseBody
	public Object loginProc( User user, HttpServletRequest request, Model model) throws Exception{
		
		boolean isAdmin = false;
		
		System.out.println("회원 정보" + user.toString());	
		User loginUser = userService.loginProc(user);	
		Map<String,String> map =new HashMap<String, String>();
		
		if(loginUser == null) {
			map.put("msg", "failed");
			return map;
		}
		
		request.getSession().setAttribute("loginUser", loginUser );
		map.put("msg", "success");
		
		if(loginUser.getRole().equals("admin")) {
			System.out.println("관리자 로그인");
			isAdmin = true;
			request.getSession().setAttribute("isAdmin",  isAdmin);
		}else if(loginUser.getRole().equals("user")) {
			System.out.println("일반 로그인");
			isAdmin = false;
			request.getSession().setAttribute("isAdmin",  isAdmin);
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
	@RequestMapping(value = "checkId", method=RequestMethod.POST)
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
	public Object findId(@RequestParam("userId") String userId, HttpServletResponse responsel) throws Exception{
		System.out.println("아이디 찾기" + userId);
		
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(map.toString());
		System.out.println(map.get(0));
		String findEmail = "{\"user_email\":\""+map+"\"}";

		System.out.println(findEmail);
		
		return findEmail;
	}
	
	////////////////////////////////////////kakaoLoing///	
	@RequestMapping("/oauth/*")
	public class KakaoLoginRestController {

	}

	//////////////////////////////////////////////////////////////////
	/*		
	@RequestMapping(value="check", method=RequestMethod.POST)
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		String email = request.getParameter("email");
		String authNum= "";
		
		authNum = randomNum();
		
		sendEmail(email.toString(), authNum);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("email",email);
		mv.addObject("authNum",authNum);
		
		return mv;
	}

//	@RequestMapping(value="addUserPlus", method= RequestMethod.POST  )
//	public Object addUserPlus(User user, ModelMap model , HttpServletRequest request) throws Exception{
//
//		try{
//			int cnt = Integer.parseInt(request.getParameter("cnt"));
//
//	           for(int j = 1; j <= cnt ; j++ ){
//				for(int i = 0; i < request.getParameterValues("ch" + String.valueOf(j)).length ; i++){
//					System.out.println(request.getParameterValues("ch" + String.valueOf(j))[i]);
//				}
//			}	
//		} catch(Exception e){
//			e.printStackTrace();
//		}	
//		System.out.println("추가정보 입력!!");
//		userService.addUserPlus(user);
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("msg", "success");
//		System.out.println("추가정보 입력이다" +map);
//		return map;
//	}

	private void sendEmail(String email, String authNum) throws UnsupportedEncodingException {
		   
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
//	      Session session = Session.getDefaultInstance(properties);

	      
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
	
        
	
			String host = "smtp.gmail.com";
			String subject = "나들이 이메일 인증번호";
			String fromName="나들이 관리자";
			String from="kimjh2218@gmail.net";
			String password = "top0347923";
			String to01 = email;
			
			String content= "인증번호 ["+ authNum +"]";
			
			try {
		//		MimeMessage message = mailSender.createMimeMessage();
				Properties props = new Properties();
				
				props.put("mail.smtp.starttls.enable", "true");
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
			    
				props.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
				props.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
				props.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
				props.put("mail.smtp.port", "587");                 // gmail 포트
				
				props.setProperty("mail.transport.protocol", "smtp");
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
				props.put("mail.smtp.password", password);

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
//				message.setText("Dear Mail Crawler," +
//						"\n\n No spam to my email, please!");
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
		}*/
}
