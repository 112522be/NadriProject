package com.yagn.nadrii.web.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yagn.nadrii.service.common.CommentService;
import com.yagn.nadrii.service.domain.Comments;

@RestController
@RequestMapping("/common/*")
public class CommentRestController {
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@RequestMapping("addComment")
	public Map<String, Object> addComment(@ModelAttribute Comments comments) throws Exception {
		commentService.addComment(comments);
		return commentService.listCommentByPost(comments.getPostNo());
	}
	
	@RequestMapping("listCommentByPost")
	public Map<String, Object> listCommentByPost(@RequestParam int postNo)throws Exception {
		return commentService.listCommentByPost(postNo);
	}
	
	@RequestMapping("listCommentById")
	public List<Comments> listCommentById(@RequestParam String userId)throws Exception {
		return commentService.listCommentById(userId);
	}
	
	@RequestMapping("updateComment")
	public void updateComment(@RequestParam int commentNo,
								@RequestParam String text)throws Exception {
		Comments comments = commentService.getComment(commentNo);
		comments.setText(text);
		commentService.updateComment(comments);
	}
	
	@RequestMapping("deleteComment")
	public Map<String, Object> deleteComment(@RequestParam int commentNo,
												@RequestParam int postNo) throws Exception {
		commentService.deleteComment(commentNo);
		return commentService.listCommentByPost(postNo);
	}
}
