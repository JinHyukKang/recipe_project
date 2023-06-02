package com.recipe.mapper;


import org.apache.ibatis.annotations.Param;

import com.recipe.model.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	 
	//아이디 중복확인
	public int idChk(String user_id)throws Exception;
	
	//닉네임 중복확인
	public int nicknameChk(String user_nickname)throws Exception;
	
	//로그인 
	public int MemberLogin(@Param("user_id") String user_id, @Param("user_pass") String user_pass)throws Exception;
}
