<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hHotel에 오신것을 환영합니다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/hHotel/resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="/hHotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="/hHotel/resources/js/bootstrap.min.js"></script>

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
});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/fragments/header2.jsp" flush="true" />
<div class="container-fluid">
	<img src="/hHotel/resources/images/main.jpg" class="background" alt="메인 이미지">
<%-- <jsp:include page="/WEB-INF/views/fragments/footer.jsp" flush="true" /> --%>
</div>
</body>
</html>