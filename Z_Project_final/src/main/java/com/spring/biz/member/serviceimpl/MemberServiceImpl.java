package com.spring.biz.member.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.service.MemberService;
import com.spring.biz.member.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	// 회원가입 정보 입력
	public int insertMember(MemberVO vo) {
		return memberDAO.insertMember(vo);
	}
	
	// 아이디 중복 체크
	@Override
	 public int idCheck(String id){
		 int result = memberDAO.idCheck(id);
		 return result;
	}
	
	//로그인 아이디, 비밀번호 확인
	@Override
	public boolean loginCheck(MemberVO vo) {
		return memberDAO.loginCheck(vo);
	}
	
	// 회원탈퇴 아이디 유효성 검사
	@Override
	public String Withdrawal_id(String id) {
		return memberDAO.Withdrawal_id(id);
	}

	//임시 비밀번호로 변경
	@Override
	public void updatePWD(MemberVO vo) {
		memberDAO.updatePWD(vo);
	} 
	
	//비밀번호 찾기 이메일 체크
	@Override
	public String checkIdEmail(MemberVO vo) {
		return memberDAO.checkIdEmail(vo);
	} 

	//일반 회원 상세정보 불러오기
	@Override
	public MemberVO viewmember(String loginId) {
		return memberDAO.viewmember(loginId);
	}

	@Override
	public void updateMyPage(MemberVO vo) {
		memberDAO.updateMyPage(vo);
	}
	
	//비밀번호 변경
	@Override
	public void updatePwd(MemberVO vo) {
	    memberDAO.updatePwd(vo);
	}
	
   //회원탈퇴
   @Override
   public void deleteMember(String password) {
      memberDAO.deleteMember(password);
   }
}
