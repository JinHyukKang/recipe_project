package com.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.BoardMapper;
import com.recipe.model.MemberVO;
import com.recipe.model.BoardVO;
import com.recipe.model.GoodVO;



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
	
	//추천 데이터 추가
	public void goodInsert(GoodVO good)throws Exception{
		boardmapper.goodInsert(good);
	}
	
	//추천 데이터 불러오기
	public List<GoodVO> goodGet(@Param("recipe_num") int recipe_num,@Param("user_num") int user_num)throws Exception{
		return boardmapper.goodGet(recipe_num,user_num);
	}
	
	//추천 데이터 삭제
	public void goodDelete(@Param("recipe_num") int recipe_num,@Param("user_num") int user_num )throws Exception{
		boardmapper.goodDelete(recipe_num, user_num);
	}
	
	//댓글 수 증가
	public void commentUpdate(int recipe_num)throws Exception{
		boardmapper.commentUpdate(recipe_num);
	}
	
	//댓글 수 감소 
	public void commentBack(int recipe_num)throws Exception{
		boardmapper.commentBack(recipe_num);
	}
		
	//다음글 가져오기(최신순)
	public List<BoardVO> nextPageDate(int recipe_num)throws Exception{
		return boardmapper.nextPageDate(recipe_num);
	}
	
	//다음글 가져오기(추천순)
	public List<BoardVO> nextPageGood(int recipe_num)throws Exception{
		return boardmapper.nextPageGood(recipe_num);
	}
	
	//다음글 가져오기(조회순)
	public List<BoardVO> nextPageView(int recipe_num)throws Exception{
		return boardmapper.nextPageView(recipe_num);
	}
	
	//이전글 가져오기(최신순)
	public List<BoardVO> prevPageDate(int recipe_num)throws Exception{
		return boardmapper.prevPageDate(recipe_num);
	}
	
	//이전글 가져오기(추천순)
	public List<BoardVO> prevPageGood(int recipe_num)throws Exception{
		return boardmapper.prevPageGood(recipe_num);
	}
	
	//이전글 가져오기(조회순)
	public List<BoardVO> prevPageView(int recipe_num)throws Exception{
		return boardmapper.prevPageView(recipe_num);
	}
	
	//게시물 검색결과 가져오기
	public List<BoardVO> searchWrite(String keyword)throws Exception{
		return boardmapper.searchWrite(keyword);
	}
	
	//마이페이지 게시글 상세보기
	public List<BoardVO> mypageView(int recipe_num, int user_num)throws Exception{
		return boardmapper.mypageView(recipe_num, user_num);
	}
	
	//마이페이지 게시글 상세보기(다음글)
	public List<BoardVO> mypageNext(@Param("recipe_num") int recipe_num, @Param("user_num") int user_num)throws Exception{
		return boardmapper.mypageNext(recipe_num, user_num);
	}
	
	//마이페이지 게시글 상세보기(이전글)
	public List<BoardVO> mypagePrev(@Param("recipe_num") int recipe_num, @Param("user_num") int user_num)throws Exception{
		return boardmapper.mypagePrev(recipe_num, user_num);
	}
	
	//게시글 전체 개수 불러오기
	public int countWrite()throws Exception{
		return boardmapper.countWrite();
	}
	//user가 작성한 게시글 개수 불러오기
	public int countWriteUser(@Param("user_num") int user_num) throws Exception{
		return boardmapper.countWriteUser(user_num);
	}
	//게시글 삭제(마이페이지에서)
	public void DeleteRecipe(@Param("recipe_num") int recipe_num)throws Exception{
		boardmapper.DeleteRecipe(recipe_num);
	}
	
	//마이페이지 게시글 수정(이미지 포함)
	public void recipeUpdateImg(@Param("recipe_num") int recipe_num, @Param("user_num")int user_num,
								String recipe_title, String recipe_filename, String recipe_realname, String file_path, String recipe_content)throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		map.put("recipe_num",recipe_num);
		map.put("user_num",user_num);
		map.put("recipe_title", recipe_title);
		map.put("recipe_filename", recipe_filename);
		map.put("recipe_realname", recipe_realname);
		map.put("file_path", file_path);
		map.put("recipe_content", recipe_content);
		
		boardmapper.recipeUpdateImg(map);
	}
	
	//마이페이지 게시글 수정(이미지 미포함)
	public void recipeUpdate(@Param("recipe_num") int recipe_num, @Param("user_num")int user_num,
							String recipe_title, String recipe_content)throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		map.put("recipe_num",recipe_num);
		map.put("user_num",user_num);
		map.put("recipe_title", recipe_title);
		map.put("recipe_content", recipe_content);
		
		boardmapper.recipeUpdate(map);
	}
}
