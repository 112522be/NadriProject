package com.yagn.nadrii.web.user;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		//setter Method ���� ����
			
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
	     * ����������
	     * @return
	     * @throws Exception
	     */
		@RequestMapping(value="/main")
		public String main()throws Exception{
			System.out.println("����������!!");
			return "redirect:/index.jsp";
		}


	// �̸���
	@SuppressWarnings("unused")
	private void sendEmail(String email, String authNum) {

		String setfrom = "kimjh2218@gmail.com";
		String tomail = email;
		String title = "������ ������";
		String content = "�̸��� ������ȣ�� " +authNum+ "�Դϴ�.";
		
		
		
		
		
		///////////////////   
		Properties props = new Properties(); 
        props.put("mail.smtp.user",username); 
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "465"); 
        props.put("mail.debug", "true"); 
        props.put("mail.smtp.from", title);
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
            + "\n\n No spam to my email, please!");//���� 
            message.setContent("����","text/html; charset=utf-8");//�۳����� htmlŸ�� charset����
            System.out.println("send!!!");
            //Transport.send(message);
//            this.MailSender.send(message);
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
	
	
	/*
	@RequestMapping(value="/emailAuth", method = RequestMethod.POST)
	@ResponseBody	//		ajax �ް� �ѱ涧, ���� ������ �����Ҷ� ResponseBody
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
	 *  login ������
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() throws Exception {
		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping(value="/loginProc", method=RequestMethod.POST)
	@ResponseBody
	public Object loginProc( User user, HttpServletRequest request) throws Exception{
		
		boolean isAdmin = false;
		
		User loginUser = userService.loginProc(user);
		
		Map<String,String> map =new HashMap<String, String>();
		
		if(loginUser == null) {
			map.put("msg", "failed");
			return map;
		}
		
		request.getSession().setAttribute("loginUser", loginUser );
		map.put("msg", "success");
		
		if(loginUser.getRole().equals("admin")) {
			System.out.println("������ �α���");
			isAdmin = true;
			request.getSession().setAttribute("isAdmin",  isAdmin);
		}else if(loginUser.getRole().equals("user")) {
			System.out.println("�Ϲ� �α���");
			isAdmin = false;
			request.getSession().setAttribute("isAdmin",  isAdmin);
		}
		
		return map;
	}
	
	/**
	 * ȸ������ ������
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addUser", method= RequestMethod.GET  )
	public String addUser(HttpServletRequest request, Model model) throws Exception {

		System.out.println("ȸ������");

		if (request.getParameter("facebookId") != null) {
			String fbId = request.getParameter("facebookId");
			System.out.println("���̽��� ���̵� : " + fbId);
			model.addAttribute("facebookId", fbId);
		}
		return "redirect:/user/addUserView.jsp";
	}
	
	/**
	 * ȸ������
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="addUser", method= RequestMethod.POST  )
	@ResponseBody
	public Object addUser(User user) throws Exception{
		//ȸ������
		userService.addUser(user);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "success");
		return map;
	}
	
	@RequestMapping(value="/logoutProc", method=RequestMethod.GET)
	public String logoutProc(HttpServletRequest request, HttpSession session) throws Exception{
	    request.getSession().removeAttribute("loginUser");
		session.invalidate();
	   
		System.out.println("�α׾ƿ� : " + request.getSession().getAttribute("loginUser"));
		
		return "redirect:/index.jsp";
	}
	
	/**
	 * ���̵� �ߺ�üũ
	 * @param userId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "checkId", method=RequestMethod.POST)
	@ResponseBody
    public Object idCheck(String userId, Model model) throws Exception {

		System.out.println("[check]");
		
		Map<String, String> map = new HashMap<String, String>();
		int check = userService.checkId(userId);

		map.put("check", String.valueOf(check));
		return map;
    }
	
	/**
	 *  ���̵� ã��
	 * @param userName
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findIdPg", method=RequestMethod.GET)
	public String faindIdPg() throws Exception{
		System.out.println("���̵� ã��");
		return "redirect:/user/findIdUser.jsp";
	}
	
	@RequestMapping(value="findId", method=RequestMethod.POST)
	@ResponseBody
	public Object findId(@RequestParam("userId") String userId, HttpServletResponse responsel) throws Exception{
		System.out.println("���̵� ã��" + userId);
		
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(map.toString());
		System.out.println(map.get(0));
		String findEmail = "{\"user_email\":\""+map+"\"}";

		System.out.println(findEmail);
		
		return findEmail;
	}
	
	@RequestMapping(value="findPasswordPg", method=RequestMethod.GET)
	public String findPassword(User user, Model model) throws Exception{
		System.out.println("��й�ȣ ã��");
		return "redirect:/user/findPasswordUser.jsp";
	}
	

}