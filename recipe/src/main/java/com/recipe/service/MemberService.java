package com.recipe.service;

import com.recipe.model.MemberVO;

public interface MemberService {

	public void memberJoin(MemberVO member) throws Exception;
	
	// �씠硫붿씪 以묐났 寃��궗
	public int emailCheck(String memberEmail)throws Exception;
		
	
}