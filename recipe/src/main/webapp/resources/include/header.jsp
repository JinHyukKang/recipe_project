<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">

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
				<c:if test="${sessionScope.LoginVo == null}">
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
				<c:if test="${sessionScope.LoginVo != null}">
				<li class="nav-item">
					<a class="nav-link" href="/member/logout.do">
					logout
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/member/login">
					MyPage
					</a>
				</li>
				</c:if>
			
			</ul>
			<form class="d-flex">
			<input class="form-control me-2" type="text" placeholder="Search">
			<button class="btn btn-primary" type="button">Search</button>
			
			
			</form>
		</div>
		
	</div>

</nav>