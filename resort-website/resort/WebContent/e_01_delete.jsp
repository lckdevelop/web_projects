<%@page import="service.ReviewService"%>
<%@page import="java.util.Date"%>
<%@page import="domain.Gongji"%>
<%@page import="service.GongjiService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
	<head>
		<title> 댓글 삭제 </title>
		<script LANGUAGE=JavaScript>
			function deleteAlert() {
				alert("댓글 삭제 완료\n\n이용해주셔서 감사합니다~");
				location.href="e_01.jsp";	
			}
		</script>
	</head>
	<body>
		<%
			GongjiService gongiService = new GongjiService();
			
			request.setCharacterEncoding("utf-8");
			
			int id = 0;
			
			if (request.getParameter("key") != null) {
				id = Integer.parseInt(request.getParameter("key"));
				
			} else {
				id = Integer.parseInt(request.getParameter("id"));
			}
			
			gongiService.delete(id);
			
		%>
		<script>deleteAlert();</script>
	</body>
</html>