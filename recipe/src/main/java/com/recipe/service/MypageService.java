package com.recipe.service;

import java.util.List;

import com.recipe.model.BoardVO;
import com.recipe.model.MemberVO;

public interface MypageService {
	//회원정보 조회
	public List<MemberVO> findUser(String user_id) throws Exception;
	
	//회원정보 수정
	public void updateMember(String user_pass, String user_email, String user_postcode, String user_addr, String user_detailaddr, String user_extraaddr, String user_id)throws Exception;

	//user의 게시글 조회
	public List<BoardVO> findWrite(int user_num) throws Exception;
	
	//회원탈퇴
	public void memberout(String user_id, String user_pass)throws Exception;
}
