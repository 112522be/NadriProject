package com.yagn.nadrii.service.group;

import java.util.ArrayList;
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
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.join.JoinService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {	"classpath:config/context-common.xml",
															"classpath:config/context-aspect.xml",
															"classpath:config/context-mybatis.xml",
															"classpath:config/context-transaction.xml" })
public class GroupServiceTest {

	//==>@RunWith,@ContextConfiguration 占싱울옙 Wiring, Test 占쏙옙 instance DI
	@Autowired
	@Qualifier("groupServiceImpl")
	private GroupService groupService;
	
	@Autowired
	@Qualifier("joinServiceImpl")
	private JoinService joinService;

	//@Test
	public void testAddGroup() throws Exception {
		
		Group group = new Group();
		Join join = new Join();
		
		group.setGroupName("모임3");
		group.setTitle("제목3");
		group.setText("내용3");
		group.setCategoryCode("a");
		
		int groupNo = groupService.addGroup(group);

		System.out.println("groupNo : "+groupNo);

		join.setGroupNo(groupNo);
		join.setGroupRole(1);
		join.setUserId("test01");
		
		group.setJoin(join);
		
		joinService.addJoin(join);
		
		System.out.println(group);
		
	}
	
	//@Test
	public void testGetGroup() throws Exception {
		
		Group group = new Group();
		Join join = new Join();
	
		group = groupService.getGroup(60033);
		
		System.out.println(group);
		
	}
	
	//@Test
	public void testUpdateGroup() throws Exception{
		 
		Group group = groupService.getGroup(10120);
		Assert.assertNotNull(group);
		
	//	Assert.assertEquals("testGroupName", group.getGroupName());
	//	Assert.assertEquals("111-2222-3333", group.getPhone());
	//	Assert.assertEquals("占쏙옙竪�", group.getAddr());
	//	Assert.assertEquals("test@test.com", group.getEmail());

	//	group.setProdName("占쏙옙占쏙옙占쏙옙占�change");
	//	group.setPrice(1700);
		
		groupService.updateGroup(group);
		
		group = groupService.getGroup(10120);
	//	Assert.assertNotNull(group);
		
		//==> console 확占쏙옙
		System.out.println(group);
			
		//==> API 확占쏙옙
	//	Assert.assertEquals("change", group.getGroupName());
	//	Assert.assertEquals("777-7777-7777", group.getPhone());
	//	Assert.assertEquals("change", group.getAddr());
	//	Assert.assertEquals("change@change.com", group.getEmail());
	 }
	 
	 //==>  占쌍쇽옙占쏙옙 풀占쏙옙 占쏙옙占쏙옙占싹몌옙....
	//@Test
	public void testGetGroupListAll() throws Exception{
		 
		Search search = new Search();
		search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = groupService.getGroupList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확占쏙옙
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
	 	
	 	//==> console 확占쏙옙
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
	 	
		//==> console 확占쏙옙
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
	 	
		//==> console 확占쏙옙
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
	 	search.setSearchKeyword("占쏙옙占쏙옙");
	 	Map<String,Object> map = groupService.getGroupList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확占쏙옙
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = groupService.getGroupList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확占쏙옙
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
	 	
		//==> console 확占쏙옙
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
	 	
	 	//==> console 확占쏙옙
	 	System.out.println(list);
		 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	
	
}