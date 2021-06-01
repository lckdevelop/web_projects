<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Custom Stylesheet -->
<link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300;500;700;900&display=swap" rel="stylesheet">
<link 
	href="${app}/resources/customer/css/manager.css" rel="stylesheet">
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
</head>
<body>

    <!--**********************************
        Header start
    ***********************************-->
	<div class="nav-control">
	    <div class="hamburger">
	        <span class="toggle-icon"><i class="icon-menu"></i></span>
	    </div>
	</div>
    <!--**********************************
       Header end
   ***********************************-->       
</body>
</html>