package com.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recipe.model.BoardVO;
import com.recipe.model.Criteria;
import com.recipe.model.MemberVO;
import com.recipe.model.PageVO;
import com.recipe.service.BoardService;
import com.recipe.service.MemberService;

@Controller
@RequestMapping(value="/Admin/*")
public class AdminController {
	
	 private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	 
	 @Autowired
	 private BoardService boardservice;
	 
	 @Autowired
	 private MemberService memberservice;
	 
	 //관리자 페이지 (멤버관리 접속)
	 @RequestMapping(value="/AdminMember", method = RequestMethod.GET)
	 public String AdminMember(HttpSession session, Model model,
						 @RequestParam(defaultValue = "1") int pageNum, 
						   @RequestParam(defaultValue = "10") int amount)throws Exception{
		 
			// 전체 회원정보 가져오기
			List<MemberVO> AllMember = memberservice.AllMember();
			model.addAttribute("AllMember", AllMember);

			// 페이징 기능
			// 페이지에서 가져올 전체 회원 인원수
			int total = memberservice.UserCount() - 1;

			Criteria cri = new Criteria(pageNum, amount); // pageNum과 amount 값을 설정한 Criteria 객체 생성

			model.addAttribute("page", new PageVO(cri, total));

			logger.info("관리자 멤버 관리 접속!");

			return "/Admin/AdminMember";
	 }
	 
	//관리자 페이지 (게시글 관리 접속)
	 @RequestMapping(value="/AdminPost", method = RequestMethod.GET)
	 public String AdminPost(HttpSession session, Model model,
						 @RequestParam(defaultValue = "1") int pageNum, 
						   @RequestParam(defaultValue = "10") int amount)throws Exception{
		 
			// 전체 게시글 가져오기
			List<BoardVO> findWriteAll = boardservice.findWriteAll();
			model.addAttribute("findWriteAll", findWriteAll);

			// 페이징 기능
			// 페이지에서 가져올 전체 회원 인원수
			int total = boardservice.countWrite();

			Criteria cri = new Criteria(pageNum, amount); // pageNum과 amount 값을 설정한 Criteria 객체 생성

			model.addAttribute("page", new PageVO(cri, total));

		 
			logger.info("관리자 게시글 관리 접속!");

			return "/Admin/AdminPost";	 
	 }
	 
	// 게시글 삭제
	@ResponseBody
	@RequestMapping(value = "/DeleteRecipe.do", method = RequestMethod.POST)
	public ResponseEntity<String> DeleteRecipe(BoardVO board, Model model,
			@RequestParam("recipe_num") int recipe_num) throws Exception {

			// 게시글 삭제 메소드 호출
			boardservice.DeleteRecipe(recipe_num);

			return ResponseEntity.ok("success");
		}
	
	//관리자페이지(회원탈퇴)
	@ResponseBody
	@RequestMapping(value = "/DeleteUser.do", method = RequestMethod.POST)
	public ResponseEntity<String> DeleteUser(BoardVO board, Model model,
			@RequestParam("user_num") int user_num) throws Exception {

			// 게시글 삭제 메소드 호출
			memberservice.DeleteUser(user_num);

			return ResponseEntity.ok("success");
		}

}
