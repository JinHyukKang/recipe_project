<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link href="${path}/resources/css/custome.css" rel="stylesheet" type="text/css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <form action="/member/login.do" method="post" class="ml-5">
                <h4 class="mb-3 mt-8">로그인</h4>
                <div class="mb-3">
                    <label for="user_id">아이디</label>
                    <input type="text" class="form-control col-lg-8" id="user_id" name="user_id">
                </div>
                <div class="mb-3">
                    <label for="user_pass">비밀번호</label>
                    <input type="password" class="form-control col-lg-8" id="user_pass" name="user_pass" required>
                </div>
                <div class="mb-2">
                    <a href="/member/findpw">비밀번호를 잊으셨습니까?</a>
                </div>
                <div class="mb-3">
                    <button class="btn btn-primary btn-lg btn-block col-lg-8 float-righ" type="submit">로그인</button>
                    <button class="btn btn-success btn-lg btn-block col-lg-8 float-righ"
                            onclick="location.href='/member/join'">회원가입
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<br>

<footer class="footer" style="position: fixed; bottom: 0; left: 0; right: 0;">
    <%@ include file="/resources/include/footer.jsp" %>
  </footer>

<script>
    var result = "${param.result}";

    if (result === "success") {
        alert("로그인에 성공하였습니다.");
        window.location.href = "/";
    } else if (result === "fail") {
        alert("아이디 혹은 비밀번호가 맞지 않습니다.");
    } else if (result === "null") {
        alert("입력된 값이 올바르지 않습니다.");
    }
</script>

</body>
</html>