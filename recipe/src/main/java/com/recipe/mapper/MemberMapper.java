package com.recipe.mapper;

import org.springframework.http.ResponseEntity;

import com.recipe.model.MemberVO;

public interface MemberMapper {
	
	//ȸ������
	public void memberJoin(MemberVO member) throws Exception;
	 
	//���̵� �ߺ�Ȯ��
	public boolean idChk(String user_id)throws Exception;
	
	//�α��� 
	public MemberVO MemberLogin(MemberVO vo)throws Exception;
}
