<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${managerDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>프로필 바입니다.</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/manager/css/manager.css" rel="stylesheet">
<link
	href="${app}/resources/manager/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/manager/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$('.man_logout').click(function(){
		location.href="${app}/manager/logout";
	});
});
</script>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/manager/css/manager.css" rel="stylesheet">
<link
	href="${app}/resources/manager/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>


	<div class="card-body">
		<div class="media align-items-center mb-4">
			<div class="media-body">
				<p class="text-muted mb-0">Manager</p>
			</div>
		</div>

		<div class="row mb-5">
			<div class="col">
				<div class="card card-profile text-center">
					<span class="mb-1 text-warning">
						<c:choose>
			 				<c:when test='${dto.brand eq "GS25"}'>
						    	<img src="${app}/resources/manager/img/gs_logo.png" alt="Brand" class="img-fluid rounded-circle">
						    </c:when>
						    <c:when test='${dto.brand eq "CU"}'>
						    	<img src="${app}/resources/manager/img/cu_logo.png" alt="Brand" class="img-fluid rounded-circle">
						    </c:when>
						    <c:when test='${dto.brand eq "세븐일레븐"}'>
						    	<img src="${app}/resources/manager/img/seven_logo.png" alt="Brand" class="img-fluid rounded-circle">
						    </c:when>
						    <c:when test='${dto.brand eq "미니스톱"}'>
						    	<img src="${app}/resources/manager/img/mini_logo.png" alt="Brand" class="img-fluid rounded-circle">
						    </c:when>
						    <c:when test='${dto.brand eq "emart24"}'>
						    	<img src="${app}/resources/manager/img/e24_logo.jpg" alt="Brand" class="img-fluid rounded-circle">
						    </c:when>
							<c:otherwise>
								<img src="${app}/resources/manager/img/부산요거트.jpg" alt="Brand" class="img-fluid rounded-circle">
							</c:otherwise>
						</c:choose>
					</span>
				</div>
			</div>
		</div>


		<div class="media-body" >
			<p class="text-muted mb-0">${dto.name}점장님 안녕하세요.</p>
			<p class="text-muted mb-0">${dto.brand}&nbsp;${dto.spot}</p>
			<p class="text-muted mb-0">편의점 코드 : ${dto.storecode}</p>
			<p class="text-muted mb-0"><a href="${app}/manager/profit">수익금 : ${dto.profit} 원</a></p>
		</div>

		<div class="row mb-5">
			<div class="col-12 text-center" style="margin: 10px 0 10px 0;">
				<a href="${app}/manager/home" id="allList" class="btn mb-1 btn-warning btn-block">나의 점포 전 상품</a>
			</div>

			<div class="col-12 text-center" style="margin: 10px 0 10px 0;">
				<a href="${app}/manager/enrolled" class="btn mb-1 btn-warning btn-block">등록된 임박 상품</a>
			</div>

			<div class="col-12 text-center" style="margin: 10px 0 10px 0;">
				<a href="${app}/manager/enroll" class="btn mb-1 btn-warning btn-block">임박상품 등록</a>
			</div>

			<div class="footer"
				style="width: 300px; height: 200px; padding-left: 0px; text-align: center;">
				<p>
					<a href="/store/manager/logout">로그아웃</a>
				</p>
			</div>
		</div>
	</div>

</body>
</html>