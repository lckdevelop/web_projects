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
<header id="header">
	<div class="d-flex flex-column">
		<div id="text-space-box">
	 		<div class="profile">
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
				<h3>${dto.brand}</h3>
				<h3 class="text-light">${dto.name}점장님 안녕하세요.</h3>
				<h3 class="text-light">${dto.brand}&nbsp;${dto.spot}</h3>
				<h3 class="text-light">${dto.storecode}</h3>
				<h3 class="text-light">
					<a href="${app}/manager/profit">수익금:${dto.profit}</a>
				</h3>
			</div>
		</div>
	</div>
</header>
		
<div id="box-center-list">
	<ul id="list-link">
		<li class="list-link-to"><a href="${app}/manager/home" id="allList">마이점포 전상품
			</a></li>
		<li class="list-link-to"><a href="${app}/manager/enrolled" id="" >등록된 임박 상품
			</a></li>
		<li class="list-link-to"><a href="${app}/manager/enroll" id="" >임박상품 등록 
			</a></li>
	</ul>
	<input type="button" value="로그아웃" class="man_logout"   />
</div>
</body>
</html>