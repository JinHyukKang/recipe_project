package com.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
	public String boardWrite(BoardVO board,
							 @RequestParam("recipeFile") MultipartFile file,
							 HttpSession session, 
							 Model model)throws Exception {
		
		// �α��� session�� ����� user_nickname, user_num ��������
	    String user_nickname = (String) session.getAttribute("user_nickname");
	    int user_num = (int) session.getAttribute("user_num");

	    // user_nickname�� user_num BoardVO�� �־��ֱ�
	    board.setUser_nickname(user_nickname);
	    board.setUser_num(user_num);

	    // ���� ���ε� ó��
	    if (!file.isEmpty()) {
	      String real_fileName = file.getOriginalFilename();//����ڰ� ���ε��� ���ϸ�
	      long size = file.getSize(); //���� ������
	      String fileExtension = real_fileName.substring(real_fileName.lastIndexOf("."),real_fileName.length());//Ȯ���ڸ� ����
	      
	      //������ ���� �̸� ����(������ ���ϸ� �浹�� ���ϱ� ���� ����)
	      UUID uuid = UUID.randomUUID();
	      String[] uuids = uuid.toString().split("-");
	      String fileName = uuids[0];
	      
	      // ������ ������ ��� ����
	      String uploadPath = "C:/workspace/recipe/recipe/src/main/webapp/resources/upload/";
	      String filePath = uploadPath + fileName + fileExtension;
	      //������ ��ο� ���� ����
	      file.transferTo(new File(filePath));
	      
	      //BoadVO�� user�� ������ ���ϸ�� ���Ƿ� ������ ���ϸ� �׸��� ���� ������ ����
	      board.setRecipe_realname(real_fileName); // BoardVO�� ���� �̸� ����
	      board.setRecipe_filename(fileName);// BoardVO�� ���Ƿ� ������ ���� �̸� ����
	      board.setFile_path(filePath);
	      
	      boardservice.boardWrite(board);

		  logger.info("�� �ۼ� �Ϸ�!");

		  return "redirect:/board/board";
		  
	    }else {
	    	boardservice.boardWrite(board);

		    logger.info("�� �ۼ� �Ϸ�!");

		    return "redirect:/board/board";
	    }

	    
	}
	

}
