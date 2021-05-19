<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header1</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/hHotel/resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="/hHotel/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/hHotel/resources/js/home.js">

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
			<div id="right-float">
				<a style="text-decoration:none"><font class="right_float_font">${member_id}님</font></a>
				<a href='logout'> <font class="right_float_font">로그아웃 |</font></a>
				<a href='myResv'><font class="right_float_font">예약조회 |</font></a>
			</div>
		</c:when>
		<c:otherwise>
			<div id="right-float">
				<a href='login'><font class="right_float_font">로그인 |</font></a>
				<a href='join'><font class="right_float_font">회원가입 |</font></a>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<div id="hLogo">
	<button type="button" id="toHome"><img src="/hHotel/resources/images/MainLogo.PNG" id="mainLogo" alt="요정 옷을 입은 엘바"></button>
</div>
</body>
</html>