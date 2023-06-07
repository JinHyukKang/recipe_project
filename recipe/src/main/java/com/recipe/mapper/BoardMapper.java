package com.recipe.mapper;

import java.util.List;

import com.recipe.model.BoardVO;

public interface BoardMapper {
		
	//���ۼ�
	public void boardWrite(BoardVO board) throws Exception;
	
	//�Խñ� ��ü ��ȸ(�ֽż�)
	public List<BoardVO> findWriteAll()throws Exception;
	
	//�Խñ� ��ü ��ȸ(��õ����)
	public List<BoardVO> findWriteAllGood()throws Exception;
	
	//�Խñ� ��ü ��ȸ(��ȸ����)
	public List<BoardVO> findWriteAllView()throws Exception;

}
