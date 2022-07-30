<%@page import="domain.Admin"%>
<%@page import="service.AdminService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<body>
		<div align=center>
			<%	
				AdminService adminService = new AdminService();
				Admin admin = new Admin();
				
			
				//post방식에서 한글 깨짐을 방지하기 위해 사용
				request.setCharacterEncoding("utf-8");
				
				String jump = request.getParameter("jump");
				String id = request.getParameter("id");
				String pass = request.getParameter("passwd");
				
				boolean bPassChk = false;
				// 입력받은 아이디와 비번이 있는지 가져온다.
				admin = adminService.selectOne(id, pass);
				// 앞뒤로 공백을 제거하고 db에 있는 아이디, 비번과 비교한다.
				if (id.replaceAll(" ", "").equals(admin.getId()) && pass.replaceAll(" ", "").equals(admin.getPasswd())) {
					bPassChk = true;
				} else {
					bPassChk = false;
				}
				
				// 패스워드 체크가 끝나면, 세션을 기록하고 점프
				if (bPassChk) {
					session.setAttribute("login_Ok", "yes"); //login_Ok(모두 대문자) KEY와 VALUE
					session.setAttribute("login_id", id); 
					response.sendRedirect("adm_allview.jsp"); // 로그인체크 이후 돌아갈 곳(adm_allview.jsp)
				} else {
					out.println("<h2>아이디 또는 패스워드 오류.<h2>");
					out.println("<input type=button value='로그인' OnClick=\"location.href='adm_login.jsp?jump="+jump+"'\">");
					
				}
			%>
		</div>
	</body>
</html>