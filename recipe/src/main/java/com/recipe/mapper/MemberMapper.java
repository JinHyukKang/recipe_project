package com.recipe.mapper;


import org.apache.ibatis.annotations.Param;

import com.recipe.model.MemberVO;

public interface MemberMapper {
	
	//ȸ������
	public void memberJoin(MemberVO member) throws Exception;
	 
	//���̵� �ߺ�Ȯ��
	public int idChk(String user_id)throws Exception;
	
	//�г��� �ߺ�Ȯ��
	public int nicknameChk(String user_nickname)throws Exception;
	
	//�α��� 
	public int MemberLogin(@Param("user_id") String user_id, @Param("user_pass") String user_pass)throws Exception;
}
