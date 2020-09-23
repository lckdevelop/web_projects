<%@page import="domain.Gongji"%>
<%@page import="service.GongjiService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
			<%				
				int pageSize = 10; // 한 페이지에 출력할 레코드 수 
				
				// 현재 페이지 번호(클릭한 링크 번호)
				String pageNum = request.getParameter("pageNum");
				
				// 클릭한게 없다면 1번 페이지
				if(pageNum == null) {
					pageNum = "1";
				}
				
				// 연산을 하기 위해 현재 페이지 형 변환
				int currentPage = Integer.parseInt(pageNum);
				
				// 해당 페이지의 시작 레코드와 끝 레코드 구하기
				int startRow = (currentPage - 1) * pageSize;
				int endRow = 10;
				// 전체 레코드 수 구하는 변수
				int count = 0;
				
				GongjiService gongiService = new GongjiService();
				
				count = gongiService.getCount(); // 레코드 수 구하기
				
	        	List<Gongji> gongjiList = new ArrayList<>();

	        	// 검색 페이징 코드
	        	request.setCharacterEncoding("utf-8");
				String sel = request.getParameter("sel"); // 검색 옵션의 value
				String find = request.getParameter("find"); // 검색어 value

				// 해당 되는 레코드 수 구하는 변수
				int fcount = 0;
				fcount = gongiService.getfCount(sel, find);
				
				List<Gongji> gongji_fList = new ArrayList<>();
	        
	        	if (count > 0 && find == null) {
		       	 	gongjiList = gongiService.selectGongji_list(startRow, endRow);
		      		
	        	}
	        	if (fcount > 0) {
		       	 	gongji_fList = gongiService.getfList(startRow, endRow, sel, find);
	        	}
	        	
	        	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	        	String today = sf.format(System.currentTimeMillis());
			%>			
