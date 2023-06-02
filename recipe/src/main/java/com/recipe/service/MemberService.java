package com.recipe.service;


import javax.servlet.http.HttpSession;

import com.recipe.model.MemberVO;

public interface MemberService {
	
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	//아이디 중복확인
	public int idChk(String user_id)throws Exception;
	
	//닉네임 중복확인
	public int nicknameChk(String user_nickname)throws Exception;
	
	//로그인 기능
	public int Login(String user_id, String user_pass, MemberVO vo, HttpSession session)throws Exception;
	
}