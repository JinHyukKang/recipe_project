package com.recipe.mapper;

import java.util.List;
import java.util.Map;

import com.recipe.model.BoardVO;
import com.recipe.model.MemberVO;

public interface MypageMapper {
	
	//사용자 조회
	public List<MemberVO> findUser(String user_id) throws Exception;
	
	//마이페이지 회원정보 수정
	public void updateMember(Map<String, Object> map)throws Exception;
	
	//user의 게시글 조회
	public List<BoardVO> findWrite(int user_num)throws Exception;
	
	//회원탈퇴
	public List<MemberVO> deleteUser(String user_id)throws Exception;
}
