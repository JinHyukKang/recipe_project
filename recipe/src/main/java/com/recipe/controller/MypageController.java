package com.recipe.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.recipe.model.BoardVO;
import com.recipe.model.CommentVO;
import com.recipe.model.Criteria;
import com.recipe.model.MemberVO;
import com.recipe.model.PageVO;
import com.recipe.service.BoardService;
import com.recipe.service.CommentService;
import com.recipe.service.MypageService;


@Controller
@RequestMapping(value="/MyPage/*")
public class MypageController {
   
   private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
   
   @Autowired
   private MypageService mypageservice;
   
   @Autowired
   private BoardService boardservice;
   
   @Autowired
   private CommentService commentservice;
   
  //마이페이지 접속
   @RequestMapping(value="/MyPage", method = RequestMethod.GET)
   public  String MyPagepop(HttpSession session, Model model) throws Exception {
      
      logger.info("마이페이지 접속");

      String user_id = (String) session.getAttribute("user_id");
      
      List<MemberVO> findUser = mypageservice.findUser(user_id);
   
      model.addAttribute("findUser", findUser);
      return "/MyPage/MyPage";
   }
   
   //내 게시물 이동
   @RequestMapping(value="/MyPagePost", method = RequestMethod.GET)
   public String MyPagePost(HttpSession session, Model model, 
		   @RequestParam(defaultValue = "1") int pageNum, 
		   @RequestParam(defaultValue = "10") int amount) throws Exception {
       logger.info("내 게시물 접속");
      
       int user_num = (int) session.getAttribute("user_num");
       List<BoardVO> findWrite = mypageservice.findWrite(user_num);
      
       model.addAttribute("findWrite", findWrite);
       
       //페이징 기능
       //페이지에서 가져올 전체 게시글 개수
       int total = boardservice.countWriteUser(user_num);
       
       Criteria cri = new Criteria(pageNum, amount); // pageNum과 amount 값을 설정한 Criteria 객체 생성
      
       model.addAttribute("page", new PageVO(cri, total));
      
       return "/MyPage/MyPagePost";
   }

   //회원정보 수정하기
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
	   
	   
	   String user_id = (String) session.getAttribute("user_id");
	   
	   logger.info("user_pass: " + user_pass);
	   logger.info("user_email: " + user_email);
	   logger.info("user_postcode: " + user_postcode);
	   logger.info("user_addr: " + user_addr);
	   logger.info("user_detailaddr: " + user_detailaddr);
	   logger.info("user_extraaddr: " + user_extraaddr);
	   
	   mypageservice.updateMember(user_pass, user_email, user_postcode, user_addr, user_detailaddr, user_extraaddr, user_id);
	   
	   logger.info("회원정보 수정 완료!");
	   
