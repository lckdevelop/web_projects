<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>로그아웃</title>
		<style>
			body {
					background-color: #fffeeb;
			}
		</style>
	</head>
	<body BACKGROUND>
		<% 
			String loginOk = null;
			String jumpURL="adm_login.jsp?jump=adm_allview.jsp"; //jump라는 키를 가진 url
			
			// 세션 속성명이 name인 속성의 값을 Object 타입으로 리턴한다. 해당 되는 속성명이 없을 경우에는 null 값을 리턴한다.
			loginOk = (String)session.getAttribute("login_Ok"); // login_ok(o는 대문자) 
			
			// 해당되는 속성명이 없을 경우 로그인창으로 보내기
			if (loginOk == null) {
		%>
				<script type="text/javascript">
			    	alert("로그인창으로 넘어갑니다.");
				</script> 
		<%
				response.sendRedirect(jumpURL);
		
				return;
			} else if (!loginOk.equals("yes")) { // 해당되는 속성명이 없을 경우 로그인창으로 보내기				
	
				
		%>
				<script type="text/javascript">
			    	alert("로그인창으로 넘어갑니다.");
				</script> 
		<%
				response.sendRedirect(jumpURL);
				return;
			} else {				
				// 세션 종료
				session.invalidate();
				out.println("<div align=center><h2>로그아웃 되었습니다.</h2></div>");
				// 로그아웃 후 일반적으로는 홈으로 간다(여기서는 login_test.jsp)
				out.println("<div align=center><input type=button value='메인페이지' OnClick=\"location.href='adm_login.jsp'\"></div>");			
			}
		%>
	</body>
</html>