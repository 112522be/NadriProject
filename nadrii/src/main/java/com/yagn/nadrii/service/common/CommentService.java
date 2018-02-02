package com.yagn.nadrii.service.common;

import java.util.List;
import java.util.Map;

import com.yagn.nadrii.service.domain.Comments;

public interface CommentService {
	public List<Comments> addComment(Comments comment) throws Exception;
	public Map<String, Object> listCommentByPost(int postNo)throws Exception;
	public List<Comments> listCommentById(String userId)throws Exception;
	public void updateComment(Comments comment)throws Exception;
	public void deleteComment(int commentNo)throws Exception;
	public int getCommentNo(Comments comment)throws Exception;
}
