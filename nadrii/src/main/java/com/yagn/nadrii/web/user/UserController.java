package com.yagn.nadrii.web.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@SuppressWarnings("unused")
	private void sendEmail(String email, String authNum) {

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
	      Properties properties = System.getProperties();

	      // Setup mail server
	      properties.setProperty("mail.smtp.host", host);

	      // Get the default Session object.
	      Session session = Session.getDefaultInstance(properties);

	      try{
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);

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
        
        
	
        
        
    }    

	
	
	
	
	/*
	@RequestMapping(value="/emailAuth", method = RequestMethod.POST)
	@ResponseBody	//		ajax 받고 넘길때, 만약 페이지 리턴할때 ResponseBody
	private Map emailAuth(HttpServletRequest request, String email) throws Exception{
	String randomNum = randomNum();
	System.out.println(email);
	sendEmail(email, randomNum);
	request.getSession().setAttribute("confirmNum", randomNum);
	Map<String, String> map = new HashMap<String, String>(); 
	
	map.put("msg", "success");
	
	
	return map;
	}
	*/
	
//	@RequestMapping(value = "check", method=RequestMethod.POST)
//	@ResponseBody
//	public ModelAndView enmailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
//		
//		String email = request.getParameter("email");
//		String authNum = "";
//		
//		authNum = randomNum();
//		
//		sendEmail(email.toString(), authNum);
//		
//
//		
//		return mv;
//	}
	
//	public String randomNum() {
//		StringBuffer buffer = new StringBuffer();
//		for (int i = 0; i <= 6 ; i++) {
//			int n = (int) (Math.random() *10);
//			buffer.append(n);
//		}
//		return buffer.toString();
//	}
	
	
	
	/**
	 *  login 페이지
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() throws Exception {
		return "redirect:/user/loginView.jsp";
	}
	
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

	@RequestMapping(value="/addUser", method= RequestMethod.GET  )
	public String addUser(HttpServletRequest request, Map map) throws Exception{
		
		System.out.println("회원가입");
		if(request.getParameter("facebookId") != null) {
			String fbId = request.getParameter("facebookId");		
			System.out.println("페이스북 아이디 : "+fbId);
			map.put("facebookId" , fbId );
		}
		return "redirect:/user/addUserView.jsp";
	}

	
	
	
	@RequestMapping(value="/addUser", method= RequestMethod.POST  )
	//@ResponseBody
	public String addUser(User user) throws Exception{
		//회원가입
		System.out.println("회원가입!!");
		System.out.println("userId==" +user.getUserId());
		
		userService.addUser(user);
		Map map = new HashMap();
		
		
		
		return "redirect:/user/addUser.jsp";
	}
	
	
	/*
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public String addUser(@RequestBody User user,Map map)throws Exception{
		System.out.println("회원 정보 저장 시작");
		System.out.println("Start to save User Data");
		userService.addUser(user);
		
		
		
		return "redirect:/user/addUser.jsp";
	}
	*/
	/**
	 * 회원가입
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/logoutProc", method=RequestMethod.GET)
	public String logoutProc(HttpServletRequest request, HttpSession session) throws Exception{
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
		System.out.println("아이디 찾기");
		return "redirect:/user/findIdUser.jsp";
	}
	
	@RequestMapping(value="findPasswordPg", method=RequestMethod.GET)
	public String findPassword(User user, Model model) throws Exception{
		System.out.println("비밀번호 찾기");
		return "redirect:/user/findPasswordUser.jsp";
	}
	
	@RequestMapping(value="addUserPlus", method=RequestMethod.GET)
	public String addUserPlus() throws Exception{
		//@RequestParam("userId") String userId, Model model
		System.out.println("추가정보 입력");
		
		//User user = userService.getUser(userId);
		
		//model.addAttribute("user",user);
		
		return "redirect:/user/addUserViewPlus.jsp";
	}
	
	/*
	@RequestMapping(value="addUserPlus", method=RequestMethod.POST)
	public String addUserPlus(@RequestParam(value = "checkArray[]")List<String> arrayParams, String userId , Model model , HttpSession session, HttpServletRequest request) throws Exception{
		System.out.println("추가정보 입력??????");
		
		System.out.println("체크박스!!" + arrayParams);
		
		User user = userService.getUser(userId);
		user.setPhone(user.getPhone());
		
		System.out.println("추가정보 입력...!!!"+user);
		model.addAttribute("user",user);
		
		return "redirect:/user/addUserViewPlus.jsp";
	}
	*/
	/**
	 *  추가정보 입력
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="addUserPlus", method=RequestMethod.POST)
	public String addUserPlus( @ModelAttribute("user")User user, HttpSession session) throws Exception{

		System.out.println("addUserPlus :: POST");
		
		System.out.println("\n[1] ==>" + user);
		
		System.out.println("생년 월일 >>" + user.getbirth());
		System.out.println("프로필 >>" + user.getprofiIeimageFile());
		System.out.println("핸드폰 번호 >>" + user.getPhone());
		System.out.println("사용자 이름 >>" + user.getUserName());
		System.out.println("자녀수 >>" + user.getchildren());
		System.out.println("성 별 >>" +user.getgender());

		userService.addUserPlus(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
//		return null;
		return "forward:/user/addUserViewPlus.jsp";
	}
	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Map map ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		
		map.put("user", user);
		
		return "forward:/user/getUser.jsp";
	}
}