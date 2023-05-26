package com.recipe.mapper;

import com.recipe.model.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	 
	//아이디 중복확인
	public int idChk(String user_id) throws Exception;
}
