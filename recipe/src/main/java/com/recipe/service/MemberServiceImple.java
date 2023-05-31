package com.recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	@Override
    public int idChk(String user_id) throws Exception {
        return membermapper.idChk(user_id);
    }
	
	//닉네임 중복확인
	@Override
	public int nicknameChk(String user_nickname)throws Exception{
		return membermapper.nicknameChk(user_nickname);
	}
	
	//로그인 mapper 접근
	@Override
	public MemberVO Login(MemberVO vo) throws Exception {
	MemberVO VO = membermapper.MemberLogin(vo);
	
	return VO;	
		}
	
	
	
}
