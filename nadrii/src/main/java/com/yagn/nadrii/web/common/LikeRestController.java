package com.yagn.nadrii.web.common;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Like;
import com.yagn.nadrii.service.domain.User;
import com.yagn.nadrii.service.like.LikeService;

@RestController
@RequestMapping("/like/*")
public class LikeRestController {
	
	///Field
	@Autowired
	@Qualifier("likeServiceImpl")
	private LikeService likeService;
		
	public LikeRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/addLike/{postNo}", method=RequestMethod.POST)
	public Like addPostLike(@PathVariable int postNo, HttpSession session) throws Exception {

		System.out.println("/like/json/addLike");
		
		Like like = new Like();
		
		like.setPostNo(postNo);
		like.setUserId(((User)session.getAttribute("loginUser")).getUserId());
				
		likeService.addLike(like);
		
		return like;
	}
	
	@RequestMapping(value="json/deleteLike/{postNo}", method=RequestMethod.POST)
	public Like deleteLike(@PathVariable int postNo, HttpSession session) throws Exception {

		System.out.println("/like/json/deleteLike");
		
		Like like = new Like();
		
		like.setPostNo(postNo);
		like.setUserId(((User)session.getAttribute("loginUser")).getUserId());
				
		likeService.deleteLike(like);
		
		return like;
	}
	
	@RequestMapping(value="json/listLikeById")
	public Map listLikeById(HttpSession session) throws Exception{
		
		System.out.println("json/listLikeById");

		Search search = new Search();
		
		search.setSearchKeyword(((User)session.getAttribute("loginUser")).getUserId());
		
		Map<String , Object> map=likeService.listLikeById(search);
		
		return map;
	}
	
	@RequestMapping(value="json/listLikeByPost/{postNo}")
	public Map listLikeByPost(@PathVariable int postNo) throws Exception{
		
		System.out.println("json/listLikeByPost");
		
		Like like = new Like();
		like.setPostNo(postNo);
		
		Map<String , Object> map=likeService.listLikeByPost(like);
		
		return map;
	}
}