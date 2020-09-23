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
%>
<html>
	<head>
		<title>글 보기</title>
			<script LANGUAGE=JavaScript>
				function submitForm(mode) {
					if(mode == "write") {
						updateWrite.action = "gongji_write.jsp?key=update";
						//viewWrite.submit();
					} else if(mode == "delete") {
						updateWrite.action = "e_02_delete.jsp";
					}
					updateWrite.submit();
				}
			</script>
			<style>
			body {
				background-color: #ebf5ff;
			}

			</style>
	</head>
	<body>
		<%	
			ReviewService gongiService = new ReviewService();
			Review gongji = new Review();
			
			request.setCharacterEncoding("utf-8");			
			int id = Integer.parseInt(request.getParameter("key"));
			
			gongji = gongiService.selectOne(id);
			
			String title = gongji.getTitle();
			String date = gongji.getDate();
			String content = gongji.getContent();
			int rootid = gongji.getRootid();
			int relevel = gongji.getRelevel();
			int recnt = gongji.getRecnt();
			int viewcnt = gongji.getViewcnt();
			
		%>
		<div align=center>
			<form method=post name=updateWrite enctype=multipart/form-data>
				<table width=650 border=1 cellspacing=0 cellpadding=5>
					<tr>
						<td bgcolor=#bbdefb><b>번호</b></td>
						<td bgcolor=#ffffff><input type=text name=id value=<%=id%> readonly></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>제목</b></td>
						<td bgcolor=#ffffff><input type=text name=title value="<%=title%>"></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>일자</b></td>
						<td bgcolor=#ffffff><%=date%></td>
					</tr>
					<tr height=300>
						<td bgcolor=#bbdefb><b>내용</b></td>
						<td bgcolor=#ffffff><textarea cols=80 rows=20 name=content cols=70 row=600><%=content%></textarea></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>파일등록</b></td>
						<td bgcolor=#ffffff><input type=file name=file size=70 maxlength=70></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>원글</b></td>
						<td bgcolor=#ffffff><%=rootid%><input type=hidden name=rootid size=70 maxlength=70></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>댓글수준</b></td>
						<td bgcolor=#ffffff><%=relevel%><input type=hidden name=relevel width=70>
						댓글내 순서<input type=text name=recnt width=20 value=<%=recnt%> readonly></td>
					</tr>
				</table>
				<table width=650>
					<tr>
						<td width=600></td>
						<td><input type=button value=취소 onclick=location.href='e_02.jsp'></td>
						<td><input type=button value=쓰기 onclick=submitForm('write')></td>
						<td><input type=button value=삭제 onclick=submitForm('delete')></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>