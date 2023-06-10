package com.recipe.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.recipe.model.BoardVO;

public interface BoardMapper {
		
	//게시글 글작성
	public void boardWrite(BoardVO board) throws Exception;
	
	//게시판에 게시글 불러오기(최신순)
	public List<BoardVO> findWriteAll()throws Exception;
	
	//게시판에 게시글 불러오기(추천순)
	public List<BoardVO> findWriteAllGood()throws Exception;
	
	//게시판에 게시글 불러오기(조회순)
	public List<BoardVO> findWriteAllView()throws Exception;
	
	//게시글 조회
	public List<BoardVO> viewWrite(@Param("recipe_num") int recipe_num)throws Exception;
	
	//게시글 조회증가
	public void viewUpdate(int recipe_num)throws Exception;
	
	//조회수 유지하기
	public void viewBack(int recipe_num)throws Exception;
	
	//추천수 증가
	public void goodUpdate(int recipe_num)throws Exception;
	
	//추천수 감소
	public void goodBack(int recipe_num)throws Exception;
	
	//댓글 수 증가
	public void commentUpdate(int recipe_num)throws Exception;
	
	//댓글 수 감소 
	public void commentBack(int recipe_num)throws Exception;
}
