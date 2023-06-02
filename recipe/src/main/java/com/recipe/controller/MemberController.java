package com.recipe.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value = "/login.do", method=RequestMethod.POST)
	public ModelAndView Login(
			@RequestParam("user_id") String user_id,
			@RequestParam("user_pass") String user_pass,
			MemberVO vo,
			HttpSession session,
			ModelAndView mav) throws Exception {
		
		int cnt = memberservice.Login(user_id, user_pass, vo, session);
		String result = "";
		
		if(cnt > 0) {
			result = "success";
			mav.setViewName("redirect:/");
			mav.addObject("result", result);
		}else if (cnt == 0) {
			result = "fail";
			mav.setViewName("redirect:/member/login");
			mav.addObject("result", result);
		}else if (cnt == -1) {
			result = "null";
			mav.setViewName("redirect:/member/login");
			mav.addObject("result", result);
		}
		
		
		
		return mav;
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
	
	//회원가입 기능
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
		
		
		memberservice.memberJoin(member);
		
		logger.info("회원가입 작업완료");
		
		return "redirect:/member/login";
		
	}
	
	// 아이디 중복검사
	@PostMapping("/idChk")
    public ResponseEntity<String> idChk(@RequestParam String user_id) throws Exception {
		int cnt = memberservice.idChk(user_id);
        
		if(cnt > 0) {
			return ResponseEntity.ok("fail");
		}else {
			return ResponseEntity.ok("success");
		}
        
    }
	
	//닉네임 중복검사
	@PostMapping("/nicknameChk")
    public ResponseEntity<String> nicknameChk(@RequestParam String user_nickname) throws Exception {
		int cnt = memberservice.nicknameChk(user_nickname);
        
		if(cnt > 0) {
			return ResponseEntity.ok("fail");
		}else {
			return ResponseEntity.ok("success");
		}
        
    }
	
	
}
