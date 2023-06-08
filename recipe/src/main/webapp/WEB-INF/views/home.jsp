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
<title>Home</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<main>
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/images/1.jpg" alt="Los Angeles" class="d-block" height="400px" style="width:100%">
      <div class="carousel-caption">
        <h3>Los Angeles</h3>
        <p>We had such a great time in LA!</p>
      </div>
    </div>
    <div class="carousel-item carousel-inner">
      <img src="resources/images/2.jpg" alt="Chicago" class="d-block" height="400px" style="width:100%">
      <div class="carousel-caption">
        <h3>Chicago</h3>
        <p>Thank you, Chicago!</p>
      </div> 
    </div>
    <div class="carousel-item carousel-inner">
      <img src="resources/images/3.jpg" alt="New York" class="d-block"  height="400px" style="width:1000%">
      <div class="carousel-caption">
        <h3>New York</h3>
        <p>We love the Big Apple!</p>
      </div>  
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>



<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
     	<section>
			<h3 class="mb-3"><strong>베스트 게시물</strong></h3>
			
			<div class="d-flex mb-1">
				<c:forEach var="findWriteAllGood" items="${findWriteAllGood}" varStatus="loop" begin="0" end="3">
				<div style="margin-right: 100px; margin-bottom: 40px; width: 17%;"
					     onmouseover="this.style.backgroundColor='lightblue'"
					     onmouseout="this.style.backgroundColor='transparent'">
				   
				   <!-- 이미지 -->
			       <a id="recipe_filename" href="/board/ViewWriteGood?recipe_num=${findWriteAllGood.recipe_num}">
			       	  <img src="${path}/resources/upload/${findWriteAllGood.recipe_filename}.jpg" id="recipe_filename" name="recipe_filename" style="width: 220px; height: 150px; border-radius: 5px;">
			       </a>
			       <div style="border-width: 0 1px 1px 1px; border-style: none double double double; border-color: transparent lightgray lightgray lightgray; border-radius: 0px 0px 5px 5px;">
				       <div style="margin-bottom: 0; line-height: 0; margin-right: 10px;">
				       <!-- 게시글 제목 -->
				       <h6 id="recipe_title" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 90%; display: inline-block; font-size:14px; text-indent: 3px;">
						  <a id="recipe_title" style="color: black; text-decoration: none;" href="/board/ViewWriteGood?recipe_num=${findWriteAllGood.recipe_num}"><strong>[${findWriteAllGood.recipe_title}]</strong></a>
					   </h6>
					   </div>
				   		
				   		<!-- 작성자 닉네임 -->
					   <div style="margin-top: 0; margin-bottom: 0; line-height: 1;">
						   <p id="user_nickname" style="font-size:14px; text-indent: 3px;">
						   	   <a id="user_nickname" style="color: black; text-decoration: none;" href="/board/ViewWriteGood?recipe_num=${findWriteAllGood.recipe_num}">작성자: <strong>${findWriteAllGood.user_nickname}</strong>님</a>
						   </p>
					   </div>
					   <div class="d-flex" style="margin-top: 0; margin-bottom: 0; line-height: 0;">
					   		<!-- 추천수 -->
					   	   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/good.png" id="good_count_img" name="good_count_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   <p style="font-size:14px;">${findWriteAllGood.good_count}</p>
							   </div>
						   </div>
						   
						   <!-- 댓글수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/comment.png" id="good_comment_img" name="good_comment_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   	  <p style="font-size:14px;">${findWriteAllGood.comment_count}</p>
							   </div>
						   </div>
						   
						   <!-- 조회수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/view.png" id="good_view_img" name="good_view_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   <p style="font-size:14px;">${findWriteAllGood.view_count}</p>
							   </div>
						   </div>
						</div>
					</div>
			    </div>
				</c:forEach>
			</div>
		</section>
		
		<section>
			<h3 class="mb-3"><strong>최신 게시물</strong></h3>
			
			<div class="d-flex mb-1">
				<c:forEach var="findWriteAll" items="${findWriteAll}" varStatus="loop" begin="0" end="3">
				<div style="margin-right: 100px; margin-bottom: 40px; width: 17%;"
					     onmouseover="this.style.backgroundColor='lightblue'"
					     onmouseout="this.style.backgroundColor='transparent'">
				   
				   <!-- 이미지 -->
			       <a id="recipe_filename" href="/board/ViewWriteDate?recipe_num=${findWriteAll.recipe_num}">
			       	  <img src="${path}/resources/upload/${findWriteAll.recipe_filename}.jpg" id="recipe_filename" name="recipe_filename" style="width: 220px; height: 150px; border-radius: 5px;">
			       </a>
			       <div style="border-width: 0 1px 1px 1px; border-style: none double double double; border-color: transparent lightgray lightgray lightgray; border-radius: 0px 0px 5px 5px;">
				       <div style="margin-bottom: 0; line-height: 0; margin-right: 10px;">
				       <!-- 게시글 제목 -->
				       <h6 id="recipe_title" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 90%; display: inline-block; font-size:14px; text-indent: 3px;">
						  <a id="recipe_title" style="color: black; text-decoration: none;" href="/board/ViewWriteDate?recipe_num=${findWriteAll.recipe_num}"><strong>[${findWriteAll.recipe_title}]</strong></a>
					   </h6>
					   </div>
				   		
				   		<!-- 작성자 닉네임 -->
					   <div style="margin-top: 0; margin-bottom: 0; line-height: 1;">
						   <p id="user_nickname" style="font-size:14px; text-indent: 3px;">
						   	   <a id="user_nickname" style="color: black; text-decoration: none;" href="/board/ViewWriteDate?recipe_num=${findWriteAll.recipe_num}">작성자: <strong>${findWriteAll.user_nickname}</strong>님</a>
						   </p>
					   </div>
					   <div class="d-flex" style="margin-top: 0; margin-bottom: 0; line-height: 0;">
					   		<!-- 추천수 -->
					   	   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/good.png" id="good_count_img" name="good_count_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   <p style="font-size:14px;">${findWriteAll.good_count}</p>
							   </div>
						   </div>
						   
						   <!-- 댓글수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/comment.png" id="good_comment_img" name="good_comment_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   	  <p style="font-size:14px;">${findWriteAll.comment_count}</p>
							   </div>
						   </div>
						   
						   <!-- 조회수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/view.png" id="good_view_img" name="good_view_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   <p style="font-size:14px;">${findWriteAll.view_count}</p>
							   </div>
						   </div>
						</div>
					</div>
			    </div>
				</c:forEach>
			</div>
		</section>
		
		<section>
			<h3 class="mb-3"><strong>많이본 게시물</strong></h3>
			
			<div class="d-flex mb-1">
				<c:forEach var="findWriteAllView" items="${findWriteAllView}" varStatus="loop" begin="0" end="3">
				<div style="margin-right: 100px; margin-bottom: 40px; width: 17%;"
					     onmouseover="this.style.backgroundColor='lightblue'"
					     onmouseout="this.style.backgroundColor='transparent'">
				   
				   <!-- 이미지 -->
			       <a id="recipe_filename" href="/board/ViewWriteView?recipe_num=${findWriteAllView.recipe_num}">
			       	  <img src="${path}/resources/upload/${findWriteAllView.recipe_filename}.jpg" id="recipe_filename" name="recipe_filename" style="width: 220px; height: 150px; border-radius: 5px;">
			       </a>
			       <div style="border-width: 0 1px 1px 1px; border-style: none double double double; border-color: transparent lightgray lightgray lightgray; border-radius: 0px 0px 5px 5px;">
				       <div style="margin-bottom: 0; line-height: 0; margin-right: 10px;">
				       <!-- 게시글 제목 -->
				       <h6 id="recipe_title" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 90%; display: inline-block; font-size:14px; text-indent: 3px;">
						  <a id="recipe_title" style="color: black; text-decoration: none;" href="/board/ViewWriteView?recipe_num=${findWriteAllView.recipe_num}"><strong>[${findWriteAllView.recipe_title}]</strong></a>
					   </h6>
					   </div>
				   		
				   		<!-- 작성자 닉네임 -->
					   <div style="margin-top: 0; margin-bottom: 0; line-height: 1;">
						   <p id="user_nickname" style="font-size:14px; text-indent: 3px;">
						   	   <a id="user_nickname" style="color: black; text-decoration: none;" href="/board/ViewWriteView?recipe_num=${findWriteAllView.recipe_num}">작성자: <strong>${findWriteAllView.user_nickname}</strong>님</a>
						   </p>
					   </div>
					   <div class="d-flex" style="margin-top: 0; margin-bottom: 0; line-height: 0;">
					   		<!-- 추천수 -->
					   	   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/good.png" id="good_count_img" name="good_count_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   <p style="font-size:14px;">${findWriteAllView.good_count}</p>
							   </div>
						   </div>
						   
						   <!-- 댓글수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/comment.png" id="good_comment_img" name="good_comment_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   	  <p style="font-size:14px;">${findWriteAllView.comment_count}</p>
							   </div>
						   </div>
						   
						   <!-- 조회수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/view.png" id="good_view_img" name="good_view_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   <p style="font-size:14px;">${findWriteAllView.view_count}</p>
							   </div>
						   </div>
						</div>
					</div>
			    </div>
				</c:forEach>
			</div>
		</section>
		
      	</div>
     </div>
</div>

</main>

 <%@ include file="/resources/include/footer.jsp" %>
 
 
</body>


</html>