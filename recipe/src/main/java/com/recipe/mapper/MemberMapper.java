package com.recipe.mapper;


import java.util.List;

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
	
	//비밀번호찾기
	public MemberVO findpw(@Param("user_id") String user_id, @Param("user_email") String user_email)throws Exception;
	
	//전체 회원정보 가져오기
	public List<MemberVO> AllMember()throws Exception;
	
	//회원 전체 인원수
	public int UserCount()throws Exception;
}
