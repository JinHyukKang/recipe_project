package com.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import com.recipe.model.CommentVO;
import com.recipe.model.MemberVO;
import com.recipe.service.BoardService;
import com.recipe.service.CommentService;
import com.recipe.service.MypageService;


@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardservice;
	
	@Autowired
	private CommentService commentservice;
	
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
	      String uploadPath = "D:/kjh_spring/recipe/recipe/src/main/webapp/resources/upload/";
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
	public String viewWriteDate(HttpServletRequest request,
							Model model,
							@RequestParam("recipe_num") int recipe_num
							)throws Exception{
		
		HttpSession session = request.getSession();
	    String sessionKey = "goodStatus_" + recipe_num;
		
		//조회수 증가
		boardservice.viewUpdate(recipe_num);
		
		//게시글 데이터 불러오기
		List<BoardVO> viewWrite = boardservice.viewWrite(recipe_num);
		model.addAttribute("viewWrite", viewWrite);	
		
		//댓글 데이터 불러오기
		List<CommentVO> commentView = commentservice.commentView(recipe_num);
		model.addAttribute("commentView",commentView);
		
		// 세션에서 추천 상태 가져오기
	    String goodStatus = (String) session.getAttribute(sessionKey);
	    model.addAttribute("goodStatus", goodStatus);
	    
	    //다음글 데이터 가져오기(최신순)
	    List<BoardVO> nextPage = boardservice.nextPageDate(recipe_num);
	    model.addAttribute("nextPage",nextPage);
	    
	    //이전글 데이터 가져오기(최신순)
	    List<BoardVO> prevPage = boardservice.prevPageDate(recipe_num);
	    model.addAttribute("prevPage",prevPage);
	    
		
		return "board/ViewWriteDate";
	}
	
	//게시글 조회(추천순)
	@RequestMapping(value = "/ViewWriteGood", method = RequestMethod.GET)
	public String viewWriteGood(HttpServletRequest request,
							Model model,
							@RequestParam("recipe_num") int recipe_num
							)throws Exception{
		
		HttpSession session = request.getSession();
	    String sessionKey = "goodStatus_" + recipe_num;
		
		//조회수 증가
		boardservice.viewUpdate(recipe_num);
		
		//게시글 데이터 불러오기
		List<BoardVO> viewWrite = boardservice.viewWrite(recipe_num);
		model.addAttribute("viewWrite", viewWrite);	
		
		//댓글 데이터 불러오기
		List<CommentVO> commentView = commentservice.commentView(recipe_num);
		model.addAttribute("commentView",commentView);
		
		// 세션에서 추천 상태 가져오기
	    String goodStatus = (String) session.getAttribute(sessionKey);
	    model.addAttribute("goodStatus", goodStatus);
		
	    //다음글 데이터 가져오기(추천순)
	    List<BoardVO> nextPage = boardservice.nextPageGood(recipe_num);
	    model.addAttribute("nextPage",nextPage);
	    
	    //이전글 데이터 가져오기(추천순)
	    List<BoardVO> prevPage = boardservice.prevPageGood(recipe_num);
	    model.addAttribute("prevPage",prevPage);
	    
		return "board/ViewWriteGood";
	}
	
	//게시글 조회(조회순)
	@RequestMapping(value = "/ViewWriteView", method = RequestMethod.GET)
	public String viewWriteView(HttpServletRequest request,
							Model model,
							@RequestParam("recipe_num") int recipe_num
							)throws Exception{
		
		HttpSession session = request.getSession();
	    String sessionKey = "goodStatus_" + recipe_num;
		
		//조회수 증가
		boardservice.viewUpdate(recipe_num);
		
		//게시글 데이터 불러오기
		List<BoardVO> viewWrite = boardservice.viewWrite(recipe_num);
		model.addAttribute("viewWrite", viewWrite);	
		
		//댓글 데이터 불러오기
		List<CommentVO> commentView = commentservice.commentView(recipe_num);
		model.addAttribute("commentView",commentView);
		
		// 세션에서 추천 상태 가져오기
	    String goodStatus = (String) session.getAttribute(sessionKey);
	    model.addAttribute("goodStatus", goodStatus);
		
	    //다음글 데이터 가져오기(조회순)
	    List<BoardVO> nextPage = boardservice.nextPageView(recipe_num);
	    model.addAttribute("nextPage",nextPage);
	    
	    //이전글 데이터 가져오기(조회순)
	    List<BoardVO> prevPage = boardservice.prevPageView(recipe_num);
	    model.addAttribute("prevPage",prevPage);
	
		
		return "board/ViewWriteView";
	}
	
	
	//추천수 증가(최신순)
	@RequestMapping(value="/Good.do", method = RequestMethod.POST)
	public ResponseEntity<String> Good(HttpServletRequest request,
						@RequestParam("recipe_num") int recipe_num,
						@RequestParam("status") String status
						)throws Exception{
		
		HttpSession session = request.getSession();
	    String sessionKey = "goodStatus_" + recipe_num;
		
		
		if(status.equals("good")) {		//추천을 하려는 경우
			
			session.setAttribute(sessionKey, "good");
			//추천수 증가
			boardservice.goodUpdate(recipe_num);
			
			return ResponseEntity.ok("good");
			
		}else {	//추천을 취소하는 경우
			
			session.setAttribute(sessionKey, "notgood");
			//추천수 감소
			boardservice.goodBack(recipe_num);
			
			return ResponseEntity.ok("notgood");
		}
		
		
	}
	
	//댓글 작성(최신순)
	@ResponseBody
	@RequestMapping(value="/commentWriteDate.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public String commentWriteDate(HttpSession session,
							CommentVO comment,
							@RequestParam("recipe_num") int recipe_num,
							@RequestParam("comment_content") String comment_content)
							throws Exception{
		String message="";
		
		//조회수 다시 1 감소
		boardservice.viewBack(recipe_num);
		
		if(!comment_content.equals("")) {
			String user_nickname = (String) session.getAttribute("user_nickname");
			int user_num = (int) session.getAttribute("user_num");
			
			comment.setUser_nickname(user_nickname);
			comment.setUser_num(user_num);
			comment.setRecipe_num(recipe_num);
			comment.setComment_content(comment_content);
			
			commentservice.commentWrite(comment);
			
			//댓글 수 증가
			boardservice.commentUpdate(recipe_num);
			
			message += "<script>";
		    message += "alert( '댓글작성이 정상적으로 완료되었습니다!');";
		    message += "location.href='/board/ViewWriteDate?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
		    
		}else {
			message += "<script>";
		    message += "alert( '댓글을 작성해 주세요.');";
		    message += "location.href='/member/login';";
		    message += "location.href='/board/ViewWriteDate?recipe_num=" + recipe_num + "';";
		    message += "</script>";
		    
		    return message;
		}
		
		
	}
	
	//댓글 작성(추천순)
	@ResponseBody
	@RequestMapping(value="/commentWriteGood.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public String commentWrite(HttpSession session,
							CommentVO comment,
							@RequestParam("recipe_num") int recipe_num,
							@RequestParam("comment_content") String comment_content)
							throws Exception{
		String message="";
		
		//조회수 다시 1 감소
		boardservice.viewBack(recipe_num);
		
		if(!comment_content.equals("")) {
			String user_nickname = (String) session.getAttribute("user_nickname");
			int user_num = (int) session.getAttribute("user_num");
			
			comment.setUser_nickname(user_nickname);
			comment.setUser_num(user_num);
			comment.setRecipe_num(recipe_num);
			comment.setComment_content(comment_content);
			
			commentservice.commentWrite(comment);
			
			//댓글 수 증가
			boardservice.commentUpdate(recipe_num);
			
			message += "<script>";
		    message += "alert( '댓글작성이 정상적으로 완료되었습니다!');";
		    message += "location.href='/board/ViewWriteGood?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
		    
		}else {
			message += "<script>";
		    message += "alert( '댓글을 작성해 주세요.');";
		    message += "location.href='/member/login';";
		    message += "location.href='/board/ViewWriteGood?recipe_num=" + recipe_num + "';";
		    message += "</script>";
		    
		    return message;
		}
			
			
		}
		
	//댓글 작성(조회순)
	@ResponseBody
	@RequestMapping(value="/commentWriteView.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public String commentWriteView(HttpSession session,
							CommentVO comment,
							@RequestParam("recipe_num") int recipe_num,
							@RequestParam("comment_content") String comment_content)
							throws Exception{
		String message="";
		
		//조회수 다시 1 감소
		boardservice.viewBack(recipe_num);
		
		if(!comment_content.equals("")) {
			String user_nickname = (String) session.getAttribute("user_nickname");
			int user_num = (int) session.getAttribute("user_num");
			
			comment.setUser_nickname(user_nickname);
			comment.setUser_num(user_num);
			comment.setRecipe_num(recipe_num);
			comment.setComment_content(comment_content);
			
			commentservice.commentWrite(comment);
			
			//댓글 수 증가
			boardservice.commentUpdate(recipe_num);
			
			message += "<script>";
		    message += "alert( '댓글작성이 정상적으로 완료되었습니다!');";
		    message += "location.href='/board/ViewWriteView?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
		    
		}else {
			message += "<script>";
		    message += "alert( '댓글을 작성해 주세요.');";
		    message += "location.href='/board/ViewWriteView?recipe_num=" + recipe_num + "';";
		    message += "</script>";
		    
		    return message;
		}
		
		
	}
	
	//댓글 수정(최신순)
	@ResponseBody
	@RequestMapping(value="/commentUpdateDate.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public String commentUpdateDate(@RequestParam("comment_num") int comment_num,
								@RequestParam("comment_content_update") String comment_content_update,
								@RequestParam("recipe_num") int recipe_num,
								CommentVO comment)throws Exception{
		
		String message="";
		
		if(!comment_content_update.equals("")) {
			//조회수 다시 1 감소
			boardservice.viewBack(recipe_num);
			
			comment.setComment_content(comment_content_update);
			
			//해당 댓글 수정
			commentservice.commentUpdate(comment_num, comment_content_update);
			
			message += "<script>";
		    message += "alert( '댓글 수정이 정상적으로 완료되었습니다!');";
		    message += "location.href='/board/ViewWriteDate?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
			
		}else {
			message += "<script>";
		    message += "alert( '수정하실 댓글을 입력해주세요.');";
		    message += "location.href='/board/ViewWriteDate?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
		}
		
		
		
	}
	//댓글 수정(추천순)
	@ResponseBody
	@RequestMapping(value="/commentUpdateGood.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public String commentUpdateGood(@RequestParam("comment_num") int comment_num,
								@RequestParam("comment_content_update") String comment_content_update,
								@RequestParam("recipe_num") int recipe_num,
								CommentVO comment)throws Exception{
		
		String message="";
		
		if(!comment_content_update.equals("")) {
			//조회수 다시 1 감소
			boardservice.viewBack(recipe_num);
			
			comment.setComment_content(comment_content_update);
			
			//해당 댓글 수정
			commentservice.commentUpdate(comment_num, comment_content_update);
			
			message += "<script>";
		    message += "alert( '댓글 수정이 정상적으로 완료되었습니다!');";
		    message += "location.href='/board/ViewWriteGood?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
			
		}else {
			message += "<script>";
		    message += "alert( '수정하실 댓글을 입력해주세요.');";
		    message += "location.href='/board/ViewWriteGood?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
		}
		
		
	}
	
	//댓글 수정(조회순)
	@ResponseBody
	@RequestMapping(value="/commentUpdateView.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public String commentUpdateView(@RequestParam("comment_num") int comment_num,
								@RequestParam("comment_content_update") String comment_content_update,
								@RequestParam("recipe_num") int recipe_num,
								CommentVO comment)throws Exception{
		
		String message="";

		if(!comment_content_update.equals("")) {
			//조회수 다시 1 감소
			boardservice.viewBack(recipe_num);
			
			comment.setComment_content(comment_content_update);
			
			//해당 댓글 수정
			commentservice.commentUpdate(comment_num, comment_content_update);
			
			message += "<script>";
		    message += "alert( '댓글 수정이 정상적으로 완료되었습니다!');";
		    message += "location.href='/board/ViewWriteView?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
			
		}else {
			message += "<script>";
		    message += "alert( '수정하실 댓글을 입력해주세요.');";
		    message += "location.href='/board/ViewWriteView?recipe_num=" + recipe_num + "';";
		    message += "</script>";
			
		    return message;
		}
		
		
	}
	
	//댓글 삭제(최신순)
	@ResponseBody
	@RequestMapping(value="/commentDelDate.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> commentDelDate(@RequestParam("comment_num") int comment_num,
												@RequestParam("recipe_num") int recipe_num)
														throws Exception{
		
	
		
		//댓글 삭제 메서드 호출 
		commentservice.commentDel(comment_num);
		
	    //조회수 1 줄이기
		boardservice.commentBack(recipe_num);
		
	    return ResponseEntity.ok("success");
		
	}
	
	//댓글 삭제(추천순)
	@ResponseBody
	@RequestMapping(value="/commentDelGood.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> commentDelGood(@RequestParam("comment_num") int comment_num,
								@RequestParam("recipe_num") int recipe_num)
										throws Exception{
		
		//댓글 삭제 메서드 호출 
		commentservice.commentDel(comment_num);
		
	    //조회수 1 줄이기
		boardservice.commentBack(recipe_num);
		
	    return ResponseEntity.ok("success");
		
	}
	
	//댓글 삭제(조회순)
	@ResponseBody
	@RequestMapping(value="/commentDelView.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> commentDelView(@RequestParam("comment_num") int comment_num,
								@RequestParam("recipe_num") int recipe_num)
										throws Exception{
		
		//댓글 삭제 메서드 호출 
		commentservice.commentDel(comment_num);
		
	    //조회수 1 줄이기
		boardservice.commentBack(recipe_num);
		
	    return ResponseEntity.ok("success");
			
		}
}
