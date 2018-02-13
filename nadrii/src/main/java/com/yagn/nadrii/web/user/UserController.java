package com.yagn.nadrii.web.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;

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


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	private JavaMailSender mailSender;

		
		public UserController(){
			System.out.println(this.getClass());
		}
		
		@RequestMapping(value="/addUser", method= RequestMethod.POST  )
		public String addUser(User user) throws Exception{

			System.out.println("userId==" +user.getUserId());
			
			userService.addUser(user);
			Map map = new HashMap();
		
			return "redirect:/user/addUser.jsp";
		}
		

		

		//facebook 
	    final String username="kimjh2218@gmail.com";
	    final String password="god2218923";
	
	    /**
	     * ����������
	     * @return
	     * @throws Exception
	     */
		@RequestMapping(value="/main")
		public String main()throws Exception{
			System.out.println("����������!!");
			return "redirect:/index.jsp";
		}

		

		
		@RequestMapping(value="check", method=RequestMethod.POST)
		@ResponseBody
		//public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
		public Map<String,Object> emailAuth(HttpServletResponse response, HttpServletRequest request, HttpSession session)throws Exception{	
			String email = request.getParameter("email");
			String authNum= "";
			
			authNum = randomNum();							//���� ������ȣ
			System.out.println("authNum : "+authNum);
			User user = new User();
			user.setCheckSuccess(authNum);
				System.out.println("email : "+email);
			sendEmail(email.toString(), authNum);			//���Ϲ߼�
			request.getSession().setAttribute("confirmNum", authNum);
			Map<String, Object> mv = new HashMap<String, Object>();
			mv.put("email",email);
			mv.put("authNum",authNum);
			return mv;
		}
		
		
		@RequestMapping(value="checkSuccess", method=RequestMethod.POST)
		@ResponseBody
		//public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
		public Map<String,Object> checkSuccess(HttpServletResponse response, HttpServletRequest request)throws Exception{	
			String confirmNum = request.getParameter("confirmNum");
			
			Map<String, Object> mv = new HashMap<String, Object>();
			
			System.out.println("confirmNum : "+confirmNum);			// user�� �Է��� ���� ��ȣ
//			System.out.println("user.getCheckSuccess() : "+user.getCheckSuccess());
//			if(confirmNum.equals(user.getCheckSuccess())) {	
			if(confirmNum.equals(request.getSession().getAttribute("confirmNum"))) {
				System.out.println("체크 성공");
				mv.put("result","success");
			}else {
				System.out.println("체크 실패");
				mv.put("result","fail");
			}
			return mv;
		}

		
		private void sendEmail(String email, String authNum) throws UnsupportedEncodingException {
		
				String host = "smtp.gmail.com";
				String subject = "������ �̸��� ������ȣ";
				String fromName="������ ������";
				String from="kimjh2218@gmail.com";
				String password = "top0347923";

				
				String content= "������ȣ ["+ authNum +"]";
				
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
					System.out.println("����"+content);
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
	 *  login ������
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() throws Exception {
		System.out.println("�α��� ������");
		return "redirect:/user/loginView.jsp";
	}
		
	
	@RequestMapping(value="/oauth", produces = "application/json", method= {RequestMethod.GET,RequestMethod.POST})
	public void kakaologin(@RequestParam("code") HttpServletRequest request, HttpServletResponse httpServlet) throws Exception{	
		
		final String AUTH_HOST = "https://kauth.kakao.com";
	    final String tokenRequestUrl = AUTH_HOST + "/oauth/token";

	    String CLIENT_ID = "[REST API Key]"; 
	    String REDIRECT_URI = "[Redirect uri]"; 
	    String code = "[Authorized code]"; 
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
	 * ȸ������ ������
	 * @return
	 * @throws Exception
	 */

	
	@RequestMapping(value="addUser", method=RequestMethod.GET  )
	public String addUser(HttpServletRequest request, @ModelAttribute User params ) throws Exception{
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
		
		System.out.println("facebookȸ������");
		
		
		System.out.println("������"+params);		
		
		if(request.getParameter("facebookId") != null) {
			String fbId = request.getParameter("facebookId");		
			System.out.println("���̽��� ���̵� : "+fbId);
			model.addAttribute("facebookId" , fbId );
			}
	
		return "forward:/user/addUserFacebook.jsp";
	}
	
	
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public String view (HttpServletRequest request, HttpSession seeion) throws Exception{
		System.out.println("īī�� �ҿ���");
		
		return "forward:/user/listUser.jsp";
	}

	
	
	
	
	@RequestMapping(value="/logoutProc", method=RequestMethod.GET)
	public String logoutProc(HttpServletRequest request, Model model, HttpSession session) throws Exception{
	    request.getSession().removeAttribute("loginUser");
		session.invalidate();
	   
		System.out.println("�α׾ƿ� : " + request.getSession().getAttribute("loginUser"));
		
		return "redirect:/index.jsp";
	}
	
	
	
	@RequestMapping(value="findIdPg", method=RequestMethod.GET)
	public String faindIdPg() throws Exception{
		System.out.println("���̵� ã�� ������");
		return "forward:/user/findIdUser.jsp";
	}
	
	@RequestMapping(value="findPasswordPg", method=RequestMethod.GET)
	public String findPassword(User user, Model model) throws Exception{
		System.out.println("��й�ȣ ã��");
		return "forward:/user/findPasswordUser.jsp";
	}
	
	/**
	 * 	�߰����� ������ �̵�
	 * @param userId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addUserPlus", method=RequestMethod.GET)
	public String addUserPlus(String userId, Model model) throws Exception{
		System.out.println("�߰����� �Է� ������");
		return "forward:/user/addUserViewPlus.jsp";
	}

	@RequestMapping(value="addUserPlus", method=RequestMethod.POST)
	public String addUserPlus( @ModelAttribute("user")User user, HttpSession session) throws Exception{

		System.out.println("addUserPlus :: POST");
		
		System.out.println("\n[1] ==>" + user);
		
		System.out.println("���� ���� >>" + user.getbirth());
		System.out.println("������ >>" + user.getprofileimageFile());
		System.out.println("�ڵ��� ��ȣ >>" + user.getPhone());
		System.out.println("����� �̸� >>" + user.getUserName());
		System.out.println("�ڳ�� >>" + user.getchildren());
		System.out.println("�� �� >>" +user.getgender());

		user.setUserId( ((User) session.getAttribute("loginUser")).getUserId());
		
		System.out.println(user);
		
		if(user.getgender() == null) {
			user.setGender("");
		}
		
		userService.addUserPlus(user);
		

		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	

 
	public String getUser( @RequestParam("userId") String userId , Map map, User user) throws Exception {
		System.out.println("/user/getUser : GET");
		
		map.put("user", user);
		return "forward:/user/getUser.jsp";
	}
	
	
	
} 