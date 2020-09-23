<%@page import="java.util.Date"%>
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
		<title>새 글 입력</title>
		<script>
			$(document).ready(function() {
			  $('#summernote').summernote();
			});
		</script>
		<script LANGUAGE=JavaScript>

			    function submitForm(mode) {
					newWrite.action = "gongji_write.jsp?key=insert";
					newWrite.submit();
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
			<form method=post name=newWrite enctype=multipart/form-data>
				<table width=650 border=1 cellspacing=0 cellpadding=5>
					<tr>
						<td bgcolor=#bbdefb><b>번호</b></td>
						<td bgcolor=#ffffff>신규(insert)<input type=hidden name=id value=insert></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>제목</b></td>
						<td bgcolor=#ffffff><input type=text name=title size=77 maxlength=70></td>
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
						<td bgcolor=#bbdefb><b>파일등록</b></td>
						<td bgcolor=#ffffff><input type=file name=file size=70 maxlength=70></td>
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