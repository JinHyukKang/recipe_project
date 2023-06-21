<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 상세보기</title>
</head>
<body>
<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			<c:forEach items="${notifyView}" var="notifyView">
			<h4><strong>[${notifyView.notify_title}]</strong></h4>
			<c:set var="notify_num" value="${notifyView.notify_num}" />
			<div class="form-group row mt-3 mx-3" style="border: 1px solid; border-radius: 10px;">
				<div class="d-flex mt-s">
					<p style="font-size:17px; font-style:oblique;">작성자 : <strong>${notifyView.user_nickname}</strong>님</p>
					<div class="ms-auto">
						<h6 style="font-style:oblique;">작성일 : <fmt:formatDate value="${notifyView.insert_date}" pattern="yyyy년 MM월 dd일 HH시 mm분" /></h6>
					</div>
				</div>
				<c:if test="${not empty notifyView.notify_filename}">
					<div class="justify-content-center row mt-5 mb-5" style="margin-bottom:100px;">
						<img src="${path}/resources/upload/${notifyView.notify_filename}.jpg" 
						id="notify_filename" name="notify_filename" style="width: 600px; height: 400px;">
					</div>
				</c:if>
				<div style="margin-left:100px; margin-right:100px; margin-bottom:80px;">
					<p style="font-size:18px;">${notifyView.notify_content}</p>
				</div>
			</div>
			
			</c:forEach>
		
		
		
		</div>
	</div>
</div>
</body>
</html>