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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
      <form action="/member/join.do" method="post">
        <h4 class="mb-3">회원가입</h4>
        
        
          <div class="mb-3">
              <label for="user_id">아이디</label>
              <div class="d-flex">
              	<input type="text" class="form-control col-lg-5" id="user_id" name="user_id" required>
              	<span id="id_error"></span><br>
              	<button class="btn btn-primary col-lg-2" id="id_Chk" onclick="checkUserId()">중복 확인</button>
              </div>
          </div>
          
          <div class="mb-3">
              <label for="user_pass">비밀번호</label>
              <input type="password" class="form-control col-lg-8" id="user_pass" name="user_pass" required>
          </div>
          
          <div class="mb-3">
              <label for="user_pass2">비밀번호 확인</label>
              <input type="password" class="form-control col-lg-8" id="user_pass2" name="user_pass2" required>
              <span id="pass_error" style="color: red;"></span> <!-- 비밀번호 일치 여부를 표시할 요소 -->
          </div>
          
          <div class="row">
            <div class="col-lg-5">
              <label for="user_name">이름</label>
              <input type="text" class="form-control-sm" id="user_name" name="user_name" required>
            </div>
           
          <div class="col-lg-3">
            <label for="gender">성별 </label><br>
               <input type="radio" id="user_gender"  name="user_gender" value="남">
               <label for="option1">남</label>
             
               <input type="radio" id="user_gender" name="user_gender" value="여">
               <label for="option2">여</label>             
         </div><br>
          </div>
          <div class="dropdown">
            <label for="user_birth" class="form-label">생년월일 </label>
            <input type="date" class="form-control  col-lg-6" name="user_birth" value="<fmt:formatDate value="${user_birth}" type="full"/>">
         </div>
            
            <div class="mb-3">
              <label for="user_nickname">닉네임</label>
              <div class="d-flex">
              	<input type="text" class="form-control col-lg-5" id="user_nickname" name="user_nickname" required>
              	<button class="btn btn-primary col-lg-2" id="nickname_Chk" onclick="checkUserNickname()">중복 확인</button>
              </div>
            </div>
          

          <div class="mb-3">
            <label for="user_email">이메일</label>
            <div class="d-flex">
            <input type="email" class="form-control col-lg-6" id="user_email" name="user_email" placeholder="you@example.com" required>
            <button class="btn btn-primary col-lg-3">이메일 인증</button>
            </div>
          </div>
          
          
         
         
		<div class="form-group mb-3">
			<label for="address">주소</label><br>
				<div class="d-flex mb-1">
			        <input type="text" class="form-control col-lg-4" id="user_postcode" name="user_postcode" placeholder="우편번호">
			        <input type="button" class="form-control btn btn-success col-lg-3" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		        </div>
		        <div class="mb-1">
					<input type="text" class="form-control col-lg-4" id="user_addr" name="user_addr" placeholder="주소">
				</div>
				<div class="d-flex">
					<input type="text" class="form-control col-lg-4" id="user_detailaddr" name="user_detailaddr" placeholder="상세주소">
					<input type="text" class="form-control col-lg-4" id="user_extraaddr" name="user_extraaddr" placeholder="참고항목">
				</div>
		</div>
		
		
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <input type="submit" class="btn btn-primary btn-lg btn-block" value="가입 완료"/>
        </form>
        
     	</div>
  	</div>
</div>
   <br>
   

<footer class="footer">
<%@ include file="/resources/include/footer.jsp" %>
</footer>

   
<script>
//아이디 중복 테스트
function checkUserId() {
    var user_id = $('#user_id').val();
    
	$("#id_Chk").click(function() {
        $.ajax({
            url: '/member/idChk',
            type: 'post',
            data: {user_id: user_id},
            success: function(response){
            	if(response === "fail") {
            		alert("이미 사용중인 아이디입니다.");
            	}else if(response === "success") {
            		alert("사용 가능한 아이디입니다.");
            	}else {
            		alert("잘못된 값 전달");
            	}
            }
        });
	});
};

//닉네임 중복 테스트
function checkUserNickname() {
    var user_nickname = $('#user_nickname').val();
    
	$("#nickname_Chk").click(function() {
        $.ajax({
            url: '/member/nicknameChk',
            type: 'post',
            data: {user_nickname: user_nickname},
            success: function(response){
            	if(response === "fail") {
            		alert("이미 사용중인 닉네임입니다.");
            	}else if(response === "success") {
            		alert("사용 가능한 닉네임입니다.");
            	}else {
            		alert("잘못된 값 전달");
            	}
            }
        });
	});
};

//비밀번호 확인
function checkUserpass() {
    var user_pass = $('#user_pass').val();
    var user_pass2 = $('#user_pass2').val();

    if (user_pass === user_pass2) {
        $('#pass_error').text('비밀번호가 일치합니다');
        $('#pass_error').css('color', 'green');
    }else {
        $('#pass_error').text('비밀번호가 일치하지 않습니다');
        $('#pass_error').css('color', 'red');
    }
}

$(document).ready(function() {
    // 비밀번호 입력란 또는 비밀번호 확인 입력란에서 포커스가 해제될 때 비밀번호 확인 함수 호출
    $('#user_pass, #user_pass2').blur(checkUserpass);
});

</script>




</body>
</html>