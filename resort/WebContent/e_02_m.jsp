<%@page import="domain.Review"%>
<%@page import="service.ReviewService"%>
<%@page import="domain.Gongji"%>
<%@page import="service.GongjiService"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
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
				
				ReviewService gongiService = new ReviewService();
				
				count = gongiService.getCount(); // 레코드 수 구하기
				
				Review gongji = new Review();
	        	List<Review> gongjiList = new ArrayList<>();

	        	// 검색 페이징 코드
	        	request.setCharacterEncoding("utf-8");
				String sel = request.getParameter("sel"); // 검색 옵션의 value
				String find = request.getParameter("find"); // 검색어 value

				// 해당 되는 레코드 수 구하는 변수
				int fcount = 0;
				
				fcount = gongiService.getfCount(sel, find);
				
				List<Review> gongji_fList = new ArrayList<>();
	        
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
	<head>
		<title>공지사항 리스트</title>		
		<style>
			table {
				width: 90%;
				border-collapse: collapse;
			}
			
			body {
				background-color: #ebf5ff;
			}
		</style>
	</head>
	<body>
		<div align=center>
		<table>
			<tr align=center>
				<td style=color:#4592ff;><p><h2> Consumer Reviews </h2></td>
			</tr>
			<tr align=center>
				<td style=color:#4592ff;>
					<font size=4><B>(PostNum :<%=count%>)</B></font>
				</td>
			</tr>
		</table>
		<P></P>
		<table cellspacing=1 border=1>
			<tr height=50 bgcolor=#bbdefb>
				<td width=10><p align=center><B>Id<B></p></td>
				<td width=30><p align=center><B>Title<B></p></td>
				<td width=20><p align=center><B>File<B></p></td>
				<td width=10><p align=center><B>View<B></p></td>
				<td width=30><p align=center><B>RegisterDate<B></p></td>
			</tr>
			<form mehtod=post action=e_02_view.jsp>
			<% 
				if (count > 0 && fcount == 0 && find == null) {
					
		   			for(int i = 0; i < gongjiList.size(); i++) {
		   				
			%>
			<tr style="background-color:#ffffff">
				<td height=50><p align=center><%=gongjiList.get(i).getId()%></p></td>
   				<%
   				if(gongjiList.get(i).getDate().equals(today)) {
   					%>
				<td height=50><p align=left>
				<a href=e_02_view.jsp?key=<%=gongjiList.get(i).getId()%>><%=gongjiList.get(i).getTitle()%>[NEW]</a></p></td>				
				<%
   				} else {
   					%>
   					
						<td height=50><p align=left>
				
				<a href=e_02_view.jsp?key=<%=gongjiList.get(i).getId()%>><%=gongjiList.get(i).getTitle()%></a></p></td>		
   				<%
   				}
   				%>
   				
   					<%
   						// 아무것도 없는 null이랑 문자열 null이 있기 때문에 문자열로 변경하는 처리를  해주었다.
   						if (String.valueOf(gongjiList.get(i).getFile()).equals("null")) {
   					%>	
						<td height=50><p align=center></p></td>
					<% 	
						} else if(gongjiList.get(i).getFile() != null) {
							%>
							<td height=50><img src=file.PNG width=20 height=10 align=center><p align=center></p></td>
							<% 
						}
   						
   					%>
				<td height=50><p align=center><%=gongjiList.get(i).getViewcnt()%></p></td>
				<td height=50><p align=center><%=gongjiList.get(i).getDate()%></p></td>
			</tr>
			<%            
	   				}
				} else if(count == 0) { // 데이터가 없으면
					%>
					<tr>
						<td colspan="6" align="center">게시글이 없습니다.</td>
					</tr>
					<%
		   			
				} else if (count > 0 && fcount != 0) {
					for(int i = 0; i < gongji_fList.size(); i++) {
				
   			%>
   			<tr style="background-color:#ffffff;">
				<td height=50><p align=center><%=gongji_fList.get(i).getId()%></p></td>
				<%
				if(gongji_fList.get(i).getDate().equals(today)) {
   					%>
				<td height=50><p align=left>
				<a href=e_02_view.jsp?key=<%=gongji_fList.get(i).getId()%>><%=gongji_fList.get(i).getTitle()%>[NEW]</a></p></td>				
				<%
   				} else {
				%>
					<td height=50><p align=left>
				<a href=e_02_view.jsp?key=<%=gongji_fList.get(i).getId()%>><%=gongji_fList.get(i).getTitle()%></a></p></td>
				<%
   				}
   				%>
   				<%
   						if (String.valueOf(gongji_fList.get(i).getFile()).equals("null")) {
   							
   					%>	
						<td height=50><p align=center></p></td>
					<% 	
						} else if(gongji_fList.get(i).getFile() != null) {
							%>
							<td height=50><img src=file.PNG width=20 height=10 align=center><p align=center></p></td>
							<% 
						}
   						
   					%>
				<td height=50><p align=center><%=gongji_fList.get(i).getViewcnt()%></p></td>
				<td height=50><p align=center><%=gongji_fList.get(i).getDate()%></p></td>
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
		<form mehtod=post action=e_02_insert.jsp enctype=multipart/form-data>
			<table border=0>
           		<tr>                       
           	    	<td><p align=right><input type=submit name=new value=신규 align=center></td>
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
								<a href="e_02.jsp?pageNum=<%=startPage - 5%>">[이전]</a>
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
								<a href="e_02.jsp?pageNum=<%=i%>">[<%=i%>]</a>
								
					<%
								}
							}
							// 끝 페이지 수를 넘어가버리면 다음 링크 설정해 주기
							if (endPage < pageCount) {
					%>
							<a href="e_02.jsp?pageNum=<%=startPage + 5%>">[다음]</a>				
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
								<a href="e_02.jsp?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[이전]</a>
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
								<a href="e_02.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i%>]</a>
								
					<%
								}
							}
							// 끝 페이지 수를 넘어가버리면 다음 링크 설정해 주기
							if (endPage < pageCount) {
					%>
							<a href="e_02.jsp?pageNum=<%=startPage + 10%>&sel=<%=sel%>&find=<%=find%>">[다음]</a>				
					<% 
							} 
							
						}
					
					%>
					</td>
				</tr>
        	</table> 
		</form>
			<form method=get action=e_02.jsp>
			<!--select태그에서의 value값은 전송되는 값을 지정하는 것이다. 보여지는 값이 아니다 -->
      				<select name="sel">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
					<input type="text" name="find" id="find">
					<input type="submit" value="검색">
			</form>
		</div>
	</body>
</html>