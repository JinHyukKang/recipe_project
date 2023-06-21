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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 수정</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>
<!-- 게시판 글쓰기 양식 부분 -->
<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">

				<h4>공지사항 수정</h4>
				<form action="/Notify/NotifyUpdate.do" method="post" enctype="multipart/form-data">
					<c:forEach items="${notifyView}" var="notifyView">
					<input type="hidden" name="notify_num" value="${notifyView.notify_num}">
						<div class="form-group row mx-3 mb-3">
							<label for="notify_title">제목</label> <input type="text"
								class="form-control lg-6" style="width: 70%" id="notify_title"
								name="notify_title" value="${notifyView.notify_title}">
						</div>

						<div class="form-group mx-3 mb-3">
							<label for="notifyFile">이미지 파일 업로드 (이미지 재업로드 희망시)</label><br>
							<input type="file" name="notifyFile" id="notifyFile"
								value="${notifyView.notify_filename}">
						</div>

						<div class="form-group row mt-3 mx-3">
							<label for="notify_content">내용</label>
							<textarea class="form-control" id="notify_content"
								name="notify_content" rows="16">${notifyView.notify_content}</textarea>
						</div>
						<div class="mb-3">
							<button type="submit" class="btn btn-success row mt-3 mx-3">수정하기</button>
							<button type="button" class="btn btn-secondary row mt-3 mx-3"
								onclick="location.href = '/Notify/Notify';">
								목록으로</button>
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