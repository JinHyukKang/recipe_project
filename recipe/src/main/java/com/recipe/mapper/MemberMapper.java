package com.recipe.mapper;

import org.springframework.http.ResponseEntity;

import com.recipe.model.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	 
	//아이디 중복확인
	public boolean idChk(String user_id)throws Exception;
	
	//로그인 
	public MemberVO MemberLogin(MemberVO vo)throws Exception;
}
