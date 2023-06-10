package com.recipe.mapper;

import java.util.List;

import com.recipe.model.CommentVO;

public interface CommentMapper {
	
	//댓글 작성
	public void commentWrite(CommentVO board) throws Exception;
	
	//댓글 불러오기
	public List<CommentVO> commentView(int recipe_num)throws Exception;
}
