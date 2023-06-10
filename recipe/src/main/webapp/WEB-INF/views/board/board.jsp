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
<title>레시피 게시판</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
		
		<!-- 베스트 게시물 top4 -->
		<section>
			<h3 class="mb-2"><strong>베스트 게시물</strong></h3>
			
			<div class="d-flex mb-4">
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
							   <img src="${path}/resources/images/comment.png" id="comment_count_img" name="comment_count_img" style="width: 20px; height: 18px;" >
							   <div style="line-height:1; margin-left:5px;">
							   	  <p style="font-size:14px;">${findWriteAllGood.comment_count}</p>
							   </div>
						   </div>
						   
						   <!-- 조회수 -->
						   <div style="width:55px;" class="d-flex">
							   <img src="${path}/resources/images/view.png" id="view_count_img" name="view_count_img" style="width: 20px; height: 18px;" >
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
		
		<!-- 최신순 레시피 게시판 -->
		<section>
			<div class="d-flex">
				<h2 class="mb-3"><strong>레시피 게시물</strong></h2>
				<div class="d-flex ms-auto">
					<p id="orderbyDate"><a href="#" onclick="showFindWriteAll(this)" style="color: black; text-decoration: none; font-weight: bold; font-size: 16px;">최신순</a>|</p>
					<p id="orderbyGood"><a href="#" onclick="showFindWriteAllGood(this)" style="color: black; text-decoration: none;">추천순</a>|</p>
					<p id="orderbyView"><a href="#" onclick="showFindWriteAllView(this)" style="color: black; text-decoration: none;">조회순</a>|</p>
				</div>
			</div>
			<div id="findWriteAll" class="d-flex flex-wrap mb-3 ">
			  <c:forEach var="findWriteAll" items="${findWriteAll}" varStatus="loop">
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
			
			
			<!-- 추천순 게시판 불러오기 -->
			<div id="findWriteAllGood" class="d-flex flex-wrap mb-3 d-none">
			  <c:forEach var="findWriteAllGood" items="${findWriteAllGood}" varStatus="loop">
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
			
			
			<!-- 조회순 게시판 불러오기 -->
			<div id="findWriteAllView" class="d-flex flex-wrap mb-3 d-none">
			  <c:forEach var="findWriteAllView" items="${findWriteAllView}" varStatus="loop">
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
//최신순으로 게시물 불러오기
function showFindWriteAll(element) {
  var findWriteAllDiv = document.getElementById("findWriteAll");
  var findWriteAllGoodDiv = document.getElementById("findWriteAllGood");
  var findWriteAllViewDiv = document.getElementById("findWriteAllView");
  findWriteAllDiv.classList.remove("d-none");
  findWriteAllGoodDiv.classList.add("d-none");
  findWriteAllViewDiv.classList.add("d-none");

  resetStyles(element);

  element.style.fontWeight = 'bold';
  element.style.fontSize = '16px';

  event.preventDefault(); // 기본 동작 막기
}

// 추천순으로 게시물 불러오기
function showFindWriteAllGood(element) {
  var findWriteAllGoodDiv = document.getElementById("findWriteAllGood");
  var findWriteAllDiv = document.getElementById("findWriteAll");
  var findWriteAllViewDiv = document.getElementById("findWriteAllView");
  findWriteAllGoodDiv.classList.remove("d-none");
  findWriteAllDiv.classList.add("d-none");
  findWriteAllViewDiv.classList.add("d-none");

  resetStyles(element);

  element.style.fontWeight = 'bold';
  element.style.fontSize = '16px';

  event.preventDefault(); // 기본 동작 막기
}

// 조회순으로 게시물 불러오기
function showFindWriteAllView(element) {
  var findWriteAllViewDiv = document.getElementById("findWriteAllView");
  var findWriteAllDiv = document.getElementById("findWriteAll");
  var findWriteAllGoodDiv = document.getElementById("findWriteAllGood");
  findWriteAllViewDiv.classList.remove("d-none");
  findWriteAllDiv.classList.add("d-none");
  findWriteAllGoodDiv.classList.add("d-none");

  resetStyles(element);

  element.style.fontWeight = 'bold';
  element.style.fontSize = '16px';

  event.preventDefault(); // 기본 동작 막기
}

// 스타일 초기화
function resetStyles(element) {
  var allOrderbyElements = document.querySelectorAll("#orderbyDate, #orderbyGood, #orderbyView");
  allOrderbyElements.forEach(function (el) {
    var link = el.querySelector("a");
    link.style.fontWeight = '';
    link.style.fontSize = '';
  });
}

</script>



	
</body>


</html>