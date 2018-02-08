package com.yagn.nadrii.web.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yagn.nadrii.service.domain.Message;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.message.MessageService;



@Controller
@RequestMapping("/message/*")
public class MessageController {
	
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageService;

	public MessageController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/addMessage", method=RequestMethod.GET)
	public String addMessage(HttpSession session, HttpServletRequest request,@RequestParam("recevierId") String receiverId,Map map)throws Exception {
		
		
		System.out.println(this.getClass()+"/message/addMessage/");
		System.out.println(receiverId);
		
		User sender = (User)session.getAttribute("loginUser");
		Message message = new Message();
		message.setSenderId(sender.getUserId());
		message.setReceiverId(receiverId);
		map.put("message", message);
		
		
		return "../message/addMessageView.jsp";
	}
	
	
	
	//새롭게 열린 윈도우에서 작성한 메시지를 실제로 전송하는 것에 대응하는 메소드
	@RequestMapping(value="/addMessage", method=RequestMethod.POST)
	public String addMessage(Message message,Map map)throws Exception {
		System.out.println(this.getClass()+"/message/addMessage/");
		messageService.addMessage(message);
		
		
		map.put("message", message);
		
		return "../message/addMessage.jsp";
	}
	
	
	@RequestMapping("/getMessage/")
	public String getMessage(@RequestParam("messageNo") int messageNo,Map map)throws Exception {
		System.out.println(this.getClass()+"/message/addMessage/");
		Message message = messageService.getMessage(messageNo);
		this.updateReadFlag(messageNo);
		
		map.put("message", message);
		return "../message/getMessage.jsp";
	}
	
	
	@RequestMapping("/listMessage/")
	public String listMessage(@RequestParam("listType")String listType, HttpSession session, HttpServletRequest request, Map map) throws Exception{
		System.out.println(this.getClass()+"  listMessage");
		
		session= request.getSession(true);
		User user = (User)session.getAttribute("loginUser");
		
		System.out.println(user);
		System.out.println(listType);
		
		List list = messageService.listMessage(user.getUserId());
		
		map.put("listType", listType);
		map.put("list", list);
		
		return "../message/listMessage.jsp";
	}
	
	//레스트로 이동??
	private void updateReadFlag(int messageNo) throws Exception{
		System.out.println(this.getClass()+"  updateReadFlag");
		
		messageService.updateReadFlag(messageNo);		
	}
	
	@RequestMapping("/listMessageToRead/")
	public String listMessageToRead(@RequestParam("listType")String listType,HttpSession session, HttpServletRequest request,Map map) throws Exception{
		System.out.println(this.getClass()+"  listMessageToRead");
		
		session= request.getSession(true);
		User user = (User)session.getAttribute("loginUser");
		
		System.out.println(user);
		System.out.println(listType);
		
		List list = messageService.listMessageToRead(user.getUserId());
		
		map.put("listType", listType);
		map.put("list",list);
		
		return "../message/listMessage.jsp";
	}
	
	@RequestMapping("/listSendMessage/")
	public String listSendMessage(@RequestParam("listType")String listType,HttpSession session, HttpServletRequest request,Map map) throws Exception{
		System.out.println(this.getClass()+"  listSendMessage");
		
		session= request.getSession(true);
		User user = (User)session.getAttribute("loginUser");
		
		System.out.println(user);
		System.out.println(listType);
		
		List list = messageService.listSendMessage(user.getUserId());
		
		map.put("listType", listType);
		map.put("list",list);
	
		return "../message/listMessage.jsp";
	}
	
	@RequestMapping("/deleteMessage/")
	public String deleteMessage(int messageNo) throws Exception{
		System.out.println(this.getClass()+"  deleteMessage");
		
		messageService.deleteMessage(messageNo);
		return "../message/deleteMessage.jsp";
	}
	
}
