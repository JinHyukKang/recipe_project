<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import="com.recipe.model.MemberVO" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="stylesheet" href="${path}/resources/css/MyPagecustom.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>



<!-- 마이페이지 헤더 -->
<div id="change-mod" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
	    <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="/MyPage/MyPage"><span><strong>회원정보수정</strong></span></a></li>
	    <li class="ui-state-default ui-corner-top"><a href="/MyPage/MyPagePost"><span><strong>내게시물</strong></span></a></li>
    </ul>
</div>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
		<form action="/MyPage/updateMember.do" method="POST">
	    	<div class="d-flex" id="chNickname" >
	    		<label class="col-md-1 nickname">${user_nickname}님</label>
	    	</div>
	    	
	    	<div class="form-group row mt-3 mx-3">
				<label class="col-sm-3">이름 : </label>
				<div class="col-sm-5">
					<input type="text" name="user_name" id="user_name" class="form-control-sm"  value="${user_name}" disabled/>
				</div>
			</div>
			
	    	<div class="form-group row mt-3 mx-3">
				<label class="col-sm-3">아이디 : </label>
				<div class="col-sm-5">
					<input type="text" name="user_id" id="user_id" class="form-control-sm"  value="${user_id}" disabled/>
				</div>
			</div>
			
			<div class="form-group row mt-3 mx-3">
				<label class="col-sm-3">비밀번호 : </label>
				<div class="col-sm-6">
					<input type="password" name="user_pass" id="user_pass"  class="form-control-sm"  value="${user_pass}"/>(수정가능)
				</div>
			</div>
			
			<div class="form-group row mt-3 mx-3">
				<label class="col-sm-3">이메일 : </label>
				<div class="col-sm-6">
					<input type="email" name="user_email" id="user_email" class="form-control-sm"  value="${user_email}"/>(수정가능)
				</div>
			</div>
			
			
			<div class="form-group row mt-3 mx-3">
			<label for="address">주소</label><br>
				<div class="col-lg-4">
			        <input type="text" class="form-control-sm" id="user_postcode" name="user_postcode" placeholder="${user_postcode}">
			        <input type="button" class="btn btn-primary col-lg-1" onclick="sample6_execDaumPostcode()" value="주소 수정"><br>
		        </div>
		        <div class="mb-1">
					<input type="text" class="form-control-sm" id="user_addr" name="user_addr" placeholder="${user_addr}">
				</div>
				<div class="d-flex">
					<input type="text" class="form-control-sm" id="user_detailaddr" name="user_detailaddr"  placeholder="${user_detailaddr}">
					<input type="text" class="form-control-sm" id="user_extraaddr" name="user_extraaddr" placeholder="${user_extraaddr}">
				</div>
			</div>
			<div class="form-group row mt-3 mx-3">
				<input type="submit" class="btn btn-success" value="수정완료"/>
			</div>
		</form>
		</div>
	</div>
</div>

<script>
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