package com.spring.biz.community.service;

import java.util.List;

public interface CommentService {
	
	//댓글 목록
    List<CommentVO> selectCommentlist(int board_no);    
   
    //댓글 생성
    void insertComment(CommentVO vo);    
 
    // 댓글 선택
    CommentVO selectOneComment(int no);
    
    //댓글 수정
    void updateComment(CommentVO vo);    
 
    //댓글을 삭제
    void deleteComment(int no);    
}
