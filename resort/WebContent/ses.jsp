<%@ page language="java" contentType="text/html; charset=UTF-8"%>   
<%@page import="java.text.*, java.util.*"%> 

<% // session option 
session.setAttribute("session_id", "park"); 
SimpleDateFormat fmt = new SimpleDateFormat("yy-MM-dd (hh:mm:ss ]"); 
long createTime = (long) session.getCreationTime(); // 세션 생성 시간
long lastTime = (long)session.getLastAccessedTime(); // 마지막 처리 시간 %> 

    
<!DOCTYPE html>
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<body>
		session 생성시간==> <%=fmt.format(new Date(createTime))%><br> 
		session 마지막 처리 시간 ==> <%=fmt.format(new Date(lastTime))%> <br> 
		session 유지 시간 ==> <%=(int)session.getMaxInactiveInterval()%><br> 
		session 유지 시간 변경 ==> <%session.setMaxInactiveInterval(5);%><br> 
		session 값 표시 ==> <%=(String)session.getAttribute("session_id")%> <br> 
		session ID ==> <%=session.getId()%><br>
		session 유지 시간 ==> <%=(int)session.getMaxInactiveInterval()%><br>
	
	</body>
</html>