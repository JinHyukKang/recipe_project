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
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 조회(최신순)</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
			
			<c:forEach items="${viewWrite}" var="viewWrite">
			<h4><strong>[${viewWrite.recipe_title}]</strong></h4>
			<c:set var="recipe_num" value="${viewWrite.recipe_num}" />
			<div class="form-group row mt-3 mx-3" style="border: 1px solid; border-radius: 10px;">
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
					
					<c:if test="${user_id ne null && goodStatus eq null}">
				        <a id="good_count_click" href="#" onclick="GoodClick(event, ${recipe_num})">
				            <img id="good" src="${path}/resources/images/notgood.png"  name="good_count_img" style="width: 25px; height: 20px;">
				        </a>
				    </c:if>
				    <c:if test="${user_id ne null && goodStatus ne null}">
				    	<a id="good_count_click" href="#" onclick="GoodClick(event, ${recipe_num}, '${goodStatus}')">
					        <img id="good" src="${path}/resources/images/${goodStatus}.png"  name="good_count_img" style="width: 25px; height: 20px;">
					    </a>
				    </c:if>
				    <c:if test="${user_id eq null}">
				        <a id="good_count" href="#" onclick="checkLogin(event)">
				            <img id="good" src="${path}/resources/images/notgood.png"  name="good_count_img" style="width: 25px; height: 20px;">
				        </a>
				    </c:if>
					<div style="line-height:1.4; margin-left:6px; margin-right:40px;">
					   <p  id="good_count" style="font-size:18px;">${viewWrite.good_count}</p>
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
			<div class="form-group row mt-3 mx-3" style="border: 1px solid; border-radius: 10px;background-color: lightgray;">
				<!-- 댓글작성 -->
				<c:if test="${user_id ne null}">
					<form method="post" action="/board/commentWriteDate.do">
					<input type="hidden" name="recipe_num" value="${viewWrite.recipe_num}">
					<div class="d-flex mt-3 mb-3" style="margin-left:100px;">
						<textarea class="form-control" id="comment_content" name="comment_content" style="width:900px; height: 1.5em;"></textarea>
						<button type="submit" class="btn btn-success">댓글 작성</button>
					</div>
					</form>
				</c:if>
				<c:if test="${user_id eq null}">
				<input type="hidden" name="recipe_num" value="${viewWrite.recipe_num}">
				<input type="hidden" name="user_num" value="${viewWrite.user_num}">
					<div class="d-flex mt-3 mb-3" style="margin-left:100px;">
						<textarea class="form-control" id="comment_content" name="comment_content" style="width:900px; height: 1.5em;"></textarea>
						<button type="submit" class="btn btn-success" onclick="checkLoginComment()">댓글 작성</button>
					</div>
				</c:if>
				<!-- 댓글 출력 -->

					<c:forEach items="${commentView}" var="commentView">
						
							<input type="hidden" name="comment_num"
								value="${commentView.comment_num}">
							<div class="d-flex"
								style="margin-left: 100px; margin-bottom: 5px; line-height: 1;">
								<!--댓글 작성자 닉네임 출력 -->
								<p id="comment_nickname"
									style="margin-right: 750px; margin-bottom: 0px;">
									<strong>${commentView.user_nickname}</strong>님
								</p>
								<div style="">
									<!-- 댓글 작성일 출력 -->
									<p id="comment_date"
										style="font-size: 11px; margin-bottom: 0px;">
										<fmt:formatDate value="${commentView.comment_date}"
											pattern="yyyy년 MM월 dd일" />
									</p>
								</div>
							</div>
							<c:if test="${user_num eq commentView.user_num}">
							<!-- 댓글 수정 -->
						    <form method="post" action="/board/commentUpdateDate.do" id="commentForm-${commentView.comment_num}">
						        <input type="hidden" name="comment_num" value="${commentView.comment_num}">
						        <input type="hidden" name="recipe_num" value="${viewWrite.recipe_num}">
						        <div class="d-flex" style="margin-left: 100px; line-height: 0; margin-top: 0px;">
						            <!-- 댓글 수정 버튼 -->
						            <textarea id="comment_content_update-${commentView.comment_num}" name="comment_content_update" class="form-control comment_content_update" style="margin-top: 0px; margin-bottom: 18px; width: 900px; height: 1em;" readonly>${commentView.comment_content}</textarea>
						            <p id="editButton-${commentView.comment_num}" class="editButton" style="line-height: 3; margin-bottom: 0px;">
						                <a href="#" onclick="toggleButtons(event, ${commentView.comment_num})" style="color: black; text-decoration: none;">수정</a>
						            </p>
						            <p id="slash-${commentView.comment_num}" style="line-height: 3; margin-bottom: 0px;">|</p>
						            <!-- 댓글 삭제 -->
						            <p class="deleteButton-${commentView.comment_num}" style="line-height: 3; margin-bottom: 0px;">
						                <a href="#" onclick="deleteComment(${commentView.comment_num}, ${viewWrite.recipe_num}, event)" style="color: black; text-decoration: none;">삭제</a>
						            </p>
						            <div class="d-flex">
							            <button id="comment_update-${commentView.comment_num}" name="updateButton" 
							            type="submit" class="btn btn-primary comment_update" style="display: none; height: 40px;">수정완료</button>
							            <button id="comment_updateBack-${commentView.comment_num}" name="updateBackButton" onclick="return cancelUpdate(event, '${commentView.recipe_num}')" 
							            class="btn btn-danger comment_updateBack" style="display: none; height: 40px;">수정취소</button>
						            </div>
						        </div>
						    </form>
							</c:if>
							<c:if test="${user_num ne commentView.user_num}">
								<div
									style="margin-left: 100px; line-height: 0; margin-top: 0px;">
									<textarea id="comment_content" class="form-control"
										style="margin-top: 0px; margin-bottom: 18px; width: 900px; height: 1em;"
										readonly>${commentView.comment_content}</textarea>
								</div>
							</c:if>
						
					</c:forEach>

					</div>
				
			</c:forEach>
			
			<!-- 목록으로 -->
			<div class="mb-3">
				<button type="button" class="btn btn-secondary row mt-3 mx-3" onclick="location.href = '/board/board';">목록으로</button>
			</div>
			
		</div>
	</div>
</div>

<%@ include file="/resources/include/footer.jsp" %>

<script>
//로그인 상태 확인
function checkLogin(){
	event.preventDefault();
	alert("로그인하셔야 추천하실 수 있습니다.")
};

function checkLoginComment(){
	event.preventDefault();
	alert("로그인하셔야 댓글을 작성하실수 있습니다.")
};

//추천 증가 및 감소
function GoodClick(event, recipe_num) {
    event.preventDefault();
    var imgElement = document.getElementById('good');

    var status = imgElement.src.endsWith("/notgood.png") ? "good" : "notgood";

    $.ajax({
        url: '/board/Good.do',
        type: 'post',
        data: { recipe_num: recipe_num, status: status },
        success: function(response) {
            if (response === "good") {
                imgElement.src = "${path}/resources/images/good.png";
                var countElement = document.getElementById("good_count");
                countElement.textContent = parseInt(countElement.textContent) + 1;
            } else if (response === "notgood") {
                imgElement.src = "${path}/resources/images/notgood.png";
                var countElement = document.getElementById("good_count");
                countElement.textContent = parseInt(countElement.textContent) - 1;
            } else {
                alert("추천 기능 오류!");
            }
        }
    });
};


//댓글 수정 버튼 누르면 수정 칸 나오게 하기
function toggleButtons(event, commentNum) {
	event.preventDefault();

    var editButton = document.getElementById("editButton-" + commentNum);
    var deleteButton = document.querySelector(".deleteButton-" + commentNum);
    var commentContent = document.getElementById("comment_content_update-" + commentNum);
    var slashButton = document.getElementById("slash-"+ commentNum);
    var updateButton = document.getElementById("comment_update-" + commentNum);
    var updateBackButton = document.getElementById("comment_updateBack-" + commentNum);

    editButton.style.display = "none";
    slashButton.style.display = "none";
    deleteButton.style.display = "none";
    commentContent.readOnly = false;
    updateButton.style.display = "inline-block";
    updateBackButton.style.display = "inline-block";
    
 
}
  
//댓글 삭제
function deleteComment(commentNum, recipeNum,event) {
	event.preventDefault();
    if (confirm("댓글을 삭제하시겠습니까?")) {
        $.ajax({
            url: '/board/commentDelDate.do',
            type: 'post',
            data: { comment_num: commentNum, recipe_num: recipeNum },
            success: function(response) {
                alert("댓글이 삭제되었습니다.");
                location.href = '/board/ViewWriteDate?recipe_num=' + recipeNum;
            },
            error: function(xhr, status, error) {
                alert("댓글 삭제에 실패했습니다.");
            }
        });
    }
}

//수정취소
function cancelUpdate(event, recipeNum) {
    event.preventDefault();
    alert("댓글 수정을 취소하셨습니다.");
    window.location.href = '/board/ViewWriteDate?recipe_num=' + recipeNum;
    return false;
}
</script>
	
</body>
</html>