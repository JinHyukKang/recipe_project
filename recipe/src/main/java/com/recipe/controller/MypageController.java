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

import com.recipe.model.BoardVO;
import com.recipe.model.MemberVO;
import com.recipe.service.MypageService;


@Controller
@RequestMapping(value="/MyPage/*")
public class MypageController {
   
   private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
   
   @Autowired
   private MypageService mypageservice;
   
 //���������� �˾� �̵�
   @RequestMapping(value="/MyPage", method = RequestMethod.GET)
   public  String MyPagepop(HttpSession session, Model model) throws Exception {
      
      logger.info("���� ������ ����");

      String user_id = (String) session.getAttribute("user_id");
      
      List<MemberVO> findUser = mypageservice.findUser(user_id);
      
      model.addAttribute("findUser", findUser);
      
      return "/MyPage/MyPage";
   }
   //����������(���Խù�) �̵�
   @RequestMapping(value="/MyPagePost", method = RequestMethod.GET)
   public  String MyPagePost(HttpSession session, Model model) throws Exception {
		logger.info("���Խù� ����");
		
		int user_num =(int)session.getAttribute("user_num");
		List<BoardVO> findWrite = mypageservice.findWrite(user_num);
		
		model.addAttribute("findWrite",findWrite);

		return "/MyPage/MyPagePost";
   }

   //���������� ��������
   
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
	   logger.info("���������� ����");
	   
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
   

   
}