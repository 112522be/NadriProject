package com.yagn.nadrii.service.ticket.test;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.DetailImage;
import com.yagn.nadrii.service.domain.DetailIntro;
import com.yagn.nadrii.service.domain.TourTicket;
import com.yagn.nadrii.service.ticket.TicketDao;
import com.yagn.nadrii.service.ticket.TicketService;
import com.yagn.nadrii.service.ticket.impl.NaverApiDaoImpl;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", 
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml", 
										"classpath:config/context-transaction.xml" })
public class TicketServiceTest {

	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;

	@Test
	public void testGetTicketListAll() throws Exception {

		OpenApiSearch openApiSearch = new OpenApiSearch();
		openApiSearch.setPageNo(4);
		openApiSearch.setNumOfRows(10);
		
		Map<String, Object> map = ticketService.getTicketList(openApiSearch);
		
//		System.out.println("\n[tourTicketList 값 확인] ==> " + map.get("tourTicketList"));

	}
	 
	//@Test
	public void testGetTicket() throws Exception {

//		int contentId = 790124;
//		int contentTypeId = 15;
		int contentId = 2531711;
		int contentTypeId = 15;
		
		DetailIntro detailIntro = new DetailIntro(); 
		detailIntro = ticketService.getTicket(contentId, contentTypeId);
		
		// ==> console 확인
		System.out.println("[testGetTicket] : " + detailIntro);

		// ==> API 확인
		Assert.assertEquals(2531711, detailIntro.getContentid());
		Assert.assertEquals(15, detailIntro.getContenttypeid());
//		Assert.assertEquals("강원도 홍천 도시산림공원 토리숲", detailIntro.getEventplace());
//		Assert.assertEquals("일부 프로그램 유료", detailIntro.getUsetimefestival());

	}
	
	//@Test
	public void testGetDetailImage() throws Exception {

		int contentId = 1815964;		// 컨텐츠 ID :	
//		int contentId = 737479;			// 컨텐츠 ID	:
//		int contentId = 2531711;		// 컨텐츠 ID	:

		DetailImage detailImage = new DetailImage();
		detailImage = ticketService.getDetailImage(contentId);

		// ==> console 확인
		System.out.println("[testGetDetailImage] : " + detailImage);

		// ==> API 확인
//		Assert.assertEquals(null, detailImage.getContentid());
	
	}
	
	//@Test
	public void testGetNaverImage() throws Exception {

//		String title = "강릉 대기리마을겨울축제 2018";			
		String title = "가평펜션축제 2018";			
//		String clientID = "hC9Dwk1KGJiiTZ79onoy";
//		String clientSecret = "cLODYnjh2Y";

		String returnImage = ticketService.getNaverImage(title);

		// ==> console 확인
//		System.out.println("[testGetNaverImage] : " + returnImage);

		// ==> API 확인
//		Assert.assertEquals(null, detailImage.getContentid());
	
	}
	
	//@Test
	public void testGetKakaoImage() throws Exception {

		
//		String title = "고종명성후 가례 재현행사 (상반기)";			
//		String title = "강릉 대기리마을겨울축제 2018";			
		String title = "가평펜션축제 2018";			
//		String clientID = "hC9Dwk1KGJiiTZ79onoy";
//		String clientSecret = "cLODYnjh2Y";

		String encodeTitle = URLEncoder.encode(title, "UTF-8");
		
		
		String returnImage = ticketService.getKakaoImage(title);

		// ==> console 확인
//		System.out.println("[testGetNaverImage] : " + returnImage);

		// ==> API 확인
//		Assert.assertEquals(null, detailImage.getContentid());
	
	}
	 
} // end of class