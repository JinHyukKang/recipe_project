package com.recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.BoardMapper;
import com.recipe.model.MemberVO;
import com.recipe.model.UploadVO;
import com.recipe.model.BoardVO;



@Service
public class BoardServiceImple implements BoardService {
	@Autowired
	BoardMapper boardmapper;
	
	//글작성
	public void boardWrite(BoardVO board) throws Exception{
		boardmapper.boardWrite(board);
	}
	
	//이미지 파일 DB에 저장
	public void insertFile(UploadVO upload, int recipe_num) throws Exception{
		upload.setRecipe_num(recipe_num);
		boardmapper.insertFile(upload);
	}

}
