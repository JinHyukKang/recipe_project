package com.recipe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.MemberMapper;
import com.recipe.model.MemberVO;

@Service
public class MemberServiceImple implements MemberService{
	@Autowired
	MemberMapper membermapper;
	
	//회원가입
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
	
	//로그인
	@Override
	public int Login(String user_id, String user_pass, MemberVO vo, HttpSession session) throws Exception {
		int cnt = membermapper.MemberLogin(user_id, user_pass);
		
		if(cnt > 0) {
			session.setAttribute("user_id", vo.getUser_id());
			session.setAttribute("user_pass", vo.getUser_pass());
		}else if(user_id == null || user_pass == null) {
			cnt = -1;
		}
		
		return cnt;
	}
	
	//비밀번호 확인
	public MemberVO findpw(String user_id, String user_email)throws Exception{
		return membermapper.findpw(user_id, user_email);
	}
	
	//전체 회원정보 가져오기
	public List<MemberVO> AllMember()throws Exception{
		return membermapper.AllMember();
	}
	
	//회원 전체 인원수
	public int UserCount()throws Exception{
		int cnt = membermapper.UserCount();
		return cnt;
	}
	//관리자페이지(회원탈퇴)
	public void DeleteUser(@Param("user_num") int user_num)throws Exception{
		membermapper.DeleteUser(user_num);
	}
}
