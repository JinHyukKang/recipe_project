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
		<section>
			<h3 class="mb-3"><strong>베스트 게시물</strong></h3>
			
			<div class="d-flex">
				<c:forEach var="findWriteAllGood" items="${findWriteAllGood}" varStatus="loop" begin="0" end="3">
				<div style="margin-right: 120px;">
					<a href="">
					<img src ="${path}/resources/upload/${findWriteAllGood.recipe_filename}.jpg" style="width: 250px; height: 150px;">
					</a>
				</div>
				</c:forEach>
			</div>
			
			<div>
			<a></a>
			</div>
		</section>
			
		</div>
	</div>
</div>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
		<section>
			<h2 class="mb-5"><strong>레시피 게시판</strong></h2>
			
			<div class="d-flex">
				<c:forEach var="findWriteAll" items="${findWriteAll}" varStatus="loop">
				<div style="margin-right: 120px;">
					<a href="">
					
					<img src ="${path}/resources/upload/${findWriteAll.recipe_filename}.jpg" style="width: 250px; height: 150px;">
					</a>
				</div>
				</c:forEach>
			</div>
			
			<!-- <div>
				<a>
					<img src ="${path}/resources/upload/1cd75763.jpg">
				</a>
				
			</div> -->
		</section>
			
		</div>
	</div>
</div>










	<!-- 로그인 유무에 따라 글작성 이동 가능 -->	
<c:if test="${user_id eq null}">
	<button type="button" class="btn btn-primary" onclick="checkLogin()">글작성</button>
</c:if>

<c:if test="${user_id ne null}">
	<button type="button" class="btn btn-primary" onclick="location.href = '/board/recipeWrite';">글작성</button>
</c:if>

<%@ include file="/resources/include/footer.jsp" %>
</body>
<script>
function checkLogin(){
	alert("로그인하셔야 작성하실수 있습니다.")
}


</script>

</html>