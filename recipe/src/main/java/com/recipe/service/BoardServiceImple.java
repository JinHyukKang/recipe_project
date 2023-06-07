package com.recipe.service;

import java.util.List;

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

}
