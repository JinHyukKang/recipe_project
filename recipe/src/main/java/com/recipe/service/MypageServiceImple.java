package com.recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.MypageMapper;
import com.recipe.model.MemberVO;

@Service
public class MypageServiceImple implements MypageService{
	@Autowired
	MypageMapper mypagemapper;
	
	//ȸ������ ����
	@Override
    public void updateMember(MemberVO vo) throws Exception {
        mypagemapper.updateMember(vo);
    }
}
