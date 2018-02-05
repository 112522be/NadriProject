package com.yagn.nadrii.service.comment;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yagn.nadrii.service.common.CommentService;
import com.yagn.nadrii.service.domain.Comments;


/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class CommentServiceTest{
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	private Comments comment;

	//@Test
	public void testAddUser() throws Exception {
		comment = new Comments();
		comment.setPostNo(30003);
		comment.setText("감사합니다~");
		comment.setUserId("test01");
//		List<Comments> listComment = commentService.addComment(comment);
//		System.out.println(listComment);
	}
	
	@Test
	public void testGetUser() throws Exception {
		List<Comments> comm = commentService.listCommentById("test01");
		System.out.println(comm);
		
	}
	
	//@Test
	 public void testUpdateUser() throws Exception{
		Comments com = new Comments();
		com.setCommentNo(10011);
		com.setText("감사합니다~!");
		
		commentService.updateComment(com);
		
		Map<String, Object> comments = commentService.listCommentByPost(30003);
		System.out.println(comments.get("totalCount")+" , "+comments.get("listComment"));
		
	 }
	 
	 //==>  주석을 풀고 실행하면....
	 //@Test
	 public void testGetUserListAll() throws Exception{
		 Map<String, Object> comments = commentService.listCommentByPost(30003);
		 
		 System.out.println(comments.get("totalCount")+" , "+comments.get("listComment"));
	 }
	 
	 //@Test
	 public void testGetUserListByUserId() throws Exception{
		 
	 }
	 
	 //@Test
	 public void testGetUserListByUserName() throws Exception{
		 
	 }	 

}