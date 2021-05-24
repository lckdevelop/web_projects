<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post">
<table>
	<caption>사용자 로그인</caption>
<tr>
	<th>아이디</th>
	<td><input type="text" name="id" autofocus="autofocus" required="required"/></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="password" required="required"/></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="로그인" />
		<input type="button" value="회원가입" onclick="location.href='manager/signup' " />
	</td>
</tr>
</table>
</form>
</body>
</html>