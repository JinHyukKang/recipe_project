package com.recipe.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.recipe.model.BoardVO;
import com.recipe.model.MemberVO;

public interface MypageMapper {
	
	//����� ��ȸ
	public List<MemberVO> findUser(String user_id) throws Exception;
	
	//���������� ȸ������ ����
	public void updateMember(Map<String, Object> map)throws Exception;
	
	//user�� �Խñ� ��ȸ
	public List<BoardVO> findWrite(int user_num)throws Exception;
	
	//ȸ��Ż��
	public void memberout(@Param("user_id") String user_id, @Param("user_pass") String user_pass)throws Exception;
}
