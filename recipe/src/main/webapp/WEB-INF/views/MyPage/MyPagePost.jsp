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
<link href="${path}/resources/css/custome.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPagePost</title>


</head>
<body>

<%@ include file="/resources/include/header.jsp" %>

<!-- 마이페이지 헤더 -->

<div class="container">
    <div class="input-form-backgroud">
      <div class="input-form col-md-12 mx-auto">
      <div class="d-flex mb-3">
	  	  <button class="btn btn-light" onclick="location.href='/MyPage/MyPage'"><strong>회원정보</strong></button>
   	  	  <button class="btn btn-light" onclick="location.href='/MyPage/MyPagePost'"><strong>내 게시물</strong></button>
	  </div>	  
            <table id="tblresult" style="width: 100%;">
                <tr>
                    <th bgcolor="#92b5db" width="10%">No.</th>
        			<th bgcolor="#92b5db" width="30%" style="max-width: 100%;">제목</th>
        			<th bgcolor="#92b5db" width="10%">조회수</th>
        			<th bgcolor="#92b5db" width="10%">추천수</th>
        			<th bgcolor="#92b5db" width="10%">댓글수</th>
        			<th bgcolor="#92b5db" width="30%">작성일</th>
                </tr>
                <c:forEach var="findWrite" items="${findWrite}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>
	                        <div style="width: 250px;">
	                        	<a href="" style="white-space: nowrap;overflow: hidden; text-overflow: ellipsis; max-width: 80%; display: inline-block;">${findWrite.recipe_title}</a>
	                       	</div>
	                    </td>
                        <td>${findWrite.view_count}</td>
                        <td>${findWrite.good_count}</td>
                        <td>${findWrite.comment_count}</td>
                        <td><fmt:formatDate value="${findWrite.insert_date}" pattern="yyyy-MM-dd HH:mm" /></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>      
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/popuptest.js"></script>

<footer class="footer" style="position: fixed; bottom: 0; left: 0; right: 0;">
    <%@ include file="/resources/include/footer.jsp" %>
</footer>


</body>
</html>