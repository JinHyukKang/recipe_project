<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
		
		<h3 class="mb-2"><strong>공지사항</strong></h3>
		
		<div class="border" style="border-radius: 10px; width:1000px;">
	  			<div class="d-flex" style="border-bottom: 1px solid black; background-color:lightgray; border-radius: 10px;">
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-left:25px; margin-right:100px;"><strong>No.</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-right:350px;"><strong>제목</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-right:150px;"><strong>작성자</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px;"><strong>작성일</strong></p>
	  			</div>
	  			<c:forEach var="findNotify" items="${findNotify}" varStatus="loop" begin="${page.cri.startNum}" end="${page.cri.startNum + page.cri.amount - 1}">
		  			<div class="d-flex" style="height:40px;">
		  				<div style="margin-top:5px; margin-left:30px; width:45px;">
			  				<p>${findNotify.notify_num}</p>
			  			</div>
			  			<div style="margin-top:5px; width:450px;margin-right:10px;">
			  				<p>
			  				<a href="/Notify/NotifyView?notify_num=${findNotify.notify_num}" 
			  				style="white-space: nowrap;overflow: hidden; text-overflow: ellipsis; 
			  				width: 250px;display: inline-block;">
			  			${findNotify.notify_title}</a></p>
			  			</div>
			  			<div style="margin-top:5px; width:120px;margin-right:35px;">
			  				<p>${findNotify.user_nickname}</p>
			  			</div>
			  			<div style="margin-top:5px; margin-bottom: 5px; margin-right: 30px;">
			  				<p><fmt:formatDate value="${findNotify.insert_date}" pattern="yyyy-MM-dd-HH-mm" /></p>
			  			</div>
			  			<c:if test="${user_id eq 'admin'}">
			  				<!-- 공지사항 수정 -->
			  				<button class="btn btn-success" onclick="location.href='/Notify/NotifyUpdate?notify_num=${findNotify.notify_num}'" style="height: 35px; margin-top:3px; margin-right:5px;">수정</button>
			  				<!-- 공지사항 삭제 -->
				    		<button class="btn btn-danger" onclick="deleteNotify(${findNotify.notify_num}, event)" style="height: 35px; margin-top: 3px;">삭제</button>	
			  			</c:if>
		  			</div>
	  			</c:forEach>
	  		</div>
	  		<!-- 관리자만 공지사항 글 작성 이동 가능 -->	
			<c:if test="${user_id eq 'admin'}">
				<div class="mb-3">
					<button type="button" class="btn btn-primary" onclick="location.href='/Notify/NotifyWrite'">공지글작성</button>
				</div>
			</c:if>
		</div>
	</div>
</div>


<footer class="footer" style="position: fixed; bottom: 0; left: 0; right: 0;">
    <%@ include file="/resources/include/footer.jsp" %>
 </footer>
 
 
 <script>
//공지글 삭제
 function deleteNotify(notify_num, event) {
     event.preventDefault();
     if (confirm("공지글을 삭제하시겠습니까?")) {
         $.ajax({
             url: '/Notify/DeleteNotify.do',
             type: 'post',
             data: { notify_num: notify_num },
             success: function(response) {
                 if (response === "success") {
                     alert("공지글이 정상적으로 삭제되었습니다.");
                     location.href = '/Notify/Notify';
                 } else {
                     alert("공지글 삭제에 실패했습니다.");
                 }
             },
             error: function(xhr, status, error) {
                 alert("공지글 삭제에 실패했습니다.");
             }
         });
     }
 }
</script>
</body>
</html>