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
  	<link href="${path}/resources/css/write.css" rel="stylesheet" type="text/css">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 수정</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>
<!-- 게시판 글쓰기 양식 부분 -->
<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			<form action="/MyPage/recipeUpdate.do" method="post" enctype="multipart/form-data">
			<h4>레시피 수정</h4>
			<c:forEach items="${mypageView}" var="mypageView">
		        <div class="form-group row mx-3 mb-3">
		            <label for="recipe_title">제목</label>
		            <input type="text" class="form-control lg-6" style="width:70%" id="recipe_title" name="recipe_title"  value="${mypageView.recipe_title}">
		        </div>
		      
		        <div class="form-group mx-3 mb-3">
          			<label for="recipeFile">이미지 파일 업로드</label><br>
          			<input type="file" name="recipeFile" id="recipeFile" value="${mypageView.recipe_realname}">
        		</div>
		        
		        
		        <div class="form-group row mt-3 mx-3">
		            <label for="recipe_content">내용</label>
		            <textarea class="form-control" id="recipe_content" name="recipe_content" rows="16">${mypageView.recipe_content}</textarea>
		        </div>
		        <div class="mb-3">
		        	<button type="submit" class="btn btn-success row mt-3 mx-3">수정하기</button>
		        	<button type="button" class="btn btn-secondary row mt-3 mx-3" onclick="location.href = '/MyPage/MyPagePost';">목록으로</button>
		        </div>
		       </c:forEach>
		    </form>			
		</div>
	</div>
</div>
<footer class="footer_login">
<%@ include file="/resources/include/footer.jsp" %>
</footer>



</body>

</html>