       return "redirect:/MyPage/MyPage"; //
   }
   
   //회원탈퇴 팝업 이동
   @RequestMapping(value="/memberout", method = RequestMethod.GET)
   public  String memberoutPage() throws Exception{
	   
	   logger.info("회원탈퇴 완료!");
	   
	   return "/MyPage/memberout";
   }
   
   //회원탈퇴
   @ResponseBody
   @RequestMapping(value="/memberout.do", produces="text/html; charset=UTF-8", method = RequestMethod.POST)
   public  String memberout(HttpSession session,
		   					@RequestParam("user_id") String user_id,
		   					@RequestParam("user_pass") String user_pass) throws Exception{
	   
	   List<MemberVO> findUser = mypageservice.findUser(user_id);
	   
	   String data_user_id = findUser.get(0).getUser_id();
	   String data_user_pass = findUser.get(0).getUser_pass();
	   
	   String message="";
	   
	   if(!user_id.equals(data_user_id) || !user_pass.equals(data_user_pass)) {
		   
		   message = "<script>";
		   message += "alert('아이디 혹은 비밀번호가 맞지 않습니다.');";
		   message += "location.href='/MyPage/memberout';";
		   message += "</script>";
		  
	   }else {
		   mypageservice.memberout(user_id, user_pass);
		   
		   message = "<script>";
		   message += "alert('회원탈퇴가 정상적으로 완료되었습니다!');";
		   message += "window.close();";
		   message += "window.opener.location.href = '/';"; //홈 화면으로 이동
		   message += "</script>";
		   
		   session.invalidate();
		   
		   logger.info("회원탈퇴 완료!");
	   }
	   
	   return message;
   }
   
   //마이페이지 게시글 상세보기 이동
   @RequestMapping(value="/MyPageView", method = RequestMethod.GET)
   public String mypageView(BoardVO board,
		   					Model model,
		   					HttpSession session,
		   					@RequestParam("recipe_num") int recipe_num) throws Exception {
	   
	   int user_num = (int) session.getAttribute("user_num");
	   
		// user가 작성한 게시글중 recipe_num과 일치하는 게시글 가져오기
		List<BoardVO> mypageView = boardservice.mypageView(recipe_num, user_num);

		// 불러온 해당 게시글 데이터 model에 저장
		model.addAttribute("mypageView", mypageView);

		// 댓글 데이터 불러오기
		List<CommentVO> commentView = commentservice.commentView(recipe_num);
		model.addAttribute("commentView", commentView);
		
		//다음글 데이터 가져오기
		List<BoardVO> mypageNext = boardservice.mypageNext(recipe_num, user_num);
		model.addAttribute("mypageNext",mypageNext);
		
		//이전글 데이터 가져오기
		List<BoardVO> mypagePrev = boardservice.mypagePrev(recipe_num, user_num);
		model.addAttribute("mypagePrev",mypagePrev);
	   
	   return "MyPage/MyPageView";
   }
   
   //게시글 삭제
   @ResponseBody
   @RequestMapping(value="/DeleteRecipe.do", method = RequestMethod.POST)
   public ResponseEntity<String> DeleteRecipe(BoardVO board,Model model,
		   						@RequestParam("recipe_num") int recipe_num)throws Exception{
	   
	   //게시글 삭제 메소드 호출
	   boardservice.DeleteRecipe(recipe_num);
	   
	   return ResponseEntity.ok("success");
	   
   }
   
   //마이페이지 게시글 수정 페이지 이동
   @RequestMapping(value = "/MyPageUpdate", method = RequestMethod.GET)
   public String MyPageUpdate(BoardVO board,
				Model model,
				HttpSession session,
				@RequestParam("recipe_num") int recipe_num)throws Exception{
	   
		int user_num = (int) session.getAttribute("user_num");

		// user가 작성한 게시글중 recipe_num과 일치하는 게시글 가져오기
		List<BoardVO> mypageView = boardservice.mypageView(recipe_num, user_num);

		// 불러온 해당 게시글 데이터 model에 저장
		model.addAttribute("mypageView", mypageView);

		logger.info("마이페이지 수정 이동!");

		return "/MyPage/MyPageUpdate";
   }
   
  //마이페이지 게시글 수정 기능
  @ResponseBody
  @RequestMapping(value = "/MyPageUpdate.do", produces="text/html; charset=UTF-8", method = RequestMethod.POST)
  public String MyPageUpdateDo(BoardVO board,
		  						Model model,
		  						HttpSession session,
		  						@RequestParam("recipe_num") int recipe_num,
		  						@RequestParam("recipeFile") MultipartFile file,
		  						@RequestParam("recipe_title") String recipe_title,
		  						@RequestParam("recipe_content") String recipe_content)throws Exception{
	  	
		int user_num = (int) session.getAttribute("user_num");
		String message = "";
		
		// 이미지 파일 업로드
		if (!file.isEmpty()) {
			String real_fileName = file.getOriginalFilename();// 업로드한 파일 이름 받아오기
			long size = file.getSize(); // 업로드한 파일 크기 받아오기
			String fileExtension = real_fileName.substring(real_fileName.lastIndexOf("."), real_fileName.length());
																													

			// 업로드 파일명 중복을 방지하기 위해 임의의 파일명 부여
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String fileName = uuids[0];

			// 파일 저장 경로 설정
			String uploadPath = "D:/spring_project/recipe/recipe/src/main/webapp/resources/upload/";
			String filePath = uploadPath + fileName + fileExtension;
			// 설정한 경로로 이미지 파일 저장
			file.transferTo(new File(filePath));
			
			boardservice.recipeUpdateImg(recipe_num, user_num, recipe_title,fileName, real_fileName, filePath, recipe_content);
			
			message = "<script>";
			message += "alert('게시글수정이 완료되었습니다.');";
			message += "location.href='/MyPage/MyPagePost';";
			message += "</script>";
		} else {
			
			boardservice.recipeUpdate(recipe_num, user_num, recipe_title, recipe_content);
			
			message = "<script>";
			message += "alert('게시글수정이 완료되었습니다.');";
			message += "location.href='/MyPage/MyPagePost';";
			message += "</script>";
		}
	return message;
  }
   
   
   
   
   
   
   
   
   
   
}