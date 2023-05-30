package com.recipe.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recipe.model.MemberVO;
import com.recipe.service.MemberService;

@Controller
@RequestMapping(value= "/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception{
		
		logger.info("로그인 진입!");
		
		return "member/login";
	}
	
	//로그인 기능
	@PostMapping(value="/login.do")
	public String Login(MemberVO vo, HttpSession session) throws Exception {
		
		MemberVO Login = memberservice.Login(vo);
		
		if(Login != null) {
			session.setAttribute("LoginVo", Login);
			logger.info("로그인 성공!");
			return "redirect:/";
		}else {
			//session.setAttribute("LoginVo", null);
			logger.info("로그인 실패!");
			return"redirect:/member/login";
		}
		
		
	}
	
	//로그아웃 기능
	@GetMapping("/logout.do")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGET() throws Exception{
		
		logger.info("회원가입 진입!");
		
		return "member/join";
		
	}
	
	//회원가입 기능 추가 
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
		
		
		memberservice.memberJoin(member);
		
		logger.info("join Service 작업완료");
		
		return "redirect:/member/login";
		
	}
	
	// 아이디 중복검사
	@PostMapping("/idChk")
    public ResponseEntity<Boolean> idChk(@RequestParam String user_id) throws Exception {
        boolean result = memberservice.idChk(user_id);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
	
	
}
