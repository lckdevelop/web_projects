<%@page import="domain.Review"%>
<%@page import="service.ReviewService"%>
<%@page import="java.util.Date"%>
<%@page import="domain.Gongji"%>
<%@page import="service.GongjiService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date today = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
	GongjiService gongiService = new GongjiService();
	
	request.setCharacterEncoding("utf-8");

	
	int	rootid = Integer.parseInt(request.getParameter("rootid")); // 부모 id
	int	recnt = Integer.parseInt(request.getParameter("recnt")); // 부모 id
	int	relevel = Integer.parseInt(request.getParameter("relevel")); // 부모 id
	int momid = Integer.parseInt(request.getParameter("id"));	

%>
<html>
	<head>
		<title>새 글 입력</title>
		<script LANGUAGE=JavaScript>
			function submitForm(mode) {
				reWrite.action = "gongji_write.jsp?key=reinsert";
				reWrite.submit();
			}
		</script>
		<style>
			body {
				background-color: #ebf5ff;
			}

		</style>
	</head>
	<body>
		<div align=center>
			<form method=post name=reWrite>
				<table width=650 border=1 cellspacing=0 cellpadding=5>
			
					<tr>
						<td bgcolor=#bbdefb><b>번호</b></td>
						<td>댓글<input type=text value=insert readonly></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>제목</b></td>
						<td bgcolor=#ffffff><input type=text name=title size=70 maxlength=70></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>일자</b></td>
						<td bgcolor=#ffffff><%=sf.format(today)%></td>
					</tr>
					<tr height=300>
						<td bgcolor=#bbdefb><b>내용</b></td>
						<td bgcolor=#ffffff><textarea cols=80 rows=20 name=content cols=70 row=600></textarea></td> <!-- cols와 row값은 무시됌 css에 의해 -->
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>원글</b></td>
						<td bgcolor=#ffffff><input type=text value=<%=rootid%> name=rootid size=70 maxlength=70 readonly></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>댓글수준</b></td>
						<td><input type=hidden value=<%=relevel%> name=relevel width=30>
						댓글내 순서<input type=hidden name=recnt width=20 value=<%=recnt%>></td>
	 					<input type="hidden" name="momid" value=<%=momid%>> 
					</tr>
				</table>
				<table width=650>
					<tr>
						<td width=600></td>
						<td><input type=button value=취소 onclick=location.href='e_02.jsp'></td>
						<td><input type=button value=쓰기 onclick=submitForm('write')></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>