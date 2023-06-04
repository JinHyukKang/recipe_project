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
	
	// ������ ���ۼ�
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String boardWrite(BoardVO board, HttpSession session, Model model) throws Exception {
	    // �α��� session�� ����� user_nickname, user_id ��������
	    String user_nickname = (String) session.getAttribute("user_nickname");
	    int user_num = (int) session.getAttribute("user_num");

	    // user_nickname�� user_num BoardVO�� �־��ֱ�
	    board.setUser_nickname(user_nickname);
	    board.setUser_num(user_num);


	    boardservice.boardWrite(board);

	    logger.info("���ۼ� �Ϸ�!");

	    return "redirect:/board/board";
	}
	

}
