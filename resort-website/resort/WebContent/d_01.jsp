<%@page import="java.text.SimpleDateFormat"%>
<%@page import="domain.Reserve"%>
<%@page import="service.ReserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="user-scalable=no, width=device-width" />
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<head>
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
			int staticMonth = cal.get(Calendar.MONTH) + 1; // 30일 조작
			int staticYear = cal.get(Calendar.YEAR); //30일 조작
			//int cnt = request.getParameter("count") == null ? 1 : Integer.parseInt(request.getParameter("count"));
			int cnt = request.getParameter("count") == null ? 1 : Integer.parseInt(request.getParameter("count"));
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
		    
			SimpleDateFormat sdf = new SimpleDateFormat("dd");
			long time = System.currentTimeMillis();
			time = Integer.parseInt(sdf.format(time));
			long beforeTime = time;
			long afterTime = time + 30;
			//int cnt = 1;
		%>
		<div align=center>
			<div id="container" style="width:device-width;height:device-height;">
			<form method=post action=d_02.jsp>
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td style=font-size:2em;color:#ffcd59;>Reservation</td>
			</tr>
			<tr>
				<td>
					<div style=margin:30px;></div>
				</td>
			</tr>
			<tr>
				<!-- y, m의 키를 넘겨주기 -->
			    <td align="center" style=font-size:1.2em;>
			    <a href="d_01.jsp?y=<%=prevYear%>&m=<%=prevMonth%>&count=<%=cnt%>" style=font-size:1.5em;>◁</a> 
			    <%=year%> / <%=month+1%> 
			    <a href="d_01.jsp?y=<%=nextYear%>&m=<%=nextMonth%>&count=<%=cnt%>" style=font-size:1.5em;>▷</a>
			    </td>
			</tr>
			<tr>
			    <td>
					<p></p>
			        <table border="1"  width="700" height="800" cellspacing=0px>
			        <tr height=50 align=center bgcolor=#ffedc9>
			            <td>SUN</td>
			            <td>MON</td>
			            <td>TUE</td>
			            <td>WED</td>
			            <td>THU</td>
			            <td>FRI</td>
			            <td>SAT</td>
		    			<input type=hidden name=count value=<%=cnt %>>
			        </tr>
			        <tr align=center height=100>
			        
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
			    for (int i=1; i<bgnWeek; i++) {
				    // 시작요일까지 이동
			    	out.println("<td>&nbsp;</td>");
			    }
			    
			  //오늘날짜에서 1달 이후 날짜를 구하기
				Calendar Ccal = Calendar.getInstance();
				Ccal.add(Calendar.MONTH, 1);
				int y1 = Ccal.get(Calendar.YEAR);
				int m1 = Ccal.get(Calendar.MONTH) + 1;
				int d1 = Ccal.get(Calendar.DATE);
			// 오늘날짜에서 하루 전 날짜를 구하기
				Calendar Ccal2 = Calendar.getInstance();
				//Ccal2.add(Calendar.DATE, - 1);
				int y2 = Ccal2.get(Calendar.YEAR);
				int m2 = Ccal2.get(Calendar.MONTH) + 1;
				int d2 = Ccal2.get(Calendar.DATE);
				
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
			        	<td style="vertical-align:top;"><font color=red><%=cal.get(Calendar.DATE)%></font><br><br>
	        	<%  
			    	} else {
	    		%>
		    			<td style="vertical-align:top;"><%=cal.get(Calendar.DATE)%><P></P>
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
			    		calendarMonth = Integer.toString((cal.get(Calendar.MONTH)) + 1); // 캘린더 날짜(String형
			    		
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
			    		// db의 날짜와 캘린더의 날짜와 같으면, 1번방이라면 예약고객의 이름을 vip에 담아준다.			    		
			    		 if (calendarDate.equals(ResvDate) && room == 1) {
							pool = reserveList.get(i).getName();
							
							firstName = pool.substring(0,1);
							lastName = pool.substring((pool.length() - 1));
							
							for (int star = 0; star < pool.length() - 2; star++) {
								anonyName += "*";
							}
							pool = firstName + anonyName + lastName;
				    		
			    		}
			    		// db의 날짜와 캘린더의 날짜와 같으며, 2번방이라면 예약고객의 이름을 general에 담아준다.		
			    		 if (calendarDate.equals(ResvDate) && room == 2) {
			    			seaView = reserveList.get(i).getName();
			    			
			    			firstName = seaView.substring(0,1);
							lastName = seaView.substring((seaView.length() - 1));
							
							for (int star = 0; star < seaView.length() - 2; star++) {
								anonyName += "*";
							}
							seaView = firstName + anonyName + lastName;
			    		}
			    		// db의 날짜와 캘린더의 날짜와 같으며, 3번방이라면 예약고객의 이름을 rational에 담아준다.		
			    		 if (calendarDate.equals(ResvDate) && room == 3) {
			    			delux = reserveList.get(i).getName();
			    			
			    			firstName = delux.substring(0,1);
							lastName = delux.substring((delux.length() - 1));
							
							for (int star = 0; star < delux.length() - 2; star++) {
								anonyName += "*";
							}
							delux = firstName + anonyName + lastName;
			    		}
			    		}
				    }
			    		// 30일만 출력하기위한 조건문
	 		    		if (y2 == cal.get(Calendar.YEAR) && m2 == cal.get(Calendar.MONTH) + 1 && d2 <= cal.get(Calendar.DATE)
	 		    				|| y1 == cal.get(Calendar.YEAR) && m1 == cal.get(Calendar.MONTH) + 1 && d1 > cal.get(Calendar.DATE)) {
		 		    		
		 		    	 	if (pool.equals("PoolRoom")) {
		    	 		%>
								<a style=color:#ffbf36; href=d_02.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=cal.get(Calendar.MONTH) + 1%>&year=<%=cal.get(Calendar.YEAR)%>&room=PoolRoom><%=pool%></a><br>
			    	 	<%
		 		    	 	} else {
		    	 		%>
		 		    	 		<font color=#4f87ff><B><%=pool%></B></font><br>
			    	 	<% 
		 		    	 	}
		 		    	 	
		 		    	 	if (seaView.equals("SeaViewRoom")) {
		    	 		%>
								<a style=color:#ffbf36; href=d_02.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=cal.get(Calendar.MONTH) + 1%>&year=<%=cal.get(Calendar.YEAR)%>&room=SeaViewRoom><%=seaView%></a><br> 
			    	 	<%
		 		    	 	} else {
		    	 		%>
		 		    	 		<font color=#4f87ff><B><%=seaView%></B></font><br>
			    	 	<% 
		 		    	 	} 
		 		    	 	
		 		    	 	if (delux.equals("DeluxRoom")) {
		    	 		%>
								<a style=color:#ffbf36; href=d_02.jsp?date=<%=cal.get(Calendar.DATE)%>&month=<%=cal.get(Calendar.MONTH) + 1%>&year=<%=cal.get(Calendar.YEAR)%>&room=DeluxRoom><%=delux%></a><br>
			    	 	<%	
		 		    	 	} else {
		    	 		%>	  
		    	 			<font color=#4f87ff><B><%=delux%></B></font><br>
	 	 			<%
		 		    	 	}
				        
		 		    	
	 		    	}
				        // 토요일인 경우 다음줄로 생성
				        if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) 
				        	out.println("</tr><tr align=center height=100>");
				
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
		</div>		
	</body>
</html>