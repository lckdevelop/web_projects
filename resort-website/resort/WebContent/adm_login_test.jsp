<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<% 
		String loginOk = null;
		String jumpURL="login.jsp?jump=adm_login_test.jsp"; //jump라는 키를 가진 url
		
		// 세션 속성명이 name인 속성의 값을 Object 타입으로 리턴한다. 해당 되는 속성명이 없을 경우에는 null 값을 리턴한다.
		loginOk = (String)session.getAttribute("login_Ok"); // login_ok(o는 대문자) 
		
		// 해당되는 속성명이 없을 경우 로그인창으로 보내기
		if (loginOk == null) {
			response.sendRedirect(jumpURL);
			
			return;
		}
		
		// 해당되는 속성명이 없을 경우 로그인창으로 보내기
		if (!loginOk.equals("yes")) {
			response.sendRedirect(jumpURL);
			
			return;
		}
	%>
</head>
<body>
	<center>
		<h1> 로그인 오케이 </h1>
	</center>
	<br>
	<br>
	<a href="adm_logout.jsp">로그아웃</a>
</body>
</html>