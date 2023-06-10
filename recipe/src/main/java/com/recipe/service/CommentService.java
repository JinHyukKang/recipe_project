package com.recipe.service;

import java.util.List;

import com.recipe.model.CommentVO;

public interface CommentService {
	
	//댓글 작성
	public void commentWrite(CommentVO board) throws Exception;
	
	//댓글 불러오기
	public List<CommentVO> commentView(int recipe_num)throws Exception;
}
