<%@page import="domain.Reserve"%>
<%@page import="service.ReserveService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="domain.Gongji"%>
<%@page import="service.GongjiService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<html>
	<head>
		<link href="https://fonts.googleapis.com/css2?family=Recursive:wght@700&display=swap" rel="stylesheet">
		<title> 예약 서비스 </title>		
		<style>
			table {
				border-collapse: collapse;
			}
			
			td {
					font-size: 1em;
					font-family: 'Recursive', sans-serif;
			}
			
			body {
				background-color: #fffeeb;
			}
			
			input {
				width:60%;
				padding:6px;
				font-family: 'Recursive', sans-serif;
				
			}
			
			textarea {
				width:60%;
				padding:6px;
				font-family: 'Recursive', sans-serif;
				
			}
			
			select {
				width:60%;
				padding:6px;
				text-align-last:center;
				font-family: 'Recursive', sans-serif;
			}
			
		</style>		
		<script LANGUAGE=JavaScript>
		function submitForm(mode) {
			if(mode == "write") {
				updateWrite.action = "adm_update.jsp?key=update";
				//viewWrite.submit();
			} else if(mode == "delete") {
				updateWrite.action = "adm_delete.jsp";
			}
			updateWrite.submit();
		}
		</script>		
	</head>
	<body>
		<%	
			ReserveService reserveService = new ReserveService();
			Reserve reserve = new Reserve();

			request.setCharacterEncoding("utf-8");
			
			SimpleDateFormat format2 = new SimpleDateFormat("dd");
			
			Date date = new Date();
			
			String day = request.getParameter("date"); // 몇일인지 받아오기
			String month = request.getParameter("month"); // 몇월인지 받아오기
			String year = request.getParameter("year"); // 몇년도인지 받아오기
			
			String room = request.getParameter("room"); // 원하는 방 받아오기
			int roomNum = 0;
			
			if (room.equals("PoolRoom")) {
				roomNum = 1;
			} else if (room.equals("SeaViewRoom")) {
				roomNum = 2;
			} else {
				roomNum = 3;
			}
			//int room
			// 달력을 보고 들어온것이 아니라 그냥 예약페이지로 들어왔다면 현재 일로 설정
			if (day == null) {
				day = format2.format(date);
			}
			
			if (day.length() == 1) {
    			day = "0" + day;
    		}
			
			if (month.length() == 1) {
    			month = "0" + month;
    		}
			
			
			String fullDate = year + "-" + month + "-" + day;
			//fullDate = fullDate.trim();
			
			reserve = reserveService.selectAll(fullDate, roomNum);
			
			String name = reserve.getName();
			String resvDate = reserve.getResvDate();
			
			// room
			String addr = reserve.getAddr();
			String telnum = reserve.getTelnum();
			String inName = reserve.getInName();
			String comment = reserve.getComment();
			String writeDate = reserve.getWriteDate();
			int processing = reserve.getProcessing();
			
		%>
		<div align=center>
			<table>
				<tr>
					<td>
 						<div style=margin:30px;></div>
					</td>
				</tr>	
				<tr>
					<td style=font-size:2em;color:#ffcd59;> Modify Reservation </td>
				</tr>
				<tr>
					<td>
 						<div style=margin:50px;></div>
					</td>
				</tr>	
			</table>	
		<form mehtod=post name=updateWrite>
			<table border=1 cellspacing=0 cellpadding=5 style="width:55%;">
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>Name</td>
					<td width=130 align=center><textarea name=name style="resize:none;text-align: center;" onkeyup="this.value=this.value.replace(/^[0-9]+$/,'');"><%=name%></textarea></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>ReserveDate</td>
					<td align=center><input type='date' name=resvDate value=<%=fullDate%> style=text-align:center;></td>
					<input type=hidden name=originDate value=<%=fullDate%>>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>Room</td>
					<input type=hidden name=originRoom value=<%=roomNum%> width=200>
					<td width=200 align=center>
						<select name=room id=room>
						<% 
						if (room != null) {
							if (room.equals("PoolRoom")) {
						
						%>
							<option value=PoolRoom> PoolRoom </option>
							<option value=SeaViewRoom> SeaViewRoom </option>
							<option value=DeluxRoom> DeluxRoom </option>
						
						<% 		
							} else if (room.equals("SeaViewRoom")) {
						%>
							<option value=SeaViewRoom> SeaViewRoom </option>
							<option value=DeluxRoom> DeluxRoom </option>
							<option value=PoolRoom> PoolRoom </option>
							
						<% 
							} else if (room.equals("DeluxRoom")){
						%>
							<option value=DeluxRoom> DeluxRoom </option>
							<option value=PoolRoom> PoolRoom </option>
							<option value=SeaViewRoom> SeaViewRoom </option>
						<%		
							} 
							
						}
						%>
						</select>
					</td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>Address</td>
					<td width=100 align=center><textarea name=addr style="resize:none;text-align: center;resize:none;"><%=addr%></textarea></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>TelNum</td>
					<td width=100 align=center><textarea name=telnum style="resize:none;text-align: center;resize:none;" style="text-align: center;" onkeyup="this.value=this.value.replace(/[^0-9]+/,'');"><%=telnum%></textarea></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>Depositor</td>
					<td width=100 align=center><textarea name=inName style="resize:none;text-align: center;resize:none;" style="text-align: center;" onkeyup="this.value=this.value.replace(/^[0-9]+$/,'');"><%=inName%></textarea></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>Comment</td>
					<td width=100 align=center><textarea name=comment style="text-align: center;" style=resize:none;><%=comment%></textarea></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>ReceiptDate</td>
					<td width=100 align=center><input type=text name=writeDate style=border:0;text-align-last:center; value=<%=writeDate%> readonly><p align=center></p></td>
				</tr>	
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9>Progress</td>
					<td width=200 align=center>
						<select name=processing id=processing>
						<% 
							if (processing == 1) {
						
						%>
							<option value=1> 1.예약완료 </option>
							<option value=2> 2.입금완료 </option>
							<option value=3> 3.환불요청 </option>
						
						<% 		
							} else if (processing == 2) {
						%>
							<option value=2> 2.입금완료 </option>
							<option value=3> 3.환불요청 </option>
							<option value=1> 1.예약완료 </option>
							
						<% 
							} else if (processing == 3){
						%>
							<option value=3> 3.환불요청 </option>
							<option value=1> 1.예약완료 </option>
							<option value=2> 2.입금완료 </option>
						<%		
							} else {
								
						%>	
							<option value=0> 선택하세요 </option>
							<option value=1> 1.예약완료 </option>
							<option value=2> 2.입금완료 </option>
							<option value=3> 3.환불요청 </option>
						
						<% 	
							}
							
						%>
						</select>
					</td>
				
				
				</tr>				
			</table>	
        </div>
        <table style="width:55%;" align=center>
        	<tr align=right>
	           	<td><input type=button value=AdminPage onclick=location.href="adm_allview.jsp" style="width:90px;">
				<input type=button value=Update onclick=submitForm('write') style="width:90px;">
				<input type=button value=Delete onclick=submitForm('delete') style="width:90px;"></td>
			<tr>
		</table>
        </form>
	</body>
</html>