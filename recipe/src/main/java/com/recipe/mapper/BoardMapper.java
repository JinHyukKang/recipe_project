package com.recipe.mapper;

import com.recipe.model.BoardVO;
import com.recipe.model.UploadVO;

public interface BoardMapper {
		
	//���ۼ�
	public void boardWrite(BoardVO board) throws Exception;
	
	//�̹��� ���� DB�� ����
	public void insertFile(UploadVO upload) throws Exception;
}
