<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="${path}/resources/css/MyPagecustom.css"/>
  <link rel="stylesheet" href="${path}/resources/js/popuptest.js"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>

<!-- 마이페이지 헤더 -->
<div id="change-mod" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
	    <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="/MyPage"><span><strong>회원정보수정</strong></span></a></li>
	    <li class="ui-state-default ui-corner-top"><a href="/MyPagePost"><span><strong>내게시물</strong></span></a></li>
       	<li class="ui-state-default ui-corner-top"><a href="/MyPageCoupon"><span><strong>쿠폰함</strong></span></a></li>
    </ul>
</div>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			
	    	<div class="d-flex" id="chNickname" >
	    	<label class="col-md-1 nickname">닉네임</label>
	    	<button type="submit" class="btn btn-primary btn-xs">수정</button>
	    	</div>
	    	
	    	<div class="form-group row mt-3 mx-3">
				<label class="col-sm-3">이름 : </label>
				<div class="col-sm-5">
					<input type="text" name="name"  class="form-control-sm" value="강진혁" disabled/>
				</div>
			</div>
			
	    	<div class="form-group row mt-3 mx-3">
				<label class="col-sm-3">이메일 : </label>
				<div class="col-sm-5">
					<input type="email" name="email"  class="form-control-sm" value="jhkang0330@naver.com" disabled/> (인증됨)
				</div>
			</div>
			
			<div class="form-group row mt-3 mx-3">
				<label class="col-sm-3">비밀번호 : </label>
				<div class="col-sm-5">
					<input type="password" name="email"  class="form-control-sm" value="jhkang0330@naver.com"/>
					<button type="submit" class="btn btn-primary btn-xs" value="password">수정 </button>
				</div>
			</div>
			
			<div class="form-group row mt-3 mx-3">
				<label class="col-sm-3">휴대전화 : </label>
				<div class="col-sm-5">
					<input type="text" name="email"  class="form-control-sm" value="010-1234-1234"/>
					<button type="submit" class="btn btn-primary btn-xs" value="password">수정 </button>
				</div>
			</div>
			
			<div class="form-group row mt-3 mx-3">
				<label class="col-sm-10">성별 : </label>
				<div>
					<label><input type="checkbox" name="sex" value="남" checked disabled/>남</label>
					<label><input type="checkbox" name="sex" value="여" disabled/>여</label>
				</div>
			</div>
			
			<div class="form-group row mt-3 mx-3">
				<label class="col-sm-10">주소 : </label>
				<div id="address1" class="form-group row mt-3 mx-3">
					<div class="col-sm-3">
					<label>시/도 : </label>
						<select size="1">
							<option value="서울">서울</option>
						</select>
					</div>
					<div class="col-sm-6" >
					<label>시/군/구 : </label>
						<select size="1">
							<option value="노원구">노원구</option>
						</select>
					</div>
					<div class="col-sm-5">
					
					</div>
				</div>
				<div class="form-group row mt-3 mx-3">
				<label class="col-sm-10">상세주소 입력 : </label>
					<div class="col-sm-10">
						<input type="text" name="address2" size=50 class="form-control-sm" value="노원구 롯데백화점"/>
						<button type="submit" class="btn btn-primary btn-xs" value="password">수정 </button>
					</div>
					
				</div>
				
			</div>	
			
			
		</div>
	</div>
</div>    

			
		
		
		
</body>
</html>