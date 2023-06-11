package com.recipe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.recipe.model.CommentVO;

public interface CommentMapper {
	
	//댓글 작성
	public void commentWrite(CommentVO board) throws Exception;
	
	//댓글 불러오기
	public List<CommentVO> commentView(int recipe_num)throws Exception;
	
	//댓글 수정
	public void commentUpdate(@Param("comment_num") int comment_num,@Param("comment_content_update") String comment_content_update)throws Exception;
	
	//댓글 삭제
	public void commentDel(@Param("comment_num") int comment_num)throws Exception; 
}
