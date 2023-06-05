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
	public String boardWrite(BoardVO board,
							 @RequestParam("recipeFile") MultipartFile file,
							 HttpSession session, 
							 Model model)throws Exception {
		
		// 로그인 session에 저장된 user_nickname, user_num 가져오기
	    String user_nickname = (String) session.getAttribute("user_nickname");
	    int user_num = (int) session.getAttribute("user_num");

	    // user_nickname과 user_num BoardVO에 넣어주기
	    board.setUser_nickname(user_nickname);
	    board.setUser_num(user_num);

	    // 파일 업로드 처리
	    if (!file.isEmpty()) {
	      String real_fileName = file.getOriginalFilename();//사용자가 업로드한 파일명
	      long size = file.getSize(); //파일 사이즈
	      String fileExtension = real_fileName.substring(real_fileName.lastIndexOf("."),real_fileName.length());//확장자명 추출
	      
	      //임으로 파일 이름 변경(동일한 파일명 충돌을 피하기 위해 설정)
	      UUID uuid = UUID.randomUUID();
	      String[] uuids = uuid.toString().split("-");
	      String fileName = uuids[0];
	      
	      // 파일을 저장할 경로 설정
	      String uploadPath = "C:/workspace/recipe/recipe/src/main/webapp/resources/upload/";
	      String filePath = uploadPath + fileName + fileExtension;
	      //설정한 경로에 파일 저장
	      file.transferTo(new File(filePath));
	      
	      //BoadVO에 user가 설정한 파일명과 임의로 설정한 파일명 그리고 파일 저장경로 저장
	      board.setRecipe_realname(real_fileName); // BoardVO에 파일 이름 저장
	      board.setRecipe_filename(fileName);// BoardVO에 임의로 설정한 파일 이름 저장
	      board.setFile_path(filePath);
	      
	      boardservice.boardWrite(board);

		  logger.info("글 작성 완료!");

		  return "redirect:/board/board";
		  
	    }else {
	    	boardservice.boardWrite(board);

		    logger.info("글 작성 완료!");

		    return "redirect:/board/board";
	    }

	    
	}
	

}
