package com.recipe.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.recipe.model.MemberVO;
import com.recipe.service.MemberService;
import com.recipe.service.MypageService;


@Controller
public class MypageController {
   
   private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
   
   @Autowired
   private MypageService mypageservice;
   
   //���������� �˾� �̵�
   @RequestMapping(value="/MyPage", method = RequestMethod.GET)
   public  String MyPagepop(HttpSession session, Model model) {
      
      logger.info("���� ������ ����");
      
      MemberVO loginUser =  (MemberVO) session.getAttribute("LoginVo");
      if(loginUser != null) {
    	  String user_id = loginUser.getUser_id();
    	  String user_nickname= loginUser.getUser_nickname();
    	  String user_name = loginUser.getUser_name();
    	  String user_pw = loginUser.getUser_pass();
    	  String user_email = loginUser.getUser_email();
    	  String user_postcode = loginUser.getUser_postcode();
    	  String user_addr = loginUser.getUser_addr();
    	  String user_detailaddr = loginUser.getUser_detailaddr();
    	  String user_extraaddr = loginUser.getUser_extraaddr();
    	  
    	  // �𵨿� �α��� ���̵�� �̸��� ��Ƽ� ����
    	  model.addAttribute("user_id",user_id);
    	  model.addAttribute("user_nickname",user_nickname);
    	  model.addAttribute("user_name",user_name);
    	  model.addAttribute("user_pw",user_pw);
    	  model.addAttribute("user_email",user_email);
    	  model.addAttribute("user_postcode",user_postcode);
    	  model.addAttribute("user_addr",user_addr);
    	  model.addAttribute("user_detailaddr",user_detailaddr);
    	  model.addAttribute("user_extraaddr",user_extraaddr);
      }
      
      return "MyPage/MyPage";
   }
   //����������(���Խù�) �̵�
   @RequestMapping(value="/MyPagePost", method = RequestMethod.GET)
   public  String MyPagePost() {
      logger.info("���Խù� ����");
      
      return "MyPage/MyPagePost";
   }

   //���������� ��������
   
   @RequestMapping(value = "/updateMember.do")
   public String updateMember(MemberVO vo) throws Exception {
	   mypageservice.updateMember(vo);
       return "redirect:/MyPage"; //
   }
   
}