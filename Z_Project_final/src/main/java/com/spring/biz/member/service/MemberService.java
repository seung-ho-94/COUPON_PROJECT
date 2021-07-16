package com.spring.biz.member.service;

public interface MemberService {
	
	//회원가입
	public int insertMember(MemberVO vo);
	
	//아이디 중복 체크
	public int idCheck(String userId);
	
	//로그인 아이디, 비밀번호 확인
	public boolean loginCheck(MemberVO vo);

	//회원탈퇴 여부
	public String Withdrawal_id(String id);
	
	//로그인 아이디, 이메일 확인(비밀번호 찾기)
	public void updatePWD(MemberVO vo);
	public String checkIdEmail(MemberVO vo);
	
	//일반 회원 정보 상세 보기
	public MemberVO viewmember(String loginId);
	
	//일반 회원 정보 수정
	public void updateMyPage(MemberVO vo);
	
	//비밀번호 변경
	public void updatePwd(MemberVO vo);
	
	//회원 탈퇴
    public void deleteMember(String password);
}