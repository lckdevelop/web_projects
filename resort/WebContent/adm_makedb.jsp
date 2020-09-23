<%@page import="domain.Reserve"%>
<%@page import="service.ReserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
	<head>
		<title>id와 비밀번호를 저장</title>
	</head>
	<body>
		<%
			    //String driverName="com.mysql.cj.jdbc.Driver";
			   // String url = "jdbc:mysql://192.168.23.140:3306/koposw01";
			    //String id = "root";
			    //String pwd ="9683";
			 
			    //request.setCharacterEncoding("utf-8");
			    //String code = request.getParameter("code");
			    //String irum = request.getParameter("irum");
			    //String celphone = request.getParameter("celphone");
			   
			    Class.forName("com.mysql.cj.jdbc.Driver");
			    Connection conn = DriverManager.getConnection("jdbc:mysql://172.30.1.14:3306/koposw01", "root", "root");
			   
			    //Statement객체를 통한 쿼리 작업
			   
			   
			    //String sql ="insert into info values('"+code+"','"+irum+"','"+celphone+"')";
			   
			    //위 코드를 String.format()메서드를 이용하여 좀더 보기좋게 작성
			    
			    String sql = "insert into adminfo values('admin', 'admin')";
			     
			    Statement stmt = conn.createStatement();
	
			    stmt.execute(
					"create table adminfo ("
							+ "id varchar(20) primary key not null, "
							+ "pass varchar(20))"
							+ "DEFAULT CHARSET=utf8");
			    
			    int r = stmt.executeUpdate(sql);
			   
			    if(r==1){
			    	out.println("1개 데이터 추가 성공");
			    }
			   
			    stmt.close();
			    conn.close();
			%>
	</body>
</html>