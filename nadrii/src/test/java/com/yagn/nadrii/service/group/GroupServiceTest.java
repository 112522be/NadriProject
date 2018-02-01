package com.yagn.nadrii.service.group;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Group;

/*
 *	FileName :  GroupServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {	"classpath:config/context-common.xml",
															"classpath:config/context-aspect.xml",
															"classpath:config/context-mybatis.xml",
															"classpath:config/context-transaction.xml" })
public class GroupServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;

	@Test
	public void testAddGroup() throws Exception {
		
		Group group = new Group();
		
		group.setGroupName("식도락모임");
		group.setTitle("1");
		group.setText("냠냠");
		group.setCategoryCode("a");
		
		groupService.addGroup(group);
		
	//	group = groupService.getGroup(10080);

		//==> console 확인
		System.out.println(group);
		
		//==> API 확인
	//	Assert.assertEquals("testGroupId", group.getGroupId());
	//	Assert.assertEquals("testGroupName", group.getGroupName());
	//	Assert.assertEquals("testPasswd", group.getPassword());
		//Assert.assertEquals("111-2222-3333", group.getPhone());
		//Assert.assertEquals("경기도", group.getAddr());
		//Assert.assertEquals("test@test.com", group.getEmail());
	}
	
	//@Test
	public void testGetGroup() throws Exception {
		
		Group group = new Group();
		//==> 필요하다면...
	//	group.setGroupId("testGroupId");
	//	group.setGroupName("testGroupName");
//		group.setPassword("testPasswd");
//		group.setSsn("1111112222222");
//		group.setPhone("111-2222-3333");
//		group.setAddr("경기도");
//		group.setEmail("test@test.com");
		
		group = groupService.getGroup(10120);

		//==> console 확인
		System.out.println(group);
		
		//==> API 확인
	//	Assert.assertEquals("testGroupId", group.getGroupId());
	//	Assert.assertEquals("testGroupName", group.getGroupName());
	//	Assert.assertEquals("testPasswd", group.getPassword());
	//	Assert.assertEquals("111-2222-3333", group.getPhone());
	//	Assert.assertEquals("경기도", group.getAddr());
	//	Assert.assertEquals("test@test.com", group.getEmail());

	//	Assert.assertNotNull(groupService.getGroup("group02"));
	//	Assert.assertNotNull(groupService.getGroup("group05"));
	}
	
	//@Test
	public void testUpdateGroup() throws Exception{
		 
		Group group = groupService.getGroup(10120);
		Assert.assertNotNull(group);
		
	//	Assert.assertEquals("testGroupName", group.getGroupName());
	//	Assert.assertEquals("111-2222-3333", group.getPhone());
	//	Assert.assertEquals("경기도", group.getAddr());
	//	Assert.assertEquals("test@test.com", group.getEmail());

	//	group.setProdName("레몬워터change");
	//	group.setPrice(1700);
		
		groupService.updateGroup(group);
		
		group = groupService.getGroup(10120);
	//	Assert.assertNotNull(group);
		
		//==> console 확인
		System.out.println(group);
			
		//==> API 확인
	//	Assert.assertEquals("change", group.getGroupName());
	//	Assert.assertEquals("777-7777-7777", group.getPhone());
	//	Assert.assertEquals("change", group.getAddr());
	//	Assert.assertEquals("change@change.com", group.getEmail());
	 }
	 
	 //==>  주석을 풀고 실행하면....
	//@Test
	public void testGetGroupListAll() throws Exception{
		 
		Search search = new Search();
		search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = groupService.getGroupList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = groupService.getGroupList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	//@Test
	public void testGetGroupListByProdNo() throws Exception{
		 
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
	 	search.setSearchKeyword("10120");
	 	Map<String,Object> map = groupService.getGroupList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	//Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	// 	System.out.println(System.currentTimeMillis());
	 	map = groupService.getGroupList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	//Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetGroupListByGroupName() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("레몬");
	 	Map<String,Object> map = groupService.getGroupList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = groupService.getGroupList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 
	 
	//@Test
	 public void testGetGroupListByTranCode() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = groupService.getGroupList(search);
		 	
	 	List<Object> list = (List<Object>)map.get("list");
	 //	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = groupService.getGroupList(search);
	 	
	 	list = (List<Object>)map.get("list");
	// 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
		 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	
	
}