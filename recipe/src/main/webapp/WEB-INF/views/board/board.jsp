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