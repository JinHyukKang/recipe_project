package com.recipe.service;

import com.recipe.model.MemberVO;

public interface MypageService {
	
	//마이페이지 회원정보 수정
	public void updateMember(MemberVO vo)throws Exception;
}
