package com.recipe.mapper;

import com.recipe.model.BoardVO;
import com.recipe.model.UploadVO;

public interface BoardMapper {
		
	//글작성
	public void boardWrite(BoardVO board) throws Exception;
	
	//이미지 파일 DB에 저장
	public void insertFile(UploadVO upload) throws Exception;
}
