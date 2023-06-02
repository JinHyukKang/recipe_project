<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

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
					<a class="nav-link" href="javascript:void(0);" onclick="openPopUp();">
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
					먹거리 정보
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
<script>

function openPopUp() {
    // 함수 동작 테스트 
    //alert("팝업 테스트");
    
    //window.open("[팝업을 띄울 파일명 path]", "[별칭]", "[팝업 옵션]")
     window.open("/MyPage/MyPage", "target", "width=800, height=700, top=150, left=200");
}

function showHidden() {
    alert(document.testForm.flag.value);
}
</script>
</html>