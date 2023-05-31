package com.recipe.mapper;

import com.recipe.model.MemberVO;

public interface MypageMapper {
	
	//마이페이지 회원정보 수정
	public void updateMember(MemberVO vo)throws Exception;
	

}
