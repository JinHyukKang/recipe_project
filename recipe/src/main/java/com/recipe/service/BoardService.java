package com.recipe.service;

import com.recipe.model.BoardVO;
import com.recipe.model.UploadVO;

public interface BoardService {
	
	// ���ۼ�
	public void boardWrite(BoardVO board) throws Exception;
	
	//�̹��� ���� DB�� ����
	public void insertFile(UploadVO upload, int recipe_num) throws Exception;
}
