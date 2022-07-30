<%@ page language="java" contentType="text/html; charset=UTF-8"%>
		<%
			Cookie[] cookies = request.getCookies();
		
			for (int i = 0; i < cookies.length; i++) {
				
				Cookie thisCookie = cookies[i];
				
				if ("name".equals(thisCookie.getName())) {
					// 유효기간을 0으로 설정함(쿠키 값 지워짐)(초 단위)
					thisCookie.setMaxAge(0);
					response.addCookie(thisCookie);
				}
			}
		%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title> 쿠키 지우기 </title>
	</head>
	<body>
	</body>
</html>