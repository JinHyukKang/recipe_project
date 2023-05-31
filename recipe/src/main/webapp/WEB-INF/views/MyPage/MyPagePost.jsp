<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="stylesheet" href="/resources/css/MyPagecustom.css"/>
  <link rel="stylesheet" href="/resources/js/popuptest.js"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta charset="UTF-8">
<title>MyPagePost</title>
</head>
<body>

<!-- 마이페이지 헤더 -->
<div id="change-mod" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
	    <li class="ui-state-default ui-corner-top"><a href="/MyPage/MyPage"><span><strong>회원정보수정</strong></span></a></li>
	    <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="/MyPage/MyPagePost"><span><strong>내게시물</strong></span></a></li>
    </ul>
</div>
<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			<table border="1" cellpadding="1" cellspacing="0" width="700" id= "tblresult">
			<tr>
				<th bgcolor="silver" width="10%">No.</th>
				<th bgcolor="silver" width="50%">제목</th>
				<th bgcolor="silver" width="40%">작성일</th>
			</tr>
			<c:forEach var="board" items="${boardList }">
				<tr>
					<td>${board.seq }</td>
					<td><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
					<td>${board.writer }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>      
</div>
</body>
</html>