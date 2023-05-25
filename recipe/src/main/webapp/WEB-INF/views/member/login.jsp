<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
  <link href="${path}/resources/css/custome.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="${path}/resources/js/join.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
      <form action="/member/login.do" method="post">
        <h4 class="mb-3">로그인</h4>
        
        
          <div class="mb-3">
              <label for="user_id ">아이디</label>
              <input type="text" class="form-control col-lg-6" id="user_id" name="user_id">
          </div>
          
          <div class="mb-3">
              <label for="user_pass ">비밀번호</label>
              <input type="password" class="form-control col-lg-6" id="user_pass" name="user_pass" required>
              
          </div>
          
          <button class="btn btn-primary btn-lg btn-block col-lg-6 float-righ" type="submit">로그인</button>
          <button class="btn btn-success btn-lg btn-block col-lg-6 float-righ" onclick="location.href='/member/join'">회원가입</button>
          
        </form>
        
      </div>
   </div>
</div>
<br>

<footer class="footer_login">
<%@ include file="/resources/include/footer.jsp" %>
</footer>





</body>
</html>