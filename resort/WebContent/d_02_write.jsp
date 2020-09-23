<%@page import="service.ReserveService"%>
<%@page import="domain.Reserve"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="domain.Gongji"%>
<%@page import="service.GongjiService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	<title> 방 예약 데이터에 넣기</title>
	<script LANGUAGE=JavaScript>
		function reserveAlert() {
			alert("예약완료\n감사합니다^^");
			location.href="d_01.jsp";	
		}
	</script>
	</head>
	<body>
		<%
		request.setCharacterEncoding("utf-8");
		ReserveService reserveService = new ReserveService();
		
		
		String name = request.getParameter("name");
		String resvDate = request.getParameter("resvDate");
		String roomName = request.getParameter("room");
		
		int room = 0;
		
		if (roomName.equals("PoolRoom")) {
			room = 1;
		} else if (roomName.equals("SeaViewRoom")) {
			room = 2;
		} else if (roomName.equals("DeluxRoom")){
			room = 3;
		}
		
		
		String addr = request.getParameter("addr");
		String telnum = request.getParameter("telnum");
		String comment = request.getParameter("comment");
		String inName = request.getParameter("inName");
		
		Reserve reserve = new Reserve();
		
		reserve.setName(name);
		reserve.setResvDate(resvDate);
		reserve.setRoom(room);
		reserve.setAddr(addr);
		reserve.setTelnum(telnum);
		reserve.setInName(inName);
		reserve.setComment(comment);
		
		reserveService.insert(reserve);
		
		%>
		<script>reserveAlert();</script>
		
	</body>
</html>