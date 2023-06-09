<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  	<link rel="stylesheet" href="${path}/resources/css/custom.css"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 조회(최신순)</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			<form action="/board/writeUpdate.do" method="post">
				<c:forEach items="${viewWrite}" var="viewWrite">
				<h4><strong>[${viewWrite.recipe_title}]</strong></h4>
				
				<div class="form-group row mt-3 mx-3 border" style="border-radius: 10px;">
					<div class="d-flex mt-s">
						<p style="font-size:17px; font-style:oblique;">작성자 : <strong>${viewWrite.user_nickname}</strong>님</p>
						<div class="ms-auto">
							<h6 style="font-style:oblique;">작성일 : <fmt:formatDate value="${viewWrite.insert_date}" pattern="yyyy년 MM월 dd일 HH시 mm분" /></h6>
						</div>
					</div>
					<div class="justify-content-center row mt-5 mb-5" style="margin-bottom:100px;">
						<img src="${path}/resources/upload/${viewWrite.recipe_filename}.jpg" 
						id="recipe_filename" name="recipe_filename" style="width: 600px; height: 400px;">
					</div>
					<div style="margin-left:100px; margin-right:100px; margin-bottom:80px;">
						<p style="font-size:18px;">${viewWrite.recipe_content}</p>
					</div>
					
					<!-- 추천수, 댓글수, 조회수 출력 -->
					<div class="d-flex" style="margin-left:60px; margin-right:60px; margin-bottom:10px;">
						<!-- 추천수 출력 및 추천하기 -->
						<!-- 로그인 했을 경우에만 출력 가능 -->
						<c:if test="${user_id eq null}">
							<a id="good_count" href="#" onclick="GoodClick(event)">
								<img id="notgood" src="${path}/resources/images/notgood.png" id="good_count_img" name="good_count_img" style="width: 25px; height: 20px;">
							</a>
						</c:if>
						<c:if test="${user_id ne null}">
							<a id="good_count" href="#" onclick="checkLoginGood(event)">
								<img id="notgood" src="${path}/resources/images/notgood.png" id="good_count_img" name="good_count_img" style="width: 25px; height: 20px;">
							</a>
						</c:if>
						<div style="line-height:1.4; margin-left:6px; margin-right:40px;">
						   <p style="font-size:18px;">${viewWrite.good_count}</p>
					   </div>
					   
					   <!-- 댓글수 출력 -->
					   <img src="${path}/resources/images/comment.png" id="comment_count_img" name="comment_count_img" style="width: 25px; height: 20px;">
					   <div style="line-height:1.4; margin-left:6px; margin-right:40px;">
						   <p style="font-size:18px;">${viewWrite.comment_count}</p>
					   </div>
					   <!-- 조회수 출력 -->
					   <img src="${path}/resources/images/view.png" id="view_count_img" name="view_count_img" style="width: 25px; height: 20px;">
					   <div style="line-height:1.4; margin-left:6px; margin-right:40px;">
						   <p style="font-size:18px;">${viewWrite.view_count}</p>
					   </div>
					</div>
				</div>	
				
				<!-- 댓글창 -->
				<div class="form-group row mt-3 mx-3 mb-5 border" style="border-radius: 10px;">
				</div>
				</c:forEach>
			</form>
			<div class="mb-3">
				<button type="button" class="btn btn-secondary row mt-3 mx-3" onclick="location.href = '/board/board';">목록으로</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="/resources/include/footer.jsp" %>

<script>
function checkLoginGood(){
	event.preventDefault();
	alert("로그인하셔야 추천하실 수 있습니다.")
};

function GoodClick() {
	event.preventDefault();
    var imgElement = document.getElementById('notgood');
    var idValue = imgElement.id;

    $.ajax({
        url: '/board/Good.do',
        type: 'post',
        data: { idValue: idValue },
        success: function(response) {
            if (response === "good") {
                imgElement.id = "good";
                imgElement.src = "${path}/resources/images/good.png";
            } else if (response === "notgood") {
                imgElement.id = "notgood";
                imgElement.src = "${path}/resources/images/notgood.png";
            } else {
                alert("추천 기능 오류!");
            }
        }
    });
};
</script>
	
</body>
</html>