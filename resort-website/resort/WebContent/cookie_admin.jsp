<%@ page language="java" contentType="text/html; charset=UTF-8"%>
		<%
			Cookie[] cookies = request.getCookies();
			
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				
				if ("name".equals(thisCookie.getName())) {
					out.println("이름:"+thisCookie.getValue()+"<br>");
				}
			}
		%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>쿠키 값 검사</title>
	</head>
	<body>
	</body>
</html>