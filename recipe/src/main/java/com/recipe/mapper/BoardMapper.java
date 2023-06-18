package com.recipe.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.recipe.model.BoardVO;
import com.recipe.model.GoodVO;

public interface BoardMapper {
		
	//게시글 글작성
	public void boardWrite(BoardVO board) throws Exception;
	
	//게시판에 게시글 불러오기(최신순)
	public List<BoardVO> findWriteAll()throws Exception;
	
	//게시판에 게시글 불러오기(추천순)
	public List<BoardVO> findWriteAllGood()throws Exception;
	
	//게시판에 게시글 불러오기(조회순)
	public List<BoardVO> findWriteAllView()throws Exception;
	
	//게시글 조회
	public List<BoardVO> viewWrite(@Param("recipe_num") int recipe_num)throws Exception;
	
	//게시글 조회증가
	public void viewUpdate(int recipe_num)throws Exception;
	
	//조회수 유지하기
	public void viewBack(int recipe_num)throws Exception;
	
	//추천수 증가
	public void goodUpdate(int recipe_num)throws Exception;
	
	//추천수 감소
	public void goodBack(int recipe_num)throws Exception;
	
	//추천 데이터 추가
	public void goodInsert(GoodVO good)throws Exception;
	
	//추천 데이터 불러오기
	public List<GoodVO> goodGet(@Param("recipe_num") int recipe_num,@Param("user_num") int user_num)throws Exception;
	
	//추천 데이터 삭제
	public void goodDelete(@Param("recipe_num") int recipe_num,@Param("user_num") int user_num )throws Exception;
	
	//댓글 수 증가
	public void commentUpdate(int recipe_num)throws Exception;
	
	//댓글 수 감소 
	public void commentBack(int recipe_num)throws Exception;
	
	//다음글 가져오기(최신순)
	public List<BoardVO> nextPageDate(int recipe_num)throws Exception;
	
	//다음글 가져오기(추천순)
	public List<BoardVO> nextPageGood(int recipe_num)throws Exception;
	
	//다음글 가져오기(조회순)
	public List<BoardVO> nextPageView(int recipe_num)throws Exception;
	
	//이전글 가져오기(최신순)
	public List<BoardVO> prevPageDate(int recipe_num)throws Exception;
	
	//이전글 가져오기(추천순)
	public List<BoardVO> prevPageGood(int recipe_num)throws Exception;
	
	//이전글 가져오기(조회순)
	public List<BoardVO> prevPageView(int recipe_num)throws Exception;
	
	//게시물 검색결과 가져오기
	public List<BoardVO> searchWrite(@Param("keyword")String keyword)throws Exception;
	
	//마이페이지 게시글 상세보기
	public List<BoardVO> mypageView(@Param("recipe_num") int recipe_num, @Param("user_num") int user_num)throws Exception;
	
	//마이페이지 게시글 상세보기(다음글)
	public List<BoardVO> mypageNext(@Param("recipe_num") int recipe_num, @Param("user_num") int user_num)throws Exception;
	
	//마이페이지 게시글 상세보기(이전글)
	public List<BoardVO> mypagePrev(@Param("recipe_num") int recipe_num, @Param("user_num") int user_num)throws Exception;
	
	//게시글 전체 개수 불러오기
	public int countWrite()throws Exception;
	
	//user가 작성한 게시글 개수 불러오기
	public int countWriteUser(@Param("user_num") int user_num) throws Exception;
	
	//게시글 삭제(마이페이지에서)
	public void DeleteRecipe(@Param("recipe_num") int recipe_num)throws Exception;
}
