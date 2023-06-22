package com.recipe.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.recipe.model.NotifyVO;

public interface NotifyService {

	//공지사항 글작성
	public void notifyWrite(NotifyVO notify)throws Exception;
	
	//공지사항 데이터 불러오기
	public List<NotifyVO> findNotify()throws Exception;
	
	//공지사항 개수 불러오기
	public int countNotify()throws Exception;
	
	//공지사항 상세보기 데이터 불러오기
	public List<NotifyVO> notifyView(@Param("notify_num") int notify_num)throws Exception;
	
	//공지사항 삭제하기
	public void DeleteNotify(@Param("notify_num") int notify_num)throws Exception;
	
	//공지사항 수정하기(이미지포함)
	public void notifyUpdateImg(@Param("notify_num") int notify_num,String notify_title, String notify_filename, 
			String notify_realname, String file_path, String notify_content)throws Exception;
		
	//공지사항 수정하기(이미지미포함)
	public void notifyUpdate(@Param("notify_num") int notify_num, String notify_title, String notify_content)throws Exception;
}
