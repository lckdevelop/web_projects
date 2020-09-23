<%@ page language="java" contentType="text/html; charset=UTF-8"%>
		<%
			String myName = "Lee";
			Cookie cookieName = new Cookie("name", myName); // 쿠키 값을 키와 value값으로 설정
			cookieName.setMaxAge(-1); // 브라우저가 켜져있을때 까지 저장
			response.addCookie(cookieName); // 클라이언트에 쿠키를 전송할 준비
		%>
<!DOCTYPE html>
<html>
	<head>
		<title> 쿠키 저장 </title>
	</head>
	<body>
		JSP쿠키사용	
	</body>
</html>