<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPagePost</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/MyPagecustom.css"/>
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
            <table border="1" id="tblresult">
                <tr>
                    <th bgcolor="silver" width="5%">No.</th>
                    <th bgcolor="silver" width="30%" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 30%;">제목</th>
                    <th bgcolor="silver" width="10%">조회수</th>
                    <th bgcolor="silver" width="10%">추천수</th>
                    <th bgcolor="silver" width="10%">댓글수</th>
                    <th bgcolor="silver" width="35%">작성일</th>
                </tr>
                <c:forEach var="findWrite" items="${findWrite}" varStatus="loop">
                    <tr>
                        <td style="max-width: 5%;">${loop.index + 1}</td>
                        <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 30%; display: inline-block;">${findWrite.recipe_title}</td>
                        <td style="max-width: 10%;">${findWrite.view_count}</td>
                        <td style="max-width: 10%;">${findWrite.good_count}</td>
                        <td style="max-width: 10%;">${findWrite.comment_count}</td>
                        <td style="max-width: 35%;"><fmt:formatDate value="${findWrite.insert_date}" pattern="yyyy-MM-dd HH:mm" /></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>      
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/popuptest.js"></script>
</body>
</html>