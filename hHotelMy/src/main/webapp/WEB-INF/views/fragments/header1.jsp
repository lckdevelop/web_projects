<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header1</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function() {
	$('#toHome').click(function() {
		$(location).attr('href', 'home');
	});
});
</script>
</head>
<body>
<script src="/hHotel/resources/js/bootstrap.min.js"></script>
<div class="mainLogoContainer">
	<c:choose>
		<c:when test="${loginOk}">
			<div class="right-float">
				<a style="text-decoration:none"><font class="welId">${member_id}님 환영합니다.</font></a>
				<a href='logout'> <font class="right_float_font">| 로그아웃 |</font></a>
				<a href='myResv'><font class="right_float_font">예약조회 </font></a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="right-float">
				<a href='login'><font class="right_float_font">로그인 |</font></a>
				<a href='join'><font class="right_float_font">회원가입 </font></a>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<div id="hLogo">
	<button type="button" id="toHome"><img src="resources/images/MainLogo.PNG" id="mainLogo" alt="mainlogo"></button>
</div>
</body>
</html>