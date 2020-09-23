<%@page import="domain.Reserve"%>
<%@page import="service.ReserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title> adm_update </title>
		
		<script LANGUAGE=JavaScript>
			function showAlert() {
				alert("수정완료");
				location.href="adm_allview.jsp";	
			}

			function overLapAlert() {
				alert("해당 방과 날짜에 이미 예약되었습니다.");
				location.href="adm_allview.jsp";
			}
		</script>
	</head>
	<body>
		<%
		request.setCharacterEncoding("utf-8");

		Reserve reserve = new Reserve();
		int overLap = 0; // 중복 구하는 객체
		
		ReserveService reserveService = new ReserveService(); 
		
		String originDate = request.getParameter("originDate"); // 변경 전 날짜
		String originRoom = request.getParameter("originRoom"); // 변경 전 방
		String room = request.getParameter("room"); // 변경 후 방
		
		int changeRoom = 0;
		int iOriginRoom = Integer.parseInt(originRoom);
				
		if (room.equals("PoolRoom")) {
			changeRoom = 1;
		}
		if (room.equals("SeaViewRoom")) {
			changeRoom = 2;
		}
		if (room.equals("DeluxRoom")) {
			changeRoom = 3;
		}
				
		reserve.setName(request.getParameter("name"));
		reserve.setResvDate(request.getParameter("resvDate"));
		reserve.setRoom(changeRoom);
		reserve.setAddr(request.getParameter("addr"));
		reserve.setTelnum(request.getParameter("telnum"));
		reserve.setInName(request.getParameter("inName"));
		reserve.setComment(request.getParameter("comment"));
		reserve.setWriteDate(request.getParameter("writeDate"));
		reserve.setProcessing(Integer.parseInt(request.getParameter("processing")));
		
		overLap = reserveService.selectOverLap(request.getParameter("resvDate"), changeRoom);
		out.println(overLap);
		out.println(request.getParameter("resvDate"));
		out.println(changeRoom);
		
		if (overLap == 0) {
			reserveService.update(reserve, originDate, iOriginRoom);
		%>
 			<script> showAlert(); </script>; 
		<%		
 		} else {
		%>	
  			<script> overLapAlert(); </script>; 
		<%
 		}
 		%>
	</body>
</html>