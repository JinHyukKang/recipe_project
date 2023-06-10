package com.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.CommentMapper;
import com.recipe.model.CommentVO;

@Service
public class CommentServiceImple implements CommentService {
	
	@Autowired
	CommentMapper commentmapper;
	
	//댓글 작성
	public void commentWrite(CommentVO board) throws Exception{
		commentmapper.commentWrite(board);
	}
	
	//댓글 불러오기
	public List<CommentVO> commentView(int recipe_num)throws Exception{
		return commentmapper.commentView(recipe_num);
	}
	
}
