package com.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.MypageMapper;
import com.recipe.model.BoardVO;
import com.recipe.model.MemberVO;

@Service
public class MypageServiceImple implements MypageService{
	@Autowired
	MypageMapper mypagemapper;
	
	//사용자 조회
	@Override
	public List<MemberVO> findUser(String user_id) throws Exception {
		return mypagemapper.findUser(user_id);
	}
	
	//회원정보 수정
	@Override
    public void updateMember(String user_pass, String user_email, String user_postcode, String user_addr, String user_detailaddr, String user_extraaddr, String user_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("user_pass", user_pass);
		map.put("user_email", user_email);
		map.put("user_postcode", user_postcode);
		map.put("user_addr", user_addr);
		map.put("user_detailaddr", user_detailaddr);
		map.put("user_extraaddr", user_extraaddr);
		map.put("user_id", user_id);
		
        mypagemapper.updateMember(map);
    }
	
	//user의 게시글 조회
	@Override
	public List<BoardVO> findWrite(int user_num) throws Exception{
		return mypagemapper.findWrite(user_num);
	}
	
	//회원탈퇴
	@Override
	public void memberout(String user_id, String user_pass)throws Exception{
		mypagemapper.memberout(user_id, user_pass);
	}
}
