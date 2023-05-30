package com.recipe.service;

import org.springframework.http.ResponseEntity;

import com.recipe.model.MemberVO;

public interface MemberService {
	
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	//아이디 중복확인
	public boolean idChk(String user_id)throws Exception;
	
	//로그인 기능
	public MemberVO Login(MemberVO vo)throws Exception;
	
}