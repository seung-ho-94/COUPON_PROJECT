package com.spring.biz.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.community.service.CommentService;
import com.spring.biz.community.service.CommentVO;

// 비즈니스 로직 처리 서비스 영역에 사용 --> 오버 라이딩 후, DAO로 이동
// @Service : @Component 상속확장 어노테이션
@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	public CommentServiceImpl() {}


	public List<CommentVO> selectCommentlist(int board_no) {
		return commentDAO.selectCommentlist(board_no);
	}
	
	public void insertComment(CommentVO vo) {
		commentDAO.insertComment(vo);
	}
	
	@Override
	public void updateComment(CommentVO vo) {
		commentDAO.updateComment(vo);
	}
	
	@Override
	public void deleteComment(int no) {
		commentDAO.deleteComment(no);
	}


	public CommentVO selectOneComment(int no) {
		return commentDAO.selectOneComment(no);
	} 
}
