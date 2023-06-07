<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="${path}/resources/css/custome.css" rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
      	<form class="ml-5">
        <h4 class="mb-3 mt-8">비밀번호 찾기</h4>
          <div class="mb-3">
              <label for="user_id ">아이디</label>
              <input type="text" class="form-control col-lg-8" id="user_id" name="user_id" required>
          </div>
          
          <div class="mb-3">
              <label for="user_pass ">이메일</label>
              <input type="email" class="form-control col-lg-8" id="user_email" name="user_email" required>
          </div>
          
          <div class="mb-3">
          	<button class="btn btn-primary btn-lg btn-block col-lg-8 float-righ" type="submit" onclick="findpw()">비밀번호 찾기</button>
          	<button class="btn btn-success btn-lg btn-block col-lg-8 float-righ" onclick="location.href='/member/join'">회원가입</button>
          	<button class="btn btn-info btn-lg btn-block col-lg-8 float-righ" onclick="location.href='/member/login'">로그인</button>
          </div>
        </form>
        
      </div>
   </div>
</div>
<br>

<footer class="footer_login">
<%@ include file="/resources/include/footer.jsp" %>
</footer>
<script>

	function findpw() {
		// 사용자 입력 값 가져오기
		var user_id = $("#user_id").val();
		var user_email = $("#user_email").val();

		if(user_id === "" || user_email === ""){
			alert("아이디 혹은 이메일을 입력해주세요.");
		}else{
			// Ajax 요청 보내기
			$.ajax({
				url : "/member/findpw.do", // 요청할 URL
				type : "POST",
				data : {
					user_id : user_id,
					user_email : user_email
				},
				success : function(response) {
					// 서버에서의 응답 처리
					if (response === "fail") {
	                    alert("존재하지 않는 아이디 혹은 이메일입니다.");
	                } else {
	        
	                    alert("회원님의 비밀번호는 " + response + "입니다.");
	                }
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error(error);
				}
			});
		}
	};
</script>




</body>
</html>