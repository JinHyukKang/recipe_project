package com.recipe.mapper;


import com.recipe.model.MemberVO;

public interface MemberMapper {
	
	//ȸ������
	public void memberJoin(MemberVO member) throws Exception;
	 
	//���̵� �ߺ�Ȯ��
	public int idChk(String user_id)throws Exception;
	
	//�г��� �ߺ�Ȯ��
	public int nicknameChk(String user_nickname)throws Exception;
	
	//�α��� 
	public MemberVO MemberLogin(MemberVO vo)throws Exception;
}
