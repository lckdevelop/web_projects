<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
    <!-- Custom Stylesheet -->
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<title>로그인 실패</title>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body onload="message()">
<script>
function message(){
	Swal.fire({
		  icon: 'error',
		  title: '이런!',
		  text: '아이디 혹은 비밀번호가 잘못되었습니다.',
		  footer: '<a href="./customer/signup"> 회원 가입하기</a>'
		}).then(function(){
			window.location="./customer";
			
		});
};
</script>
</body>
</html>

