package com.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recipe.model.BoardVO;
import com.recipe.model.MemberVO;
import com.recipe.service.MypageService;


@Controller
@RequestMapping(value="/MyPage/*")
public class MypageController {
   
   private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
   
   @Autowired
   private MypageService mypageservice;
   
 //마이페이지 팝업 이동
   @RequestMapping(value="/MyPage", method = RequestMethod.GET)
   public  String MyPagepop(HttpSession session, Model model) throws Exception {
      
      logger.info("마이 페이지 진입");

      String user_id = (String) session.getAttribute("user_id");
      
      List<MemberVO> findUser = mypageservice.findUser(user_id);
   
      model.addAttribute("findUser", findUser);
      return "/MyPage/MyPage";
   }
   //마이페이지(내게시물) 이동
   @RequestMapping(value="/MyPagePost", method = RequestMethod.GET)
   public  String MyPagePost(HttpSession session, Model model) throws Exception {
		logger.info("내게시물 진입");
		
		int user_num =(int)session.getAttribute("user_num");
		List<BoardVO> findWrite = mypageservice.findWrite(user_num);
		
		model.addAttribute("findWrite",findWrite);

		return "/MyPage/MyPagePost";
   }

   //마이페이지 정보수정
   
   @RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
   public String updateMember(
		   @RequestParam("user_pass") String user_pass,
		   @RequestParam("user_email") String user_email,
		   @RequestParam("user_postcode") String user_postcode,
		   @RequestParam("user_addr") String user_addr,
		   @RequestParam("user_detailaddr") String user_detailaddr,
		   @RequestParam("user_extraaddr") String user_extraaddr,
		   HttpSession session,
		   @ModelAttribute MemberVO vo) throws Exception{
	   logger.info("마이페이지 수정");
	   
	   String user_id = (String) session.getAttribute("user_id");
	   
	   logger.info("user_pass: " + user_pass);
	   logger.info("user_email: " + user_email);
	   logger.info("user_postcode: " + user_postcode);
	   logger.info("user_addr: " + user_addr);
	   logger.info("user_detailaddr: " + user_detailaddr);
	   logger.info("user_extraaddr: " + user_extraaddr);
	   
	   mypageservice.updateMember(user_pass, user_email, user_postcode, user_addr, user_detailaddr, user_extraaddr, user_id);
       return "redirect:/MyPage/MyPage"; //
   }
   
   //회원탈퇴 팝업 페이지 이동 
   @RequestMapping(value="/memberout", method = RequestMethod.GET)
   public  String memberoutPage() throws Exception{
	   
	   logger.info("회원탈퇴 팝업!");
	   
	   return "/MyPage/memberout";
   }
   
   //회원탈퇴 
   @ResponseBody
   @RequestMapping(value="/memberout.do", produces="text/html; charset=UTF-8", method = RequestMethod.POST)
   public  String memberout(HttpSession session,
		   					@RequestParam("user_id") String user_id,
		   					@RequestParam("user_pass") String user_pass) throws Exception{
	   
	   List<MemberVO> findUser = mypageservice.findUser(user_id);
	   
	   String data_user_id = findUser.get(0).getUser_id();
	   String data_user_pass = findUser.get(0).getUser_pass();
	   
	   String message="";
	   
	   if(!user_id.equals(data_user_id) || !user_pass.equals(data_user_pass)) {
		   
		   message = "<script>";
		   message += "alert('잘못된 아이디 혹은 비밀번호입니다!');";
		   message += "location.href='/MyPage/memberout';";
		   message += "</script>";
		  
	   }else {
		   mypageservice.memberout(user_id, user_pass);
		   
		   message = "<script>";
		   message += "alert('회원탈퇴가 정상적으로 완료되었습니다!');";
		   message += "window.close();";
		   message += "window.opener.location.href = '/';"; // 팝업을 열었던 부모 창으로 리다이렉트
		   message += "</script>";
		   
		   session.invalidate();
		   
		   logger.info("회원탈퇴 성공!");
	   }
	   
	   
	 
	   return message;
   }
}