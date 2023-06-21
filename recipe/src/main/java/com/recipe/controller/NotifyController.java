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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.recipe.model.BoardVO;
import com.recipe.model.Criteria;
import com.recipe.model.NotifyVO;
import com.recipe.model.PageVO;
import com.recipe.service.NotifyService;



@Controller
@RequestMapping(value="/Notify/*")
public class NotifyController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private NotifyService notifyservice;
	
	
	//공지사항 이동
	@RequestMapping(value="/Notify", method = RequestMethod.GET)
	public String Notify(HttpSession session, Model model,
			 @RequestParam(defaultValue = "1") int pageNum, 
			   @RequestParam(defaultValue = "10") int amount)throws Exception{
		
		
		//공지사항데이터 불러오기
		List<NotifyVO> findNotify = notifyservice.findNotify();
		model.addAttribute("findNotify", findNotify);

		// 페이징 기능
		// 페이지에서 가져올 전체 게시글 개수
		int total = notifyservice.countNotify();

		Criteria cri = new Criteria(pageNum, amount);

		model.addAttribute("page", new PageVO(cri, total));
		logger.info("공지사항페이지 이동");
		
		
		return "/Notify/Notify";
	 }
	
	//공지사항작성 페이지 이동
	@RequestMapping(value="/NotifyWrite", method = RequestMethod.GET)
	public String NotifyWrite(HttpSession session, Model model)throws Exception{
		
		
		
		logger.info("공지사항글쓰기 이동");
		
		return "/Notify/NotifyWrite";
	 }
	
	//공지사항 작성
	@ResponseBody
	@RequestMapping(value = "/write.do", produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public String boardWrite(NotifyVO notify,
							 @RequestParam("notifyFile") MultipartFile file,
							 HttpSession session
							 )throws Exception {
		
		// 세션에서 user_nickname, user_num 받아오기
	    String user_nickname = (String) session.getAttribute("user_nickname");
	    int user_num = (int) session.getAttribute("user_num");

	    // user_nickname, user_num BoardVO에 넣기
	    notify.setUser_nickname(user_nickname);
	    notify.setUser_num(user_num);

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
	      String uploadPath = "D:/spring_project/recipe/recipe/src/main/webapp/resources/upload/";
	      String filePath = uploadPath + fileName + fileExtension;
	      //설정한 경로로 이미지 파일 저장
	      file.transferTo(new File(filePath));
	      
	      //BoadVO에 user가 설정한 파일명, 임의로 부가한 파일명, 파일 저장 경로 설정
	      notify.setNotify_realname(real_fileName);
	      notify.setNotify_filename(real_fileName);
	      notify.setFile_path(filePath);
	      
	      notifyservice.notifyWrite(notify);

		  logger.info("게시판 글 작성 완료!");
		  
		  String message = "<script>";
		  message += "alert( '글작성이 정상적으로 완료되었습니다!');";
		  message += "location.href='/Notify/Notify';";
		  message += "</script>";

		  return message;
		  
	    }else {
	    	notifyservice.notifyWrite(notify);

		    logger.info("게시판 글 작성 완료!");
		    
		    String message = "<script>";
			message += "alert( '글작성이 정상적으로 완료되었습니다!');";
			message += "location.href='/Notify/Notify';";
			message += "</script>";

		    return message;
	    }

	    
	}
	
	//공지사항상세보기 페이지 이동
	@RequestMapping(value="/NotifyView", method = RequestMethod.GET)
	public String NotifyView(Model model,
							@RequestParam("notify_num") int notify_num)throws Exception{
		
		//공지사항 상세보기 데이터 불러오기
		List<NotifyVO> notifyView = notifyservice.notifyView(notify_num);
		model.addAttribute("notifyView",notifyView);
		
		
		logger.info("공지사항상세보기 이동");
		
		return "/Notify/NotifyView";
	 }
	
	//공지사항삭제
	@ResponseBody
	@RequestMapping(value="/DeleteNotify.do",produces="text/html; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<String> DeleteNotify(@RequestParam("notify_num") int notify_num)throws Exception{
		
		//공지사항 삭제 메소드
		notifyservice.DeleteNotify(notify_num);
		
		return ResponseEntity.ok("success");
	}
	
	
	
}
