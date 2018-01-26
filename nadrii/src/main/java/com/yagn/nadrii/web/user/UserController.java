package com.yagn.nadrii.web.user;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
//	@Autowired
//	JavaMailSender mailSender;
//	boolean result;
	
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

	// 이메일
	private void sendEmail(String email, String authNum) {

		String setfrom = "kimjh2218@gmail.com";
		String tomail = email;
		String title = "나들이 관리자";
		String content = "이메일 인증번호는 " +authNum+ "입니다.";
		
		
		
		
		
		///////////////////   
		Properties props = new Properties(); 
        props.put("mail.smtp.user",username); 
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "465"); 
        props.put("mail.debug", "true"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.starttls.enable","true"); 
        props.put("mail.smtp.EnableSSL.enable","true");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
        props.setProperty("mail.smtp.socketFactory.fallback", "false");   
//        props.setProperty("mail.smtp.port", "587");   
//        props.setProperty("mail.smtp.socketFactory.port", "587"); 
    
        Session session = Session.getInstance(props, 
         new javax.mail.Authenticator() { 
        protected PasswordAuthentication getPasswordAuthentication() { 
        return new PasswordAuthentication(username, password); 
        }});
        System.out.println("??");
        try{
            Message message = new MimeMessage(session); 
            message.setFrom(new InternetAddress("kimjh2218@gmail.com"));// 
            message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(email)); 
            message.setSubject("Testing Subject");
            message.setText("Dear Mail Crawler," 
            + "\n\n No spam to my email, please!");//내용 
            message.setContent("내용","text/html; charset=utf-8");//글내용을 html타입 charset설정
            System.out.println("send!!!");
            Transport.send(message); 
            System.out.println("SEND");
            
        } catch(Exception e){
            e.printStackTrace();
        }
      ////////////////////////////////////////////////////////       
        
        
        
        
        
    }    

	
	public String randomNum() {
	StringBuffer buffer = new StringBuffer();
	for(int i = 0; i <= 6; i++) {
		int n = (int) (Math.random() *10);
		buffer.append(n);
	}
	return buffer.toString(); 
	}
	
	
	
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
	
	@RequestMapping(value = "checkId", method=RequestMethod.POST)
	@ResponseBody
    public Object idCheck(String userId, Model model) throws Exception {

		
		Map<String, String> map = new HashMap<String, String>();
		int check = userService.checkId(userId);

		map.put("check", String.valueOf(check));
		return map;
    }
	
	@RequestMapping(value="/addUser", method= RequestMethod.GET  )
	public String addUser(User user) throws Exception{
		System.out.println(user.getUserId());
		return "forward:/user/addUserView.jsp";
	}
	
}