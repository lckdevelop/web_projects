<%@page import="domain.Reserve"%>
<%@page import="service.ReserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>delete</title>
		
		<script LANGUAGE=JavaScript>
			function showAlert() {
				alert("삭제완료");
				location.href="adm_allview.jsp";	
			}
		</script>
	</head>
	<body>
		<% 
			request.setCharacterEncoding("utf-8");
	
			Reserve reserve = new Reserve();		
			ReserveService reserveService = new ReserveService();
			
			String room = request.getParameter("room");
			
			int iRoom = 0;
			
			if (room.equals("PoolRoom")) {
				iRoom = 1;		
			}
			if (room.equals("SeaViewRoom")) {
				iRoom = 2;	
			}
			if (room.equals("DeluxRoom")) {
				iRoom = 3;	
			}
	
			//reserve.setName(request.getParameter("name"));
			reserve.setResvDate(request.getParameter("resvDate"));
			reserve.setRoom(iRoom);
			
			reserveService.delete(reserve);	
		%>
	
	
 		<script> showAlert(); </script> 
	</body>
</html>