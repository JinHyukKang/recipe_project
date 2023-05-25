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
	@Override
	public int idChk(MemberVO member) throws Exception{
		int result = membermapper.idChk(member);
		return result;
		
	}
}
