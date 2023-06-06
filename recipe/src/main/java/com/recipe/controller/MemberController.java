package com.recipe.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recipe.model.MemberVO;
import com.recipe.service.MemberService;
import com.recipe.service.MypageService;

@Controller
@RequestMapping(value= "/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	@Autowired
	private MypageService mypageservice;
	
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception{
		
		logger.info("로그인 진입!");
		
		return "member/login";
	}
	
	//로그인 기능
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(
	        @RequestParam("user_id") String user_id,
	        @RequestParam("user_pass") String user_pass,
	        MemberVO vo,
	        HttpSession session,
	        Model model) throws Exception {

	    int cnt = memberservice.Login(user_id, user_pass, vo, session);
	    String result = "";

	    if (cnt > 0) {
	        result = "success";
	        // 로그인된 user의 정보 가져오기
	        List<MemberVO> findUser = mypageservice.findUser(user_id);
	        if (!findUser.isEmpty()) {
	            // 로그인된 user의 user_nickname과 user_num 불러오기
	            String user_nickname = findUser.get(0).getUser_nickname();
	            int user_num = findUser.get(0).getUser_num();

	            // session에 user_num과 user_nickname 저장
	            session.setAttribute("user_num", user_num);
	            session.setAttribute("user_nickname", user_nickname);
	            model.addAttribute("result", result);
	            
	        } else {
	            result = "fail";
	        }
	    } else if (cnt == 0) {
	        result = "fail";
	    } else {
	        result = "null";
	    }

	    model.addAttribute("result", result);

	    return "redirect:/member/login";
	}
	
	
	//로그아웃 기능
	@GetMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
	    session.invalidate();
	    redirectAttributes.addFlashAttribute("message", "로그아웃하셨습니다.");
	    return "redirect:/";
	}
	
	//비밀번호 찾기 이동
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String findPwGet() throws Exception{
		
		logger.info("비밀번호 찾기 창 진입!");
		
		return "member/findpw";
	}
	
	//비밀번호 찾기
	@PostMapping("/findpw.do")
	public ResponseEntity<String> findpw(@RequestParam("user_id") String user_id,
					     @RequestParam("user_email") String user_email)throws Exception{
		
		MemberVO findpw = memberservice.findpw(user_id, user_email);

	    if (findpw == null) {
	        return ResponseEntity.ok("fail");
	    } else {
	        return ResponseEntity.ok(findpw.getUser_pass());
	    }
		
	}
	
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGET() throws Exception{
		
		logger.info("회원가입 진입!");
		
		return "member/join";
		
	}
	
	//회원가입 기능
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinPOST(MemberVO member, Model model) throws Exception{
		
		
		memberservice.memberJoin(member);
	    logger.info("회원가입 작업완료");

	    String join = "joinSuccess"; // 원하는 조건에 따라 값을 설정합니다.

	    model.addAttribute("join", join);

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
