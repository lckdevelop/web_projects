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
		<script>
			function inputPhoneNumber(obj) {
			
			
			
			    var telnum = obj.value.replace(/[^0-9]/g, "");
			    var phone = "";
			
			
			
			    if(number.length < 4) {
			        return number;
			    } else if(number.length < 7) {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3);
			    } else if(number.length < 11) {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3, 3);
			        phone += "-";
			        phone += number.substr(6);
			    } else {
			        phone += number.substr(0, 3);
			        phone += "-";
			        phone += number.substr(3, 4);
			        phone += "-";
			        phone += number.substr(7);
			    }
			    obj.value = phone;
				}
		</script>
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
			
			select {
				width:60%;
				padding:6px;
				text-align-last:center;
				font-family: 'Recursive', sans-serif;
			}
			
		</style>
	</head>
	<body>
		<%	
			
			request.setCharacterEncoding("utf-8");
			
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date = new Date();
			
			String day = request.getParameter("date"); // 몇일인지 받아오기
			String month = request.getParameter("month"); // 몇월인지 받아오기
			String year = request.getParameter("year"); // 몇년도인지 받아오기
			String room = request.getParameter("room"); // 원하는 방 받아오기
			String fullDate = "";

			// 달력을 보고 들어온것이 아니라 그냥 예약페이지로 들어왔다면 현재 일로 설정
			if (day == null) {
				fullDate = format1.format(date);
			} else {
				if (day.length() == 1) {
	    			day = "0" + day;
	    		}
				
				fullDate = year + "-" + month + "-" + day;
				
			}
			

		%>
		<div align=center>
			
			<table>
				<tr>
					<td>
 						<div style=margin:30px;></div>
					</td>
				</tr>	
				<tr>
					<td style=font-size:2em;color:#ffcd59;> Today's Reservation </td>
				</tr>
				<tr>
					<td>
 						<div style=margin:30px;></div>
					</td>
				</tr>	
			</table>			
		<form mehtod=post action=d_02_write.jsp>
			<table border=1 cellspacing=0 cellpadding=5 style="width:90%;">
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9><b>Name</b></td>
					<td width=130 align=center><input type=text name=name placeholder="Do not contain number" style="text-align: center;" onkeyup="this.value=this.value.replace(/[0-9~!@#$%^&*()_+|<>?:{}]/,'');"><p align=center></p></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9><b>ReserveDate</b></td>
					<td width=100 align=center><input type=hidden name=resvDate value=<%=fullDate%> readonly><%=fullDate%></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9><b>Room</b></td>
					<td width=200 align=center>
						<select name=room>
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
							} else {
						%>
							<option value=DeluxRoom> DeluxRoom </option>
							<option value=PoolRoom> PoolRoom </option>
							<option value=SeaViewRoom> SeaViewRoom </option>
						<%		
							}
						} else {
							%>
							<option value=PoolRoom> PoolRoom </option>
							<option value=SeaViewRoom> SeaViewRoom </option>
							<option value=DeluxRoom> DeluxRoom </option>
						<%
						}
						%>
						</select>
					</td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9><b>Address</b></td>
					<td width=100 align=center><input type=text name=addr style="text-align: center;"><p align=center></p></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9><b>TelNum</b></td>
					<td width=100 align=center><input type=text name=telnum placeholder="Do not post'-'" style="text-align: center;" onkeyup="this.value=this.value.replace(/[^0-9]+/,'');"><p align=center></p></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9><b>Depositor</b></td>
					<td width=100 align=center><input type=text name=inName placeholder="Do not contain number" style="text-align: center;" onkeyup="this.value=this.value.replace(/[0-9~!@#$%^&*()_+|<>?:{}]/,'');"><p align=center></p></td>
				</tr>
				<tr style="height:60px;">
					<td width=30 align=center bgcolor=#ffedc9><b>Comment</b></td>
					<td width=100 align=center><input type=text name=comment style="text-align: center;"><p align=center></p></td>
				</tr>			
	        </div> 
			<table style="width:90%;">
	            <tr>                       
	                <td align=right><input type=submit name=new value=Reserve style="width:80px;"></td>
	            </tr>
			</table>			
	</body>
</html>