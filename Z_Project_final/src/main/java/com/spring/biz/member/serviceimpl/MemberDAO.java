package com.spring.biz.member.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.batch.MyBatisBatchItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.member.service.MemberService;
import com.spring.biz.member.service.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 회원가입
	public int insertMember(MemberVO vo){
		return mybatis.insert("member.sign_up", vo);
	}

	// 아이디 중복 체크
	public int idCheck(String id){
		int result = mybatis.selectOne("member.id_check", id);	  
		return result;
	}
	
	//아이디, 비밀번호 확인
	public boolean loginCheck(MemberVO vo){
		String loginCheck = mybatis.selectOne("member.checkIdPassword", vo);
		return loginCheck != null;
	}
	
	//<!-- 회원탈퇴 아이디 유효성 검사 -->
	public String Withdrawal_id(String id) {
		return mybatis.selectOne("member.Withdrawal_id", id);
	}
	 
	//아이디, 이메일 확인(비밀번호 찾기)
	public void updatePWD(MemberVO vo) {
		mybatis.update("member.updatepassword", vo);
	}
	
	//아이디, 이메일 확인(비밀번호 찾기)
	public String checkIdEmail(MemberVO vo) {
		return mybatis.selectOne("member.checkIdEmail", vo);
	}
	
	//일반 회원 정보 상세 보기
	public MemberVO viewmember(String loginId){
		return mybatis.selectOne("member.viewmember", loginId);
	}
	
	//일반 회원 정보 수정
	public void updateMyPage(MemberVO vo) {
		mybatis.update("member.updateMyPage", vo);
	}
	//비밀번호 변경
    public void updatePwd(MemberVO vo) {
    	mybatis.update("member.updatePassword", vo);
    }
    
   //회원 탈퇴
    public void deleteMember(String password) {
        mybatis.update("member.deleteMember", password);
    }
}










