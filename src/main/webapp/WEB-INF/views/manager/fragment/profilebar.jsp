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

<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300;500;700;900&display=swap" rel="stylesheet">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
 <!-- Custom Stylesheet -->
<link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">

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

</head>
<body>
	<div class="card-body">
		<div class="media align-items-center mb-4">
			<div class="media-body">
				<h3 class="mb-0">${dto.name}</h3>
				<p class="text-muted mb-0">Manager</p>
			</div>
		</div>
		<div class="row">
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
		<div class="row my-5">
			<div class="profile_info" >
				<p class="text-muted mb-0">${dto.name}점장님 안녕하세요.</p>
				<p class="text-muted mb-0">${dto.brand}&nbsp;${dto.spot}</p>
				<p class="text-muted mb-0">편의점 코드 : ${dto.storecode}</p>
				<div class="profit_margin_box"><p></p></div>
				<div class="profit_margin_box"><p></p></div>
				<p class="text-muted mb-0"><a href="${app}/manager/profit" class="profit_link"><b>수익금 : ${dto.profit} 원</b></a></p>
			</div>
		</div>
		<div class="row mb-5">
			<div class="col-12 text-center" style="margin: 10px 0 10px 0;">
				<button class="btn mb-1 btn-warning btn-block" onclick="location.href='${app}/manager/home'">나의 점포 전 상품</button>
			</div>

			<div class="col-12 text-center" style="margin: 10px 0 10px 0;">
				<button class="btn mb-1 btn-warning btn-block" onclick="location.href='${app}/manager/enrolled'">등록된 임박 상품</button>
			</div>

			<div class="col-12 text-center" style="margin: 10px 0 10px 0;">
				<button class="btn mb-1 btn-warning btn-block" onclick="location.href='${app}/manager/enroll'">임박상품 등록</button>
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