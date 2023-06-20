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
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>
<!-- 게시판 글쓰기 양식 부분 -->
<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			<form action="/Notify/write.do" method="post" enctype="multipart/form-data">
			<h4>공지사항 작성</h4>
		        <div class="form-group row mx-3 mb-3">
		            <label for="notify_title">제목</label>
		            <input type="text" class="form-control lg-6" style="width:70%" id="notify_title" name="notify_title" placeholder="제목을 작성해주세요." required>
		        </div>
		      
		        <div class="form-group mx-3 mb-3">
          			<label for="notifyFile">이미지 파일 업로드</label><br>
          			<input type="file" name="notifyFile" id="notifyFile">
        		</div>
		        
		        
		        <div class="form-group row mt-3 mx-3">
		            <label for="notify_content">내용</label>
		            <textarea class="form-control" id="notify_content" name="notify_content" rows="16" required></textarea>
		        </div>
		        <div class="mb-3">
		        	<button type="submit" class="btn btn-info row mt-3 mx-3">등록하기</button>
		        	<button type="button" class="btn btn-secondary row mt-3 mx-3" onclick="location.href = '/Notify/Notify';">목록으로</button>
		        </div>
		    </form>			
		</div>
	</div>
</div>

<footer class="footer_login">
	<%@ include file="/resources/include/footer.jsp" %>
</footer>



</body>

</html>