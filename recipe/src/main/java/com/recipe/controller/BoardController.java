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
	
	//������ �Խ��� �̵�
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String Board() throws Exception{
		
		logger.info("�α��� ����!");
		
		return "board/board";
	}
	
	//������ �ۼ��̵�
	@RequestMapping(value = "/recipeWrite", method = RequestMethod.GET)
	public String recipeWrite() throws Exception{
		
		logger.info("�α��� ����!");
		
		return "board/recipeWrite";
	}
	
	//������ ���ۼ�
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String boardWrite(BoardVO board)throws Exception{
		
		boardservice.boardWrite(board);
		
		logger.info("���ۼ� �Ϸ�!");
		
		return "redirect:/board/board";
	}

}
