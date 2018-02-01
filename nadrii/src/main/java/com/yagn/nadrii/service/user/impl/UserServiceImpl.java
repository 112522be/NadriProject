package com.yagn.nadrii.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.user.UserDao;
import com.yagn.nadrii.service.user.UserService;



//==> È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}

	public Map<String , Object > getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userDao.getUser(userId);
		if(user != null) {
			result=false;
		}
		
		
		return result;
	}
	
	@Override
	public int checkId(String user) throws Exception {
		System.out.println("service "+user);
		return userDao.checkId(user);
	}

	@Override
	public User loginProc(User user) throws Exception {
		
		return userDao.loginProc(user);
	}

	public String findId(String user) throws Exception {

		return userDao.findId(user);
	}

	public String findPassword(String user) throws Exception {
		
		return userDao.findPassword(user);
	}
	
	/*
	 final String username="kimjh2218@gmail.com";
	    final String password="god2218923";
	// ÀÌ¸ÞÀÏ
		private void sendEmail(String email, String authNum) {

			String setfrom = "kimjh2218@gmail.com";
			String tomail = email;
			String title = "³ªµéÀÌ °ü¸®ÀÚ";
			String content = "ÀÌ¸ÞÀÏ ÀÎÁõ¹øÈ£´Â " +authNum+ "ÀÔ´Ï´Ù.";
			
			
			
			
			
			///////////////////   
			try {
			Properties props = new Properties(); 
	        props.put("mail.smtp.user",username); 
	        props.put("mail.smtp.password", password);
	        props.put("mail.smtp.host", "smtp.gmail.com"); 
	        props.put("mail.smtp.port", "465"); 
	        props.put("mail.smtp.from", title);
	        props.put("mail.debug", "true"); 
	        props.put("mail.smtp.auth", "true"); 
	        props.put("mail.smtp.starttls.enable","true"); 
	        props.put("mail.smtp.EnableSSL.enable","true");
	        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
	        props.setProperty("mail.smtp.socketFactory.fallback", "false");   
//	        props.setProperty("mail.smtp.port", "587");   
//	        props.setProperty("mail.smtp.socketFactory.port", "587"); 
	    
	        Session session = Session.getInstance(props, 
	         new javax.mail.Authenticator() { 
	        protected PasswordAuthentication getPasswordAuthentication() { 
	        return new PasswordAuthentication(username, password); 
	        }});
	        System.out.println("??");
	        
	            Message message = new MimeMessage(session); 
	            message.setFrom(new InternetAddress("kimjh2218@gmail.com"));// 
	            message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(email)); 
	            message.setSubject("Testing Subject");
	            message.setText("Dear Mail Crawler," 
	            + "\n\n No spam to my email, please!");//³»¿ë 
	            message.setContent("³»¿ë","text/html; charset=utf-8");//±Û³»¿ëÀ» htmlÅ¸ÀÔ charset¼³Á¤
	            System.out.println("send!!!");
	            Transport.send(message); 
	            System.out.println("SEND");
	            
	        } catch(MessagingException e){
	            e.printStackTrace();
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	      ////////////////////////////////////////////////////////       
	        */
	        
	        
			
			  
}