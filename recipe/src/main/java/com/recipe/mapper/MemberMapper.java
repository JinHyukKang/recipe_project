package com.recipe.mapper;

import com.recipe.model.MemberVO;

public interface MemberMapper {
	
	//ȸ������
	public void memberJoin(MemberVO member) throws Exception;
	 
	//���̵� �ߺ� Ȯ��
	public int idChk(MemberVO member) throws Exception;
}
