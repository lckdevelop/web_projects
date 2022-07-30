<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<!-- 한글 -->
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Recursive:wght@700&display=swap" rel="stylesheet">
		<style>
			font {
				font-size: 18;
				font-family: 'Recursive', sans-serif;
			}
			
			body {
				background-color: #fffeeb;
			}
			
			input {
				font-size: 18;
				font-family: 'Jua', sans-serif;
				height:30px; 
				width:380px;
			}
		</style>
	</head>
	<body>
		<% 
			// login_test에서 온 속성 값 "login.jsp?jump=login_test.jsp"
			String jump = request.getParameter("jump");
			
		%>
		<div align=center>
			<h2 style="font-family:'Jua', sans-serif;">Admin Login</h2>
			<!-- 해당 정보들을 현재 페이지로 전송 -->
			<form method="post" action="adm_loginck.jsp">
				<table border=0 cellspacing=0 border=0>
					<tr>
						<td height=80 align=center><font>ID</font></td>
					</tr>
					<tr>
						<td><input type="text" name="id" size=50 align=center height=40px></td>
					</tr>
					<tr>
						<td height=70 align=center><font>PASSWORD</font></td>
					</tr>
					<tr>
						<td><input type="password" name="passwd" size=50 height=40px></td>
					</tr>
				</table>
				<table cellspacing=0>
					<tr>
						<td height=40></td>
					</tr>
					<tr>
						<td colspan=2><input type="submit" value="submit"></td>
					</tr>
				</table>
				<!-- 보이지않고 정보만 얻고 싶은 경우 -->
				<input type="hidden" name="jump" value='<%=jump%>'>
			</form>
		</div>
	</body>
</html>