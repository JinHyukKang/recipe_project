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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>
</head>
<body>
<div class="container">
    <div class="row mt-5">
        <div class="col-md-12">
	        <form action="/MyPage/memberout.do" method="post">
	        	<h4 class="mb-3">회원탈퇴</h4>
	       		<h6 class="mb-4">회원 탈퇴를 위해 아이디와 비밀번호를 확인해주세요</h6>
	        	
	        	<div class="mb-3">
	                 <label for="user_id">아이디</label>
	                 <input type="text" class="form-control col-lg-5" style="max-width: 300px;" id="user_id" name="user_id" required>
	            </div>
	            
	            <div class="mb-3">
	                <label for="user_pass">비밀번호</label>
	                <input type="password" class="form-control col-lg-5" style="max-width: 300px;" id="user_pass" name="user_pass" required>
	            </div>
	            
	            <div class="mb-4">
	                <button class="btn btn-danger btn-lg btn-block col-lg-8 float-righ" type="submit" style="max-width: 300px;" >회원탈퇴</button>            
	            </div>
	        </form>
        </div>
    </div>
</div>

</body>



</html>