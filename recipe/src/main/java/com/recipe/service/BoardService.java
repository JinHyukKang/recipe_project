package com.recipe.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.recipe.model.BoardVO;


public interface BoardService {
	
	//게시글 작성
	public void boardWrite(BoardVO board) throws Exception;
	
	//게시글 불러오기(최신순)
	public List<BoardVO> findWriteAll()throws Exception;
	
	//게시글 불러오기(추천순)
	public List<BoardVO> findWriteAllGood()throws Exception;
	
	//게시글 불러오기(조회순)
	public List<BoardVO> findWriteAllView()throws Exception;
	
	//게시글 조회
	public List<BoardVO> viewWrite(int recipe_num)throws Exception;
	
	
	
}
