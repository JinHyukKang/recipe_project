package com.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.NotifyMapper;
import com.recipe.model.NotifyVO;

@Service
public class NotifyServiceImple implements NotifyService {
	
	@Autowired
	NotifyMapper notifymapper;
	
	//공지사항 글작성
	public void notifyWrite(NotifyVO notify)throws Exception{
		notifymapper.notifyWrite(notify);
	}
	
	//공지사항 데이터 불러오기
	public List<NotifyVO> findNotify()throws Exception{
		return notifymapper.findNotify();
	}
	//공지사항 개수 불러오기
	public int countNotify()throws Exception{
		return notifymapper.countNotify();
	}
	
	//공지사항 상세보기 데이터 불러오기
	public List<NotifyVO> notifyView(@Param("notify_num") int notify_num)throws Exception{
		return notifymapper.notifyView(notify_num);
	}
	
	//공지사항 삭제하기
	public void DeleteNotify(@Param("notify_num") int notify_num)throws Exception{
		notifymapper.DeleteNotify(notify_num);
	}
	
	//공지사항 수정하기(이미지포함)
	public void notifyUpdateImg(@Param("notify_num") int notify_num, String notify_title, String notify_filename, 
								String notify_realname, String file_path, String notify_content)throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("notify_num",notify_num);
		map.put("notify_title", notify_title);
		map.put("notify_filename", notify_filename);
		map.put("notify_realname", notify_realname);
		map.put("file_path", file_path);
		map.put("notify_content", notify_content);
		
		notifymapper.notifyUpdateImg(map);
	}
		
	//공지사항 수정하기(이미지미포함)
	public void notifyUpdate(@Param("notify_num") int notify_num, String notify_title, String notify_content)throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("notify_num",notify_num);
		map.put("notify_title", notify_title);
		map.put("notify_content", notify_content);
		
		notifymapper.notifyUpdate(map);
	}

	
	
	
}









