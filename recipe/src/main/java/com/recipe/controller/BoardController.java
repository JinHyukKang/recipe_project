package com.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.recipe.model.BoardVO;
import com.recipe.model.MemberVO;
import com.recipe.service.BoardService;
import com.recipe.service.MypageService;


@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardservice;
	@Autowired
	private MypageService mypageservice;
	
	//레시피 게시판 이동
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String Board() throws Exception{
		
		logger.info("로그인 진입!");
		
		return "board/board";
	}
	
	//레시피 작성이동
	@RequestMapping(value = "/recipeWrite", method = RequestMethod.GET)
	public String recipeWrite() throws Exception{
		
		logger.info("로그인 진입!");
		
		return "board/recipeWrite";
	}
	
	// 레시피 글작성
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String boardWrite(BoardVO board, @RequestParam("recipeFile") MultipartFile file, HttpSession session, Model model) throws Exception {
		// 로그인 session에 저장된 user_nickname, user_num 가져오기
	    String user_nickname = (String) session.getAttribute("user_nickname");
	    int user_num = (int) session.getAttribute("user_num");

	    // user_nickname과 user_num BoardVO에 넣어주기
	    board.setUser_nickname(user_nickname);
	    board.setUser_num(user_num);

	    // 파일 업로드 처리
	    if (!file.isEmpty()) {
	      String fileName = file.getOriginalFilename();
	      // 파일을 저장할 경로 설정
	      String uploadPath = "D:/kjh_spring/recipe/recipe/src/main/webapp/resources/upload/";
	      String filePath = uploadPath + fileName;
	      file.transferTo(new File(filePath));
	      board.setRecipe_filename(fileName); // BoardVO에 파일 이름 저장
	    }

	    boardservice.boardWrite(board);

	    logger.info("글 작성 완료!");

	    return "redirect:/board/board";
	}
	

}
