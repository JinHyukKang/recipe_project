package com.recipe.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recipe.model.BoardVO;
import com.recipe.service.BoardService;


@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardservice;
	
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
	
	//레시피 글작성
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String boardWrite(BoardVO board)throws Exception{
		
		boardservice.boardWrite(board);
		
		logger.info("글작성 완료!");
		
		return "redirect:/board/board";
	}

}
