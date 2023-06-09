package com.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	public String Board(Model model) throws Exception{
		
		//최신순, 조회순, 추천순 게시글 데이터 객체화
		List<BoardVO> findWriteAll = boardservice.findWriteAll();
		List<BoardVO> findWriteAllGood = boardservice.findWriteAllGood();
		List<BoardVO> findWriteAllView = boardservice.findWriteAllView();
		
		//최신순, 조회순, 추천순 게시글 데이터 model에 저장
		model.addAttribute("findWriteAll",findWriteAll);
		model.addAttribute("findWriteAllGood",findWriteAllGood);
		model.addAttribute("findWriteAllView",findWriteAllView);
		
		logger.info("글작성 페이지 이동!");
		
		return "board/board";
	}
	
	//게시판 글 작성 페이지 이동
	@RequestMapping(value = "/recipeWrite", method = RequestMethod.GET)
	public String recipeWrite() throws Exception{
		
		logger.info("글작성 페이지 이동!");
		
		return "board/recipeWrite";
	}
	
	// 글작성 controller
	@ResponseBody
	@RequestMapping(value = "/write.do", produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public String boardWrite(BoardVO board,
							 @RequestParam("recipeFile") MultipartFile file,
							 HttpSession session
							 )throws Exception {
		
		// 세션에서 user_nickname, user_num 받아오기
	    String user_nickname = (String) session.getAttribute("user_nickname");
	    int user_num = (int) session.getAttribute("user_num");

	    // user_nickname, user_num BoardVO에 넣기
	    board.setUser_nickname(user_nickname);
	    board.setUser_num(user_num);

	    // 이미지 파일 업로드
	    if (!file.isEmpty()) {
	      String real_fileName = file.getOriginalFilename();//업로드한 파일 이름 받아오기
	      long size = file.getSize(); //업로드한 파일 크기 받아오기
	      String fileExtension = real_fileName.substring(real_fileName.lastIndexOf("."),real_fileName.length());//파일 확장자 저장
	      
	      //업로드 파일명 중복을 방지하기 위해 임의의 파일명 부여
	      UUID uuid = UUID.randomUUID();
	      String[] uuids = uuid.toString().split("-");
	      String fileName = uuids[0];
	      
	      //파일 저장 경로 설정
	      String uploadPath = "C:/workspace/recipe/recipe/src/main/webapp/resources/upload/";
	      String filePath = uploadPath + fileName + fileExtension;
	      //설정한 경로로 이미지 파일 저장
	      file.transferTo(new File(filePath));
	      
	      //BoadVO에 user가 설정한 파일명, 임의로 부가한 파일명, 파일 저장 경로 설정
	      board.setRecipe_realname(real_fileName); 
	      board.setRecipe_filename(fileName);
	      board.setFile_path(filePath);
	      
	      boardservice.boardWrite(board);

		  logger.info("게시판 글 작성 완료!");
		  
		  String message = "<script>";
		  message += "alert( '글작성이 정상적으로 완료되었습니다!');";
		  message += "location.href='/board/board';";
		  message += "</script>";

		  return message;
		  
	    }else {
	    	boardservice.boardWrite(board);

		    logger.info("게시판 글 작성 완료!");
		    
		    String message = "<script>";
			message += "alert( '글작성이 정상적으로 완료되었습니다!');";
			message += "location.href='/board/board';";
			message += "</script>";

		    return message;
	    }

	    
	}
	
	//게시글 조회(최신순)
	@RequestMapping(value = "/ViewWriteDate", method = RequestMethod.GET)
	public String viewWriteDate(Model model,
							@RequestParam("recipe_num") int recipe_num
							)throws Exception{
		
		//조회수 증가
		boardservice.viewUpdate(recipe_num);
		
		//게시글 데이터 불러오기
		List<BoardVO> viewWrite = boardservice.viewWrite(recipe_num);
		model.addAttribute("viewWrite", viewWrite);	
		
		
		return "board/ViewWriteDate";
	}
	
	//게시글 조회(추천순)
	@RequestMapping(value = "/ViewWriteGood", method = RequestMethod.GET)
	public String viewWriteGood(Model model,
							@RequestParam("recipe_num") int recipe_num
							)throws Exception{
		
		//조회수 증가
		boardservice.viewUpdate(recipe_num);

		//게시글 데이터 불러오기
		List<BoardVO> viewWrite = boardservice.viewWrite(recipe_num);
		model.addAttribute("viewWrite", viewWrite);
		
		return "board/ViewWriteGood";
	}
	
	//게시글 조회(조회순)
	@RequestMapping(value = "/ViewWriteView", method = RequestMethod.GET)
	public String viewWriteView(Model model,
							@RequestParam("recipe_num") int recipe_num
							)throws Exception{
		
		//조회수 증가
		boardservice.viewUpdate(recipe_num);

		//게시글 데이터 불러오기
		List<BoardVO> viewWrite = boardservice.viewWrite(recipe_num);
		model.addAttribute("viewWrite", viewWrite);
		
	
		
		return "board/ViewWriteView";
	}
	
	//게시물 정보 업데이트
	@RequestMapping(value="/writeUpdate.do", method = RequestMethod.POST)
	public String writeUpdate(BoardVO board,
						@RequestParam("recipe_num") int recipe_num
						)throws Exception{
		
		
		
		return "redirect:/board/board";
	}
	
	//추천수 증가(최신순)
	@RequestMapping(value="/Good.do", method = RequestMethod.POST)
	public ResponseEntity<String> Good(Model model,
						@RequestParam("recipe_num") int recipe_num,
						@RequestParam("idValue") String idValue
						)throws Exception{
		System.out.println(idValue);
		if(idValue.equals("notgood")) {		//추천을 하려는 경우
			
			//추천수 증가
			boardservice.goodUpdate(recipe_num);
			
			//조회수 다시 감소
			boardservice.viewBack(recipe_num);
			
			return ResponseEntity.ok("good");
			
		}else {	//추천을 취소하는 경우
			
			//추천수 감소
			boardservice.goodBack(recipe_num);
			
			//조회수 다시 감소
			boardservice.viewBack(recipe_num);
			
			return ResponseEntity.ok("notgood");
		}
		
		
	}
	

}
