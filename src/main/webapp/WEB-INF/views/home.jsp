<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<button type="button" onclick="location.href='account/login' ">로그인</button>
<button type="button" onclick="location.href='account/signup' ">회원가입</button>
</body>
</html>
