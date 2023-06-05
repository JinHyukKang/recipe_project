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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
    <div class="input-form-backgroud row">
    <a href="/MyPage/MyPagePost">내 게시물</a>
    <a href="/MyPage/MyPage">마이페이지</a>
      <div class="input-form col-md-12 mx-auto">
      <form action="/MyPage/updateMember.do" method="post">
      <c:forEach items="${findUser}" var="findUser">
      
        <h4 class="mb-3">${findUser.getUser_nickname()}님</h4>
        
        
          <div class="mb-3">
              <label for="user_id">아이디</label>
              <div class="d-flex">
              
              	<input type="text" class="form-control col-lg-5" id="user_id" name="user_id" value="${findUser.user_id}" disabled>
             
              </div>
          </div>
          
          <div class="mb-3">
              <label for="user_pass">비밀번호</label>
              <div class="d-flex">
              <input type="password" class="form-control col-lg-6" id="user_pass" name="user_pass" value="${findUser.user_pass}">(수정가능)
              </div>
          </div>

          
          <div class="row mb-3">
            <div class="col-lg-5">
              <label for="user_name">이름</label>
              <input type="text" class="form-control-sm" id="user_name" name="user_name" value="${findUser.user_name}" disabled>
            </div>
          </div>
          

          <div class="mb-3">
            <label for="user_email">이메일</label>
            <div class="d-flex">
            <input type="email" class="form-control col-lg-6" id="user_email" name="user_email" value="${findUser.user_email}">(수정가능)
            <button class="btn btn-primary col-lg-3">이메일 인증</button>
            </div>
          </div>
          
          
         
         
		<div class="form-group mb-3">
			<label for="address">주소</label>(수정가능)<br>
				<div class="d-flex mb-1">
			        <input type="text" class="form-control col-lg-4" id="user_postcode" name="user_postcode" value="${findUser.user_postcode}" readonly>
			        <input type="button" class="form-control btn btn-success col-lg-3" onclick="sample6_execDaumPostcode()" value="주소수정"><br>
		        </div>
		        <div class="mb-1">
					<input type="text" class="form-control col-lg-4" id="user_addr" name="user_addr" value="${findUser.user_addr}" readonly>
				</div>
				<div class="d-flex">
					<input type="text" class="form-control col-lg-4" id="user_detailaddr" name="user_detailaddr" value="${findUser.user_detailaddr}">
					<input type="text" class="form-control col-lg-4" id="user_extraaddr" name="user_extraaddr" value="${findUser.user_extraaddr}" readonly>
				</div>
		</div>
		
		
          
          <hr class="mb-4">
          
          <div class="mb-4"></div>
          <input type="submit" class="btn btn-primary btn-lg btn-block" onclick="updateSuccess()" value="수정 완료"/>
          </c:forEach>
        </form>
        
     	</div>
  	</div>
</div>
   <br>
   

<footer class="footer">
<%@ include file="/resources/include/footer.jsp" %>
</footer>

   
<script>

function updateSuccess() {
    alert('회원정보 수정이 완료되었습니다!');
  }

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("user_extraaddr").value = extraAddr;
            
            } else {
                document.getElementById("user_extraaddr").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('user_postcode').value = data.zonecode;
            document.getElementById("user_addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("user_detailaddr").focus();
        }
    }).open();
}

</script>




</body>
</html>