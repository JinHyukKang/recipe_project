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
	
	//���ۼ�
	public void boardWrite(BoardVO board) throws Exception{
		boardmapper.boardWrite(board);
	}
	
	//�Խñ� ��ü ��ȸ
	public List<BoardVO> findWriteAll()throws Exception{
		return boardmapper.findWriteAll();
	}
	
	//�Խñ� ��ü ��ȸ(��õ����)
	public List<BoardVO> findWriteAllGood()throws Exception{
		return boardmapper.findWriteAllGood();
	}
	
	//�Խñ� ��ü ��ȸ(��ȸ����)
	public List<BoardVO> findWriteAllView()throws Exception{
		return boardmapper.findWriteAllView();
	}

}
