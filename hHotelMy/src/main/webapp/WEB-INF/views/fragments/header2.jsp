<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header2</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#loginBtn').click(function() {
		$(location).attr('href', 'login');
	});
	
	$('#joinBtn').click(function() {
		$(location).attr('href', 'join');
	});
	
	$('#resvCkBtn').click(function() {
		$(location).attr('href', 'home');
		alert('로그인 하세요.');
	});

	$('#btnResv').click(function() {
		$(location).attr('href', 'reserve');
	});
	
	$('#btnLocation').click(function() {
		$(location).attr('href', 'location');
	});
});
</script>
</head>
<body>
<div class="outer">
	<div class="inner">
		<button type="button" id="btnResv" class="mainResvBtn">객실 예약</button>
		<button type="button" id="btnLocation" class="mainResvBtn">오시는 길</button>
	</div>
</div>
</body>
</html>