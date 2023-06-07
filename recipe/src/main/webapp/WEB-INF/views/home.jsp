<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="${path}/resources/css/custom.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp" %>

<main>
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/images/1.jpg" alt="Los Angeles" class="d-block" height="400px" style="width:100%">
      <div class="carousel-caption">
        <h3>Los Angeles</h3>
        <p>We had such a great time in LA!</p>
      </div>
    </div>
    <div class="carousel-item carousel-inner">
      <img src="resources/images/2.jpg" alt="Chicago" class="d-block" height="400px" style="width:100%">
      <div class="carousel-caption">
        <h3>Chicago</h3>
        <p>Thank you, Chicago!</p>
      </div> 
    </div>
    <div class="carousel-item carousel-inner">
      <img src="resources/images/3.jpg" alt="New York" class="d-block"  height="400px" style="width:1000%">
      <div class="carousel-caption">
        <h3>New York</h3>
        <p>We love the Big Apple!</p>
      </div>  
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>



<div class="container">
	<div class="row mt-5">
		<div class="col-md-12">
     	<section>
			<h3 class="mb-3"><strong>베스트 게시물</strong></h3>
			
			<div class="d-flex mb-5">
				<c:forEach var="findWriteAllGood" items="${findWriteAllGood}" varStatus="loop" begin="0" end="3">
				<div style="margin-right: 100px;">
					<a href="">
						<img src ="${path}/resources/upload/${findWriteAllGood.recipe_filename}.jpg" style="width: 230px; height: 150px;">
					</a>
				</div>
				</c:forEach>
			</div>
		</section>
		
		<section>
			<h3 class="mb-3"><strong>최신 게시물</strong></h3>
			
			<div class="d-flex mb-5">
				<c:forEach var="findWriteAll" items="${findWriteAll}" varStatus="loop" begin="0" end="3">
				<div style="margin-right: 100px;">
					<a href="">
						<img src ="${path}/resources/upload/${findWriteAll.recipe_filename}.jpg" style="width: 230px; height: 150px;">
					</a>
				</div>
				</c:forEach>
			</div>
		</section>
		
		<section>
			<h3 class="mb-3"><strong>많이본 게시물</strong></h3>
			
			<div class="d-flex mb-5">
				<c:forEach var="findWriteAllView" items="${findWriteAllView}" varStatus="loop" begin="0" end="3">
				<div style="margin-right: 100px;">
					<a href="">
						<img src ="${path}/resources/upload/${findWriteAllView.recipe_filename}.jpg" style="width: 230px; height: 150px;">
					</a>
				</div>
				</c:forEach>
			</div>
		</section>
		
      	</div>
     </div>
</div>

</main>

 <%@ include file="/resources/include/footer.jsp" %>
 
 
</body>


</html>