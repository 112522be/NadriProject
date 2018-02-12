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
				@RequestMapping(value="check", method=RequestMethod.POST)
				@ResponseBody
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
				
				@RequestMapping(value="checkSuccess", method=RequestMethod.POST)
				@ResponseBody
				public Map<String,Object> checkSuccess(HttpServletResponse response, HttpServletRequest request)throws Exception{	
					String confirmNum = request.getParameter("confirmNum");
					
					Map<String, Object> mv = new HashMap<String, Object>();
					
					System.out.println("confirmNum : "+confirmNum);			// user가 입력한 인증 번호
					if(confirmNum.equals(request.getSession().getAttribute("confirmNum"))) {
						System.out.println(" 인증완료");
						mv.put("result","success");
					}else {
						System.out.println(" 인증번호 안맞음");
						mv.put("result","fail");
					}
					return mv;
				}
				
				/**
				 *   email 인증
				 * @param email
				 * @param authNum
				 * @throws UnsupportedEncodingException
				 */
				private void sendEmail(String email, String authNum) throws UnsupportedEncodingException {
					 	String host = "smtp.gmail.com";
						String subject = "나들이 이메일 인증번호";
						String fromName="나들이 관리자";
						String from="kimjh2218@gmail.com";
						String password = "top0347923";
						
						String content= "인증번호 ["+ authNum +"]";
						
						try {
							Properties props = new Properties();
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
							message.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));
							System.out.println("message!!" + message);
							InternetAddress[] address = {new InternetAddress(email,authNum)};
							System.out.println("address1" + address);
							message.setRecipients(Message.RecipientType.TO,
									address);
							message.setSentDate(new java.util.Date());
							message.setSubject(subject);
							message.setContent(content,"text/html; charset=UTF-8");
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
=======

	@RequestMapping(value="/addUser", method= RequestMethod.GET  )
	public String addUser(HttpServletRequest request, Map map) throws Exception{
		
		System.out.println("회원가입");
		System.out.println("데이터"+params);		
		if(request.getParameter("facebookId") != null) {
		
			String fbId = request.getParameter("facebookId");		
			System.out.println("페이스북 아이디 : "+fbId);
			map.put("facebookId" , fbId );

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
	@RequestMapping(value="addUserFacebook" )
	public String addUserFacebook(HttpServletRequest request, Model model, HttpSession session
		,@ModelAttribute User params 
		) throws Exception{
		
		System.out.println("facebook회원가입");
		
		//String str = URLDecoder.decode(params, "UTF-8");
		
		String email = request.getParameter("email");
		
		System.out.println("데이터"+params);		
		System.out.println("페이스북 이메일"+email);	
		
		model.addAttribute("email" , email );
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
	
	
	@RequestMapping(value="addUserKakao", method = RequestMethod.GET)
	public String view (HttpServletRequest request, HttpSession seeion) throws Exception{
		System.out.println("kakao 회원가입");
		
		return "forward:/user/addUserKakao.jsp";
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
	
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String faindId(@ModelAttribute("userId") String userId) throws Exception{
		System.out.println("아이디 찾기");
		return "forward:/user/findUser.jsp";
	}
	
	/**
	 * 
	 * @param user
	 * @param model
	 * @return
	 * @throws Exception
	 */
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
	public String addUserPlus( @ModelAttribute("user")User user, HttpSession session) throws Exception{

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
	

		//	@RequestParam("userId") String userId , Model model 
	public String getUser( @RequestParam("userId") String userId , Map map, User user) throws Exception {
		System.out.println("/user/getUser : GET");
/*		//Business Logic
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		*/
		
		map.put("user", user);
		return "forward:/user/getUser.jsp";
	}
	
}