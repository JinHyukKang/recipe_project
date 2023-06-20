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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/popuptest.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지(회원관리)</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			<div class="d-flex mb-3">
	  	  		<button class="btn btn-light" onclick="location.href='/Admin/AdminMember'"><strong>회원정보</strong></button>
   	  	  		<button class="btn btn-light" onclick="location.href='/Admin/AdminPost'"><strong>게시글 관리</strong></button>
	  		</div>
	  		
	  		<div class="border" style="border-radius: 10px; width:1200px;">
	  			<div class="d-flex" style="border-bottom: 1px solid black; background-color:lightgray; border-radius: 10px;">
		  			<p style="margin-top:5px; margin-bottom: 5px; margin-left:10px; margin-right:15px;"><strong>No.</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:100px;"><strong>아이디</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:100px;"><strong>회원명</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:90px;"><strong>닉네임</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:80px;"><strong>성별</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:100px;"><strong>이메일</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:100px;"><strong>우편번호</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:100px;"><strong>주소</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:80px;"><strong>상세주소</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:85px;"><strong>참고주소</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px; width:90px;"><strong>생년월일</strong></p>
		  			<p style="margin-top:5px; margin-bottom: 5px;"><strong>등록일</strong></p>
	  			</div>
	  			<c:forEach var="AllMember" items="${AllMember}" varStatus="loop" begin="${page.cri.startNum}" end="${page.cri.startNum + page.cri.amount - 1}">
		  			<div class="d-flex md-3">
		  				<div style="margin-top:5px; margin-left:10px; width:40px;">
			  				<p>${loop.index + 1}</p>
			  			</div>
			  			<div style="margin-top:5px; width:100px;">
			  				<p>${AllMember.user_id}</p>
			  			</div>
			  			<div style="margin-top:5px; width:100px;">
			  				<p>${AllMember.user_name}</p>
			  			</div>
			  			<div style="margin-top:5px; width:90px;">
			  				<p>${AllMember.user_nickname}</p>
			  			</div>
			  			<div style="margin-top:5px; width:70px;">
			  				<p>${AllMember.user_gender}</p>
			  			</div>
			  			<div style="margin-top:5px; width:110px;">
			  				<p>${AllMember.user_email}</p>
			  			</div>
			  			<div style="margin-top:5px; width:80px;">
			  				<p>${AllMember.user_postcode}</p>
			  			</div>
			  			<div style="margin-top:5px; width:120px;">
			  				<p>${AllMember.user_addr}</p>
			  			</div>
			  			<div style="margin-top:5px; width:80px;">
			  				<p>${AllMember.user_detailaddr}</p>
			  			</div>
			  			<div style="margin-top:5px; width:80px;">
			  				<p>${AllMember.user_extraaddr}</p>
			  			</div>
			  			<div style="margin-top:5px; margin-bottom: 5px; margin-right: 20px;">
			  				<p>${AllMember.user_birth}</p>
			  			</div>
			  			<div style="margin-top:5px; margin-bottom: 5px; margin-right: 30px;">
			  				<p><fmt:formatDate value="${AllMember.join_date}" pattern="yyyy-MM-dd" /></p>
			  			</div>
			  			<div class="d-flex">
			  			<!-- 게시글 삭제 -->
				    	<button class="btn btn-danger" onclick="deleteUser(${AllMember.user_num},event)" style="height: 35px; margin-top: 5px;">회원탈퇴</button>	
			  				
			  			</div>
		  			</div>
	  			</c:forEach>
	  		</div>
	  		<!-- 페이징 -->
	  		<div style="margin-top: 20px; text-align: center;" id="page">
			  <ul class="pagination" style="list-style: none; display: inline-block; padding: 0;">
			    <c:if test="${page.prev}">
			      <li class="pagination_button" style="display: inline-block; margin-right: 5px;">
			        <a href="/Admin/AdminMember?pageNum=${page.cri.pageNum - 1}&amount=${page.cri.amount}" style="padding: 5px 10px; background-color: #f2f2f2; border: 1px solid #ccc; text-decoration: none;">Previous</a>
			      </li>
			    </c:if>
			
			    <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
			      <li class="pagination_button" style="display: inline-block; margin-right: 5px;">
			        <a href="/Admin/AdminMember?pageNum=${num}&amount=${page.cri.amount}" style="padding: 5px 10px; background-color: #f2f2f2; border: 1px solid #ccc; text-decoration: none;">${num}</a>
			      </li>
			    </c:forEach>
			
			    <c:if test="${page.next}">
			      <li class="pagination_button" style="display: inline-block; margin-right: 5px;">
			        <a href="/Admin/AdminMember?pageNum=${page.cri.pageNum + 1}&amount=${page.cri.amount}" style="padding: 5px 10px; background-color: #f2f2f2; border: 1px solid #ccc; text-decoration: none;">Next</a>
			      </li>
			    </c:if>
			  </ul>
			</div>

		</div>
	</div>
</div>



<footer class="footer" style="position: flex; bottom: 0; left: 0; right: 0;">
    <%@ include file="/resources/include/footer.jsp" %>
</footer>

<script>
//회원탈퇴(관리자페이지)
function deleteUser(user_num,event) {
	event.preventDefault();
    if (confirm("회원을 탈퇴시키겠습니까?")) {
        $.ajax({
            url: '/Admin/DeleteUser.do',
            type: 'post',
            data: {user_num: user_num },
            success: function(response) {
                alert("회원이 정상적으로 탈퇴 되었습니다.");
                location.href = '/Admin/AdminMember';
            },
            error: function(xhr, status, error) {
                alert("회원 탈퇴에 실패했습니다.");
            }
        });
    }
}
</script>

</body>
</html>