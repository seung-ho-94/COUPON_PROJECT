package com.spring.biz.community.impl;

import java.util.List;

import javax.xml.stream.events.Comment;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.community.service.CommentVO;
import com.spring.biz.community.service.CommunityVO;

@Repository("commentDAO")
public class CommentDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public CommentDAO() {}
	
	public List<CommentVO> selectCommentlist(int board_no) {
		return mybatis.selectList("commentDAO.selectCommentlist", board_no);
	}

	public void insertComment(CommentVO vo) {
		mybatis.insert("commentDAO.insertComment", vo);
	}
	
	public void updateComment(CommentVO vo) {
		mybatis.update("commentDAO.updateComment", vo);
	}

	public void deleteComment(int no) {
		mybatis.delete("commentDAO.deleteComment", no);
	}
	
	public CommentVO selectOneComment(int no) {
		return mybatis.selectOne("commentDAO.selectOneComment", no);
	}
}
