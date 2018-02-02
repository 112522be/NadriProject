package com.yagn.nadrii.service.common.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.service.common.CommentDao;
import com.yagn.nadrii.service.common.CommentService;
import com.yagn.nadrii.service.domain.Comments;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao commentDao;

	@Override
	public List<Comments> addComment(Comments comment) throws Exception {
		return commentDao.addComment(comment);
	}

	@Override
	public Map<String, Object> listCommentByPost(int postNo) throws Exception {
		List<Comments> listComment = commentDao.listCommentByPost(postNo);
		int totalCount = commentDao.getTotalCount(postNo);
		Map<String, Object> result = new HashMap<>();
		result.put("listComment", listComment);
		result.put("totalCount", totalCount);
		return result;
	}

	@Override
	public List<Comments> listCommentById(String userId) throws Exception {
		return commentDao.listCommentById(userId);
	}

	@Override
	public void updateComment(Comments comment) throws Exception {
		commentDao.updateComment(comment);
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		commentDao.deleteComment(commentNo);
	}

	@Override
	public int getCommentNo(Comments comment) throws Exception {
		return commentDao.getCommentNo(comment);
	}
}
