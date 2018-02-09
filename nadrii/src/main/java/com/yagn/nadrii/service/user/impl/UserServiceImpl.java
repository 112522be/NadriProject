package com.yagn.nadrii.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.user.UserDao;
import com.yagn.nadrii.service.user.UserService;



//==> ȸ������ ���� ����
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
	public User loginCheck(User user) throws Exception {
		return userDao.loginCheck(user);
	}

	public String findId(String user) throws Exception {

		return userDao.findId(user);
	}

	public String findPassword(String user) throws Exception {
		
		return userDao.findPassword(user);
	}
	
	public void addUserPlus(User user) throws Exception{
		System.out.println();
		userDao.addUserPlus(user);
	}
	
	////////////////////////////////////////////////////////////////////
	/*
	private static final Logger logger = LoggerFactory.getLogger(EmailPublisherService.class);
    @Autowired
    private JavaMailSender javaMailSender;

    public <T> boolean publish(T report) {
        logger.debug("Sending report by email...");
        boolean retVal = false;
        try {
            final String emailTo = "to@test.co.kr";
            final String emailFrom = "from@test.co.kr";
            final String subject = "test subject";
            final String message = (String) report;

            javaMailSender.send(new MimeMessagePreparator() {

                @Override
                public void prepare(MimeMessage paramMimeMessage) throws Exception {
                    MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(paramMimeMessage, true, "UTF-8");

                    mimeMessageHelper.setTo(emailTo);
                    mimeMessageHelper.setFrom(emailFrom);
                    mimeMessageHelper.setSubject(subject);
                    mimeMessageHelper.setText(message);

                    final File file = new File("test filename");

                    mimeMessageHelper.addAttachment(MimeUtility.encodeText("filename"), new InputStreamSource() {

                        @Override
                        public InputStream getInputStream() throws IOException {
                            // TODO Auto-generated method stub
                            return new FileInputStream(file);
                        }
                    });

                };
            });

            retVal = true;
        } catch (Exception e) {
            logger.error("Can't send email... " + e.getMessage(), e);
        }
        return retVal;
    }	
	*/		  
}