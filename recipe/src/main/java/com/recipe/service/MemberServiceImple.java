package com.recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.MemberMapper;
import com.recipe.model.MemberVO;

@Service
public class MemberServiceImple implements MemberService{
	@Autowired
	MemberMapper membermapper;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	
	//아이디 중복확인
	public int idChk(String user_id) throws Exception{
		int result = membermapper.idChk(user_id);
		return result;
	}
	
}
