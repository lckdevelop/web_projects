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
</head>
<body>
<header id="header">
	<div class="d-flex flex-column">
	<div id="text-space-box">
 		<div class="profile">
			<img src="${app}/resources/manager/img/profile-img.jpg" alt=""
				class="img-fluid rounded-circle">
				<h3 class="text-light">${dto.name}점장님 안녕하세요.</h3>
				<h3 class="text-light">${dto.brand}${dto.spot}</h3>
				<h3 class="text-light">${dto.storecode}</h3>
				<h3 class="text-light">
					<a href="index.html">수익금:${dto.profit}</a>
					</h3>
			</div>
		</div>
	</div>
</header>
		
<div id="box-center-list">
	<ul id="list-link">
		<li  class="list-link-to"><a id="allList">마이점포 전상품 리스트
			</a></li>
		<li  class="list-link-to"><a id="" >폐기임박상품 등록 리스트
			</a></li>
		<li  class="list-link-to"><a id="" >폐기임박상품 리스트 
			</a></li>
	</ul>
</div>
</body>
</html>