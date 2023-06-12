<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>

<%--로그 아웃 Flash Messages --%>
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    
<nav class="navbar navbar-expand-sm navbar-light bg-light">

	<div class="container-fluid">
	
		<a class="navbar-brand" href="http://localhost:8070/">
		HOME
		</a>
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
		<span class="navbar-toggler-icon"></span>
		
		</button>
		
		<div class="collapse navbar-collapse" id="mynavbar">
			<ul class="navbar-nav me-auto">
				<!-- 로그아웃 시 헤더 카테고리 -->
				<c:if test="${user_id eq null}">
				<li class="nav-item">
					<a class="nav-link" href="/member/login">
					login
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/member/join">
					join
					</a>
				</li>
				</c:if>
	
				<!-- 로그인 후 헤더 카테고리 -->
				<c:if test="${user_id ne null}">
				<li class="nav-item">
					<a class="nav-link" href="/member/logout.do">
					logout
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/MyPage/MyPage">
					MyPage
					</a>
				</li>
				</c:if>
			
			</ul>
			<form class="d-flex">
			    <c:if test="${user_id ne null}">
			        <div class="col-sm-auto my-auto me-2">
			            <h6 class="mb-0"><strong>${user_nickname}님</strong> 환영합니다.</h6>
			        </div>
			    </c:if>
			    <div class="col">
			        <input name="keyword" id="keyword"  class="form-control me-2" type="text" placeholder="Search">
			    </div>
			    <div class="col-auto">
			        <button onclick="location.href='/board/searchWrite?keyword=' + encodeURIComponent(document.getElementById('keyword').value)" id="keywordButton" name="keywordButton" class="btn btn-primary" type="button"" id="keywordButton" name="keywordButton"
			        class="btn btn-primary" type="button">Search</button>
			    </div>
			</form>
		</div>
		
	</div>
</nav>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="mynavbar">
			<ul class="navbar-nav me-auto">
				<li class="nav-item">
					<a class="nav-link" href="/board/board">
					레시피게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">
					공지사항
					</a>
				</li>
			
			</ul>
		</div>
	
	</div>
</nav>

</body>
</html>