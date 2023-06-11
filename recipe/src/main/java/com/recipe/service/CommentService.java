package com.recipe.service;

import java.util.List;


import com.recipe.model.CommentVO;

public interface CommentService {
	
	//댓글 작성
	public void commentWrite(CommentVO board) throws Exception;
	
	//댓글 불러오기
	public List<CommentVO> commentView(int recipe_num)throws Exception;
	
	//댓글 수정
	public void commentUpdate(int comment_num, String comment_content_update)throws Exception;
	
	//댓글 삭제
	public void commentDel(int comment_num)throws Exception; 
}
