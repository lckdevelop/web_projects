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
<!DOCTYPE html>
<html>
	<head>
		<!--썸머노트 -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
		
		<title>새 글 입력</title>
		<script LANGUAGE=JavaScript>
			function submitForm(mode) {
				newWrite.action = "e_01_write.jsp?key=insert";
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
		<form method=post name=newWrite>
			<div align=center>
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
						<td bgcolor=#ffffff><textarea id="summernote" cols=80 rows=20 name=content cols=70 row=600></textarea></td> <!-- cols와 row값은 무시됌 css에 의해 -->
					</tr>
				</table>
				<table width=650>
					<tr>
						<td width=600></td>
						<td><input type=button value=취소 onclick=location.href='e_01.jsp'></td>
						<td><input type=button value=쓰기 onclick=submitForm('write')></td>
					</tr>
				</table>
			</div>
		</form>
	<script>
      $('#summernote').summernote({
        placeholder: 'insert the text here',
        tabsize: 2,
        height: 300
      });
    </script>
</body>
</html>