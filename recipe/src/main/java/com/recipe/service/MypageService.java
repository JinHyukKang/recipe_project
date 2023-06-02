package com.recipe.service;

import java.util.List;

import com.recipe.model.MemberVO;

public interface MypageService {
	//사용자 조회
	public List<MemberVO> findUser(String user_id) throws Exception;
	
	//마이페이지 회원정보 수정
	public void updateMember(String user_pass, String user_email, String user_postcode, String user_addr, String user_detailaddr, String user_extraaddr, String user_id)throws Exception;
}
