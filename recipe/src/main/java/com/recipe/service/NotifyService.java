package com.recipe.service;

import java.util.List;

import com.recipe.model.NotifyVO;

public interface NotifyService {

	//공지사항 글작성
	public void notifyWrite(NotifyVO notify)throws Exception;
	
	//공지사항 데이터 불러오기
	public List<NotifyVO> findNotify()throws Exception;
	
	//공지사항 개수 불러오기
	public int countNotify()throws Exception;
}
