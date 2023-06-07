package com.recipe.mapper;

import java.util.List;

import com.recipe.model.BoardVO;

public interface BoardMapper {
		
	//글작성
	public void boardWrite(BoardVO board) throws Exception;
	
	//게시글 전체 조회(최신순)
	public List<BoardVO> findWriteAll()throws Exception;
	
	//게시글 전체 조회(추천수순)
	public List<BoardVO> findWriteAllGood()throws Exception;
	
	//게시글 전체 조회(조회수순)
	public List<BoardVO> findWriteAllView()throws Exception;

}
