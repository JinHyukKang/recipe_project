<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/popuptest.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPagePost</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			<div class="d-flex mb-3">
	  	  		<button class="btn btn-light" onclick="location.href='/MyPage/MyPage'"><strong>회원정보</strong></button>
   	  	  		<button class="btn btn-light" onclick="location.href='/MyPage/MyPagePost'"><strong>내 게시물</strong></button>
	  		</div>
	  		
	  		<div class="border" style="border-radius: 10px; width:1000px;">
	  			<div class="d-flex" style="border-bottom: 1px solid black; background-color:lightgray; border-radius: 10px;">
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-left:25px; margin-right:25px;"><strong>No.</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-right:250px;"><strong>제목</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-right:50px;"><strong>조회수</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-right:50px;"><strong>추천수</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-right:50px;"><strong>댓글수</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px;"><strong>작성일</strong></p>
	  			</div>
	  			<c:forEach var="findWrite" items="${findWrite}" varStatus="loop" begin="${page.cri.startNum}" end="${page.cri.startNum + page.cri.amount - 1}">
		  			<div class="d-flex md-3">
		  				<div style="margin-top:5px; margin-left:30px; width:45px;">
			  				<p>${loop.index + 1}</p>
			  			</div>
			  			<div style="margin-top:5px; width:300px;">
			  				<p >
			  				<a href="/MyPage/MyPageView?recipe_num=${findWrite.recipe_num}" style="white-space: nowrap;overflow: hidden; text-overflow: ellipsis; width: 200px;display: inline-block;">
			  			${findWrite.recipe_title}</a></p>
			  			</div>
			  			<div style="margin-top:5px; width:100px;">
			  				<p>${findWrite.view_count}</p>
			  			</div>
			  			<div style="margin-top:5px; width:100px;">
			  				<p>${findWrite.good_count}</p>
			  			</div>
			  			<div style="margin-top:5px; width:80px;">
			  				<p>${findWrite.comment_count}</p>
			  			</div>
			  			<div style="margin-top:5px; margin-bottom: 5px; margin-right: 30px;">
			  				<p><fmt:formatDate value="${findWrite.insert_date}" pattern="yyyy-MM-dd-HH-mm" /></p>
			  			</div>
			  			<div class="d-flex">
			  				<button class="btn btn-success" style="height: 35px; margin-top:5px; margin-right:5px;">수정</button>
			  				<button class="btn btn-danger"  style="height: 35px; margin-top:5px;">삭제</button>
			  			</div>
		  			</div>
	  			</c:forEach>
	  		</div>
	  		<!-- 페이징 -->
	  		<div>
			    <ul class="pagination">
				    <c:if test="${page.prev}">
				        <li class="pagination_button">
				            <a href="/MyPage/MyPagePost?pageNum=${page.cri.pageNum - 1}&amount=${page.cri.amount}">Previous</a>
				        </li>
				    </c:if>
				    
				    <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
				        <li class="pagination_button">
				            <a href="/MyPage/MyPagePost?pageNum=${num}&amount=${page.cri.amount}">${num}</a>
				        </li>
				    </c:forEach>
				    
				    <c:if test="${page.next}">
				        <li class="pagination_button">
				            <a href="/MyPage/MyPagePost?pageNum=${page.cri.pageNum + 1}&amount=${page.cri.amount}">Next</a>
				        </li>
				    </c:if>
				</ul>
			</div>

		</div>
	</div>
</div>



<footer class="footer" style="position: flex; bottom: 0; left: 0; right: 0;">
    <%@ include file="/resources/include/footer.jsp" %>
</footer>


</body>
</html>