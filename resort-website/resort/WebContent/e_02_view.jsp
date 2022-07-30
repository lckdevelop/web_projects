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
		<style>
			body {
				background-color: #ebf5ff;
			}

		</style>
	</head>
	<body>
		<%	
			ReviewService gongiService = new ReviewService();
			Review review = new Review();
			
			request.setCharacterEncoding("utf-8");			
			int id = Integer.parseInt(request.getParameter("key"));
			
			review = gongiService.selectOne(id);
			
			String title = review.getTitle();
			String date = review.getDate();
			String content = review.getContent();
			int rootid = review.getRootid();
			int relevel = review.getRelevel();
			int recnt = review.getRecnt();
			int viewcnt = review.getViewcnt();			
			String file = review.getFile();
					
			gongiService.viewCnt(review); // 조회수 up 메소드 실행
		
		%>
		<script LANGUAGE=JavaScript>
			function submitForm(mode) {
				if(mode == "update") {
					viewWrite.action = "e_02_update.jsp?key=<%=id%>";
				} else if(mode == "reinsert") {
					viewWrite.action = "e_02_reinsert.jsp";
				}
				viewWrite.submit();
			}
		</script>
		<div align=center>
			<form method=post name=viewWrite>
				<table width=650 border=1 cellspacing=0 cellpadding=5>
					<tr>
						<td bgcolor=#bbdefb><b>번호</b></td>
						<td bgcolor=#ffffff><input type=hidden name=id value=<%=id%>><%=id%></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>제목</b></td>
						<td bgcolor=#ffffff><%=title%><input type=hidden name=title size=70 maxlength=70></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>일자</b></td>
						<td bgcolor=#ffffff><%=date%></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>조회수</b></td>
						<td bgcolor=#ffffff><%=viewcnt%><input type=hidden name=viewcnt size=70 maxlength=70></td>
					</tr>
					<tr height=300>
						<td bgcolor=#bbdefb><b>내용</b></td>
						<td bgcolor=#ffffff><textarea cols=80 rows=20 name=content cols=70 row=600 readonly><%=content%></textarea></td> <!-- cols와 row값은 무시됌 css에 의해 -->
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>파일</b></td>
						<% 
						if (String.valueOf(review.getFile()).equals("null")) {				
						%>				
							<td bgcolor=#ffffff><input type=hidden name=file size=70 maxlength=70></td>
						<% 
						} else {
							%>
						<td bgcolor=#ffffff><a href="C:/Users/leechaekyeong/Desktop/puppy.jpg" download><%=file%></a><input type=hidden name=file size=70 maxlength=70></td>
						<% 
						}
						%>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>원글</b></td>
						<td bgcolor=#ffffff><%=rootid%><input type=hidden name=rootid value=<%=rootid%> size=70 maxlength=70></td>
					</tr>
					<tr>
						<td bgcolor=#bbdefb><b>댓글수준</b></td>
						<td bgcolor=#ffffff><%=relevel%><input type=hidden name=relevel value=<%=relevel%> width=70>
						댓글내 순서<input type=text name=recnt width=20 value=<%=recnt%> readonly></td>
					</tr>
				</table>
				<table width=650>
					<tr>
						<td width=600></td>
						<!--관리자인지 세션확인하는 부분 -->
		           		<%
							String loginOk = null;
		           			
						// 세션 속성명이 name인 속성의 값을 Object 타입으로 리턴한다. 해당 되는 속성명이 없을 경우에는 null 값을 리턴한다.
							loginOk = (String)session.getAttribute("login_Ok");
							try {
							// 해당되는 속성명이 없을 경우 (관리자만 신규 버튼 보임)
								if (loginOk != null || loginOk.equals("yes")) {
							%>		
				           	<td><input type=button value=수정 onclick=submitForm('update')></td>
							<td><input type=button value=삭제 onclick=location.href='e_02_delete.jsp?key=<%=id%>'></td>
							<%		
								}
							} catch(Exception e) {
								e.getMessage();
							}
						%>
						<td><input type=button value=목록 onclick=location.href='e_02.jsp'></td>
						<td><input type=button value=댓글 onclick=submitForm('reinsert')></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>