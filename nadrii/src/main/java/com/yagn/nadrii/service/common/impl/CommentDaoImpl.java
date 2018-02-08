package com.yagn.nadrii.service.common.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.service.common.CommentDao;
import com.yagn.nadrii.service.domain.Comments;

@Repository("commentDaoImpl")
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	@Override
	public void addComment(Comments comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment", comment);
	}

	@Override
	public List<Comments> listCommentByPost(int postNo) throws Exception {
		return sqlSession.selectList("CommentMapper.listCommentByPost", postNo);
	}

	@Override
	public List<Comments> listCommentById(String userId) throws Exception {
		return sqlSession.selectList("CommentMapper.listCommentById", userId);
	}

	@Override
	public void updateComment(Comments comment) throws Exception {
		sqlSession.update("CommentMapper.updateComment", comment);
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		sqlSession.delete("CommentMapper.deleteComment", commentNo);
	}

	@Override
	public int getTotalCount(int postNo) throws Exception {
		return sqlSession.selectOne("CommentMapper.getTotalCount", postNo);
	}

	@Override
	public int getCommentNo(Comments comment) throws Exception {
		return sqlSession.selectOne("CommentMapper.getCommentNo", comment);
	}
	
	
	

}