<html>
<meta name="viewport" content="user-scalable=no, width=device-width" />
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<head>
		<title> 리조트소식 게시판</title>
		<style>
			table {
				width: 60%;
				border-collapse: collapse;
			}
			
			body {
				background-color: #ebf5ff;
			}
		</style>
	</head>
	<body>
		<div align=center>
		<div id="container" style="width:device-width;height:device-height;">
		<table>
			<tr align=center>
				<td style=color:#4592ff;><p><h2> Resort News </h2></td>
			</tr>
			<tr align=center>
				<td style=color:#4592ff;>
					<font size=4><B>(PostNum :<%=count%>)</B></font>
				</td>
			</tr>
		</table>
		<p></p>
		<table cellspacing=1 width=80% border=1>
			<tr bgcolor=#bbdefb>
				<td width=30><p align=center><B>Id</B></p></td>
				<td width=200><p align=center><B>Title</B></p></td>
				<td width=40><p align=center><B>File</B></p></td>
				<td width=50><p align=center><B>View</B></p></td>
				<td width=70><p align=center><B>RegisterDate</B></p></td>
			</tr>
			<form mehtod=post action=e_01_view.jsp>
			<!-- db에 게시글이 1개라도 있고, 댓글은 없으며, 검색한 것이 아닌 경우 -->
			<% 
				request.setCharacterEncoding("utf-8");
			
				if (count > 0 && fcount == 0 && find == null) {
					
		   			for(int i = 0; i < gongjiList.size(); i++) {
		   				
			%>
			<tr style="background-color:#ffffff;">
				<td width=30><p align=center><%=gongjiList.get(i).getId()%></p></td>
   				<%
   				if(gongjiList.get(i).getDate().equals(today)) {
   					%>
				<td width=200><p align=left>
				<a href=e_01_view.jsp?key=<%=gongjiList.get(i).getId()%>><%=gongjiList.get(i).getTitle()%>[NEW]</a></p></td>				
				<%
   				} else {
   					%>
   					
						<td width=130><p align=left>
				
				<a href=e_01_view.jsp?key=<%=gongjiList.get(i).getId()%>><%=gongjiList.get(i).getTitle()%></a></p></td>		
   				<%
   				}
   				%>
   				
   					<%
   						// 아무것도 없는 null이랑 문자열 null이 있기 때문에 문자열로 변경하는 처리를  해주었다.
   						if (String.valueOf(gongjiList.get(i).getFile()).equals("null")) {
   					%>	
						<td width=40><p align=center></p></td>
					<% 	
						} else if(gongjiList.get(i).getFile() != null) {
							%>
							<td width=40><img src=./img/file.PNG width=30 height=20 align=center><p align=center></p></td>
							<% 
						}
   						
   					%>
				<td width=50><p align=center><%=gongjiList.get(i).getViewcnt()%></p></td>
				<td width=70><p align=center><%=gongjiList.get(i).getDate()%></p></td>
			</tr>
			<%            
	   				}
				} else if(count == 0) { // db에 게시글이  없으면
					%>
					<tr>
						<td colspan="6" align="center">게시글이 없습니다.</td>
					</tr>
					<%
		   		// db에 게시글과 댓글이 공존할 때 	
				} else if (count > 0 && fcount != 0) {
					for(int i = 0; i < gongji_fList.size(); i++) {
				
   			%>
   			<tr style="background-color:#ffffff;">
				<td width=30><p align=center><%=gongji_fList.get(i).getId()%></p></td>
				<%
				if(gongji_fList.get(i).getDate().equals(today)) {
   					%>
				<td width=200><p align=left>
				<a href=e_01_view.jsp?key=<%=gongji_fList.get(i).getId()%>><%=gongji_fList.get(i).getTitle()%>[NEW]</a></p></td>				
				<%
   				} else {
				%>
					<td width=200><p align=left>
				<a href=e_01_view.jsp?key=<%=gongji_fList.get(i).getId()%>><%=gongji_fList.get(i).getTitle()%></a></p></td>
				<%
   				}
   				%>
   				<%
   						if (String.valueOf(gongji_fList.get(i).getFile()).equals("null")) {
   							
   					%>	
						<td width=40><p align=center></p></td>
					<% 	
						} else if(gongji_fList.get(i).getFile() != null) {
							%>
							<td width=40><img src=./img/file.PNG width=30 height=20 align=center><p align=center></p></td>
							<% 
						}
   						
   					%>
				<td width=50><p align=center><%=gongji_fList.get(i).getViewcnt()%></p></td>
				<td width=70><p align=center><%=gongji_fList.get(i).getDate()%></p></td>
			</tr>
			<%
			
					}
				} else {
					%>
					<tr>
						<td colspan="6" align="center">게시글이 없습니다.</td>
					</tr>
					<%
				}
			%>
			</table>
		</form>	
		<form mehtod=post action=e_01_insert.jsp enctype=multipart/form-data>
			<table>
           		<tr>          		
				<!--관리자가 아닐때의 처리 -->
           		<%
					String loginOk = null;
           			
				// 세션 속성명이 name인 속성의 값을 Object 타입으로 리턴한다. 해당 되는 속성명이 없을 경우에는 null 값을 리턴한다.
					loginOk = (String)session.getAttribute("login_Ok"); // login_ok(o는 대문자) 
					
					try {
					// 해당되는 속성명이 없을 경우 (관리자만 신규 버튼 보임)
						if (loginOk != null || loginOk.equals("yes")) {
							
					%>		
		           	    	<td><p width=100 align=right><input type=submit name=new value=신규 align=center></td>
					<%		
						}
					} catch(Exception e) {
						e.getMessage();
					}

				%>                       
            	</tr>
				
				<tr>
					<td align=center>
			
					<% // 페이징 처리
						if (count > 0 && fcount == 0 && find == null) {
							//총 페이지의 수
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 5;
							// 한 페이지에 보여줄 시작 및 끝 번호
							int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면
							if(endPage > pageCount) {
								endPage = pageCount;
							}
							 
							// 첫 시작 페이지가 블럭 보다 크다면 이전 페이지 보여주기
							if(startPage > pageBlock) {
					%>
								<a href="e_01.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
					<%			
							}
							// 페이지 링크 출력하기
							for(int i = startPage; i <= endPage; i++) {
								// 현재 페이지라면 링크 걸지 않고 출력
								if(i == currentPage) {
					%>
								[<%=i%>]
					<%				
								} else {
					%>				
								<a href="e_01.jsp?pageNum=<%=i%>">[<%=i%>]</a>
								
					<%
								}
							}
							// 끝 페이지 수를 넘어가버리면 다음 링크 설정해 주기
							if (endPage < pageCount) {
					%>
							<a href="e_01.jsp?pageNum=<%=startPage + 10%>">[다음]</a>				
					<% 
							}
						} else if (fcount > 0) {
							
							int pageCount = fcount / pageSize + (fcount % pageSize == 0 ? 0 : 1);
							
							int pageBlock = 5;
							// 한 페이지에 보여줄 시작 및 끝 번호
							int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면
							if(endPage > pageCount) {
								endPage = pageCount;
							}
							 
							// 첫 시작 페이지가 블럭 보다 크다면 이전 페이지 보여주기
							if(startPage > pageBlock) {
					%>
								<a href="e_01.jsp?pageNum=<%=startPage - 5%>&sel=<%=sel%>&find=<%=find%>">[이전]</a>
					<%			
							}
							// 페이지 링크 출력하기
							for(int i = startPage; i <= endPage; i++) {
								// 현재 페이지라면 링크 걸지 않고 출력
								if(i == currentPage) {
					%>
								[<%=i%>]
					<%				
								} else {
					%>				
								<a href="e_01.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i%>]</a>
								
					<%
								}
							}
							// 끝 페이지 수를 넘어가버리면 다음 링크 설정해 주기
							if (endPage < pageCount) {
					%>
							<a href="e_01.jsp?pageNum=<%=startPage + 5%>&sel=<%=sel%>&find=<%=find%>">[다음]</a>				
					<% 
							} 
							
						}
					
					%>
					</td>
				</tr>
        	</table> 
		</form>
			<form method=get action=e_01.jsp>
			<!--select태그에서의 value값은 전송되는 값을 지정하는 것이다. 보여지는 값이 아니다 -->
      				<select name="sel">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
					<input type="text" name="find" id="find">
					<input type="submit" value="검색">
			</form>
		</div>
		</div>
	</body>
</html>