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
		<script LANGUAGE=JavaScript>
		function showAlert() {
			alert("공지사항 작성 완료");
			location.href="e_01.jsp";	
		}

		function updateAlert() {
			alert("수정을 완료하였습니다\n\n감사합니다");
			location.href="e_01.jsp";	
		}

		</script>
	</head>
		<body>
			<% 
				request.setCharacterEncoding("utf-8");
			
				if (request.getParameter("key").equals("insert")) {
					/* new 쓰기 부분 */
					Date today = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

					Gongji gongji = new Gongji();
					
					gongji.setTitle(request.getParameter("title"));
					gongji.setDate(sf.format(today));
					gongji.setContent(request.getParameter("content"));
		       	 	
					GongjiService gongjiService = new GongjiService();
					
					gongjiService.newWrite(gongji);
			%>	
					<script> showAlert(); </script>
			<% 
				} else if (request.getParameter("key").equals("update")) {
					/* 업데이트 쓰기 부분 */
					Date today = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					
					Gongji gongji = new Gongji();
					
					gongji.setId(Integer.parseInt(request.getParameter("id")));
					gongji.setTitle(request.getParameter("title"));
					gongji.setDate(sf.format(today));
					gongji.setContent(request.getParameter("content"));
					
					GongjiService gongjiService = new GongjiService();
					
					gongjiService.update(gongji);
			%>
					<script> updateAlert(); </script>
			<%
				}
					
			%>
	</body>
</html>