package com.recipe.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recipe.model.MemberVO;

@Controller
public class PopupController {
   
   private static final Logger logger = LoggerFactory.getLogger(PopupController.class);
   
   
   //���������� �˾� �̵�
   @RequestMapping(value="/MyPage", method = RequestMethod.GET)
   public  String MyPagepop(HttpSession session, Model model) {
      
      logger.info("���� ������ ����");
      
      MemberVO loginUser =  (MemberVO) session.getAttribute("LoginVo");
      if(loginUser != null) {
    	  String id = loginUser.getUser_id();
    	  String nickname = loginUser.getUser_nickname();
    	  String name = loginUser.getUser_name();
    	  String pw = loginUser.getUser_pass();
    	  String email = loginUser.getUser_email();
    	  String postcode = loginUser.getUser_postcode();
    	  String addr = loginUser.getUser_addr();
    	  String detailaddr = loginUser.getUser_detailaddr();
    	  String extraaddr = loginUser.getUser_extraaddr();
    	  
    	  // �𵨿� �α��� ���̵�� �̸��� ��Ƽ� ����
    	  model.addAttribute("id",id);
    	  model.addAttribute("nickname",nickname);
    	  model.addAttribute("name",name);
    	  model.addAttribute("pw",pw);
    	  model.addAttribute("email",email);
    	  model.addAttribute("postcode",postcode);
    	  model.addAttribute("addr",addr);
    	  model.addAttribute("detailaddr",detailaddr);
    	  model.addAttribute("extraaddr",extraaddr);
      }
      
      return "MyPage/MyPage";
   }
   //����������(���Խù�) �̵�
   @RequestMapping(value="/MyPagePost", method = RequestMethod.GET)
   public  String MyPagePost() {
      logger.info("���Խù� ����");
      
      return "MyPage/MyPagePost";
   }

   
}