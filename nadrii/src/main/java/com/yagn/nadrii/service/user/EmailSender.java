package com.yagn.nadrii.service.user;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import com.yagn.nadrii.service.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
 
public class EmailSender  {
 
    @Autowired
    private JavaMailSender mailSender;
 
     
    public void SendEmail(User user) throws Exception {
        System.out.println(user);
        MimeMessage msg = mailSender.createMimeMessage();
        try {
             
            msg.setSubject(user.getSubject());
            msg.setText(user.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(user.getReceiver()));
            mailSender.send(msg);
             
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
 
    }
}