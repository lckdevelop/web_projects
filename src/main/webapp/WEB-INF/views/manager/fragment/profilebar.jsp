<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/favicon.PNG">
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
						<img src="${app}/resources/manager/img/${dto.brand}.png" alt="Brand" class="img-fluid rounded-circle">
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
				<p class="text-muted mb-0"><a href="${app}/manager/profit" class="profit_link">수익금 : <f:formatNumber value="${dto.profit}" pattern="#,###" /> 원</a></p>
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