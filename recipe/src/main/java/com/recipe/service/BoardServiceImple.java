package com.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.BoardMapper;
import com.recipe.model.MemberVO;
import com.recipe.model.BoardVO;



@Service
public class BoardServiceImple implements BoardService {
	@Autowired
	BoardMapper boardmapper;
	
	//게시글 작성
	public void boardWrite(BoardVO board) throws Exception{
		boardmapper.boardWrite(board);
	}
	
	//게시글 불러오기(최신순)
	public List<BoardVO> findWriteAll()throws Exception{
		return boardmapper.findWriteAll();
	}
	
	//게시글 불러오기(추천순)
	public List<BoardVO> findWriteAllGood()throws Exception{
		return boardmapper.findWriteAllGood();
	}
	
	//게시글 불러오기(조회순)
	public List<BoardVO> findWriteAllView()throws Exception{
		return boardmapper.findWriteAllView();
	}
	
	//게시글 조회
	public List<BoardVO> viewWrite(int recipe_num)throws Exception{
		return boardmapper.viewWrite(recipe_num);
	}

	//게시글 정보 업데이트
	public void viewUpdate(int recipe_num)throws Exception{
		boardmapper.viewUpdate(recipe_num);
	}
	
	//조회수 유지하기
	public void viewBack(int recipe_num)throws Exception{
		boardmapper.viewBack(recipe_num);
	}
	
	//추천수 증가
	public void goodUpdate(int recipe_num)throws Exception{
		boardmapper.goodUpdate(recipe_num);
	}
	
	//추천수 감소
	public void goodBack(int recipe_num)throws Exception{
		boardmapper.goodBack(recipe_num);
	}
	
}
