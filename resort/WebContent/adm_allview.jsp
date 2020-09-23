<%@page import="java.text.SimpleDateFormat"%>
<%@page import="domain.Reserve"%>
<%@page import="service.ReserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>	
		<% 
			String loginOk = null;
			String jumpURL="adm_login.jsp?jump=adm_allview.jsp"; //jump라는 키를 가진 url
			
			// 세션 속성명이 name인 속성의 값을 Object 타입으로 리턴한다. 해당 되는 속성명이 없을 경우에는 null 값을 리턴한다.
			loginOk = (String)session.getAttribute("login_Ok"); // login_ok(o는 대문자) 
			
			// 해당되는 속성명이 없을 경우 로그인창으로 보내기
			if (loginOk == null) {
				response.sendRedirect(jumpURL);
				
				return;
			}
			
			// 해당되는 속성명이 없을 경우 로그인창으로 보내기
			if (!loginOk.equals("yes")) {
				response.sendRedirect(jumpURL);
				
				return;
			}
		%>
		<link href="https://fonts.googleapis.com/css2?family=Cabin:ital,wght@1,700&family=Recursive:wght@700&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Recursive:wght@700&display=swap" rel="stylesheet">
		<title> 예약리스트 </title>
		<style>
			td {
					font-size: 1em;
					text-align: center;
					font-family: 'Recursive', sans-serif;
				}
				
			body {
				background-color: #fffeeb;
			}
			
			a { 
				text-decoration:none 
			} 
		</style>
	</head>
	<body>
		<%
			// 날짜를 가져오기위해 캘린더객체 사용
		    Calendar cal = Calendar.getInstance();
		    int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
		    int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);
		
		    // 시작요일 확인
		    // - Calendar MONTH는 0-11까지임
		    // Calendar.DAY_OF_WEEK은 무슨 요일인지 확인하기위해 사용, 일요일은 1을 리턴
		    cal.set(year, month, 1); 
		    int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		    // 다음/이전월 계산
		    // - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
		    int prevYear = year;
		    int prevMonth = (month + 1) - 1;
		    int nextYear = year;
		    int nextMonth = (month  + 1) + 1;
			
		    // 1월인 경우 이전년 12월로 지정(달에는 13월이 없으므로)
		    if (prevMonth < 1) {
		        prevYear--;
		        prevMonth = 12;
		    }
		
		    // 12월인 경우 다음년 1월로 지정(달에는 13월이 없으므로)
		    if (nextMonth > 12) {
		        nextYear++;
		        nextMonth = 1;
		    }
		    

		%>
			<form method=post action=adm_oneview.jsp>
			<div align=center>
			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td style=font-size:2em;color:#ffcd59;> Admin Reservation</td>
			</tr>
			<tr>
				<td>
					<div style=margin:30px;></div>
				</td>
			</tr>
			<tr>
				<!-- y, m의 키를 넘겨주기 -->
			    <td align="center" style=font-size:1.2em;>
			    <a href="adm_allview.jsp?y=<%=prevYear%>&m=<%=prevMonth%>" style=font-size:1.5em;>◁</a> 
			    <%=year%> / <%=month+1%>
			    <a href="adm_allview.jsp?y=<%=nextYear%>&m=<%=nextMonth%>" style=font-size:1.5em;>▷</a>
			    </td>
			</tr>
			<tr>
			    <td>
					<p></p>
			        <table border="1"  width="700" height="500" cellspacing=0px>
			        <tr height=50 align=center bgcolor=#ffedc9>
			            <td>SUN</td>
			            <td>MON</td>
			            <td>TUE</td>
			            <td>WED</td>
			            <td>THU</td>
			            <td>FRI</td>
			            <td>SAT</td>
			        </tr>
			        <tr align=center>
			        
			<%	
				/* 방을 예약한 사람들의 이름, 예약한 방, 날짜 가져와 reserveList에 담기 */
				ReserveService reserveService = new ReserveService();
			    List<Reserve> reserveList = new ArrayList<>();
			    reserveList = reserveService.select();
			    
			    String name = ""; // 이름
			    String ResvDate = ""; // 예약한 날짜 
			    String ResvMonth = "";
			    int room = 0; // 방 번호
		    
			    // 달력은 일요일이 가장 왼쪽 7(월요일)이 될 때 까지
			    for (int i=1; i<bgnWeek; i++) 
				    // 시작요일까지 이동
			    	out.println("<td>&nbsp;</td>");
			
			    // 첫날~마지막날까지 처리
			    // 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
			    while (cal.get(Calendar.MONTH) == month) {
			    	 String pool = "PoolRoom";
					 String seaView = "SeaViewRoom";
					 String delux = "DeluxRoom";
					 
			    	int date = 0;
			    	String calendarDate = "";
			    	String calendarMonth = "";
			    	
			 

			    	// 일요일 토요일은 색상을 빨간색으로
			    	if (bgnWeek == 7 || bgnWeek == 1) {
   				%>
			        	<td><font color=red><%=cal.get(Calendar.DATE)%></font><br><br>
	        	<%  
			    	} else {
	    		%>
		    			<td><%=cal.get(Calendar.DATE)%><P></P>
	    		<%
			    	}
			    	// 예약한 사람들은 다르게 출력할 준비
	 		    	 for (int i = 0; i < reserveList.size(); i++) {									
			    		ResvDate = reserveList.get(i).getResvDate(); // 예약한 날짜("yyyy-MM-dd")
			    		ResvMonth = ResvDate.substring(5,7); // 몇월인지만 떼서 변수에 담기
			    		ResvDate = ResvDate.substring(8); // 몇일인지만 떼서 다시 변수에 담기 (조작1경우)
			    		date = Integer.parseInt(ResvDate); // int형으로 변환 (조작2경우)
			    		
			    		
			    		room = reserveList.get(i).getRoom(); // 방 번호 받기(int)
						
			    		calendarDate = Integer.toString(cal.get(Calendar.DATE)); // 캘린더 날짜(String형)
			    		calendarMonth = Integer.toString((cal.get(Calendar.MONTH)+ 1)); // 캘린더 날짜(String형
			    		
			    		// 익명 보장 조작을 위한 변수 선언
			    		String firstName = "";
			    		String lastName = "";
			    		String anonyName = "";
		    		
			    		// db의 '몇 일'은 두 자리로 되어있기 때문에 캘린더 날짜가 한 자리 수라면 두 자리로 변환해준다. 
			    		if (calendarDate.length() == 1) {
			    			calendarDate = "0" + calendarDate;
			    		}
			    		
			    		if (calendarMonth.length() == 1) {
			    			calendarMonth = "0" + calendarMonth;
			    		}
			    		if (calendarMonth.equals(ResvMonth)) {
			    		// db의 날짜와 캘린더의 날짜와 같으며, 1번방이라면 예약고객의 이름을 vip에 담아준다.			    		
				    		 if (calendarDate.equals(ResvDate) && room == 1) {
								pool = reserveList.get(i).getName();
				    		}
				    		// db의 날짜와 캘린더의 날짜와 같으며, 2번방이라면 예약고객의 이름을 general에 담아준다.		
				    		 if (calendarDate.equals(ResvDate) && room == 2) {
				    			seaView = reserveList.get(i).getName();
				    		}
				    		// db의 날짜와 캘린더의 날짜와 같으며, 3번방이라면 예약고객의 이름을 rational에 담아준다.		
				    		 if (calendarDate.equals(ResvDate) && room == 3) {
				    			delux = reserveList.get(i).getName();
				    		}
			    		}
				    } 	
	 		    	// 방 조건에 따라 출력하는 곳
					
	 		    	%>
	 		    	<%
	 		    		if (pool.equals("PoolRoom")) {
 		    		%>
						<a href=d_02.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=calendarMonth%>&year=<%=cal.get(Calendar.YEAR)%>&room=PoolRoom style=color:#ffbf36;><%=pool%></a><br>
 		    		<% 
					} else {
					%>
	 		    		<a href=adm_oneview.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=calendarMonth%>&year=<%=cal.get(Calendar.YEAR)%>&room=PoolRoom style=color:#4f87ff;><%=pool%></a><br>
					<%
					}
	 		    	%>
	 		    	<%
	 		    		if (seaView.equals("SeaViewRoom")) {
 		    		%>
					<a href=d_02.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=calendarMonth%>&year=<%=cal.get(Calendar.YEAR)%>&room=SeaViewRoom style=color:#ffbf36;><%=seaView%></a><br> 
					<% 
					} else {
					%>
					<a href=adm_oneview.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=calendarMonth%>&year=<%=cal.get(Calendar.YEAR)%>&room=SeaViewRoom style=color:#4f87ff;><%=seaView%></a><br>
					<%
					}
					%>
					<%
	 		    		if (delux.equals("DeluxRoom")) {
 		    		%>
					<a href=d_02.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=calendarMonth%>&year=<%=cal.get(Calendar.YEAR)%>&room=DeluxRoom style=color:#ffbf36;><%=delux%></a><br>
					<% 
					} else {
					%>
					<a href=adm_oneview.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=calendarMonth%>&year=<%=cal.get(Calendar.YEAR)%>&room=DeluxRoom style=color:#4f87ff;><%=delux%></a><br>
					<%
					}
					%>
				<% 	 	 		    	 
			        // 토요일인 경우 다음줄로 생성
			        if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) 
			        	out.println("</tr><tr align=center>");
			
			        // 날짜 증가시키기
			        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
			        
			        // 월요일까지 작성하면 다시 0으로(일요일) 초기화
			        if (bgnWeek == 7) 
			        	bgnWeek = 0;
			        
			        // 계속해서 up!
			        bgnWeek++;
			    }
			
			    // 끝날부터 토요일까지 빈칸으로 처리
			    for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) 
			    	out.println("<td>&nbsp;</td>");
			    %>
		        </tr>
	        	</table>
			    </td>
			</tr>
			</table>
			</form>
		</div>		
	</body>
</html>