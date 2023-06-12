<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  	<link rel="stylesheet" href="${path}/resources/css/custom.css"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레시피 게시판(검색결과)</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
				
		<!-- 최신순 레시피 게시판 -->
		<section>
			<div class="d-flex">
				<h2 class="mb-3"><strong>검색결과 게시물</strong></h2>
			</div>
			<div id="searchWrite" class="d-flex flex-wrap mb-3 ">
			  <c:forEach var="searchWrite" items="${searchWrite}" varStatus="loop">
			    <div style="margin-right: 100px; margin-bottom: 40px; width: 17%;"
					     onmouseover="this.style.backgroundColor='lightblue'"
					     onmouseout="this.style.backgroundColor='transparent'">
				   <!-- 이미지 -->
			       <a id="recipe_filename" href="/board/ViewWriteDate?recipe_num=${searchWrite.recipe_num}">
			       	  <img src="${path}/resources/upload/${searchWrite.recipe_filename}.jpg" id="recipe_filename" name="recipe_filename" style="width: 220px; height: 150px; border-radius: 5px;">
			       </a>
			       <div style="border-width: 0 1px 1px 1px; border-style: none double double double; border-color: transparent lightgray lightgray lightgray; border-radius: 0px 0px 5px 5px;">
				       <div style="margin-bottom: 0; line-height: 0; margin-right: 10px;">
				       <!-- 게시글 제목 -->
				       <h6 id="recipe_title" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 90%; display: inline-block; font-size:14px; text-indent: 3px;">
						  <a id="recipe_title" style="color: black; text-decoration: none;" href="/board/ViewWriteDate?recipe_num=${searchWrite.recipe_num}"><strong>[${searchWrite.recipe_title}]</strong></a>
					   </h6>
					   </div>
				   		
				   		<!-- 작성자 닉네임 -->
					   <div style="margin-top: 0; margin-bottom: 0; line-height: 1;">
						   <p id="user_nickname" style="font-size:14px; text-indent: 3px;">
						   	   <a id="user_nickname" style="color: black; text-decoration: none;" href="/board/ViewWriteDate?recipe_num=${searchWrite.recipe_num}">작성자: <strong>${searchWrite.user_nickname}</strong>님</a>
						   </p>
					   </div>
					   <div class="d-flex" style="margin-top: 0; margin-bottom: 0; line-height: 0;">
					   		<!-- 추천수 -->
					   	   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/good.png" id="good_count_img" name="good_count_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   <p style="font-size:14px;">${searchWrite.good_count}</p>
							   </div>
						   </div>
						   
						   <!-- 댓글수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/comment.png" id="good_comment_img" name="good_comment_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   	  <p style="font-size:14px;">${searchWrite.comment_count}</p>
							   </div>
						   </div>
						   
						   <!-- 조회수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/view.png" id="good_view_img" name="good_view_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   <p style="font-size:14px;">${searchWrite.view_count}</p>
							   </div>
						   </div>
						</div>
					</div>
			    </div>
			  </c:forEach>
			</div>									
		</section>
		
		<!-- 로그인 유무에 따라 글작성 이동 가능 -->	
		<c:if test="${user_id eq null}">
			<div class="mb-3">
				<button type="button" class="btn btn-primary" onclick="checkLogin()">글작성</button>
			</div>
		</c:if>
		
		<c:if test="${user_id ne null}">
			<div class="mb-3">
				<button type="button" class="btn btn-primary" onclick="location.href = '/board/recipeWrite';">글작성</button>
			</div>
		</c:if>
		
		</div>
	</div>
</div>

	<%@ include file="/resources/include/footer.jsp" %>


<script>

function checkLogin(){
	alert("로그인하셔야 작성하실수 있습니다.")
	}

</script>



	
</body>


</html>