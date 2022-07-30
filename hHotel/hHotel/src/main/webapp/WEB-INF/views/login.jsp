<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/hHotel/resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="/hHotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="/hHotel/resources/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
	<div class="container">
		<div class="center-block">
			<form action="loginAction" method="post">
				<h3>로그인</h3>
				<div class="container-fluid">
					<p><input id="input-login-text-size" type="text" name="id" required="required" placeholder="아이디"
						autofocus="autofocus" /></p>
					<p><input id="input-login-text-size" type="password" name="password" required="required" placeholder="비밀번호"
						required="required" /></p>
					<button type="submit" class="login-btn">로그인</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>