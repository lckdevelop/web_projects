<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>카테고리 바입니다.</title>

<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300;500;700;900&display=swap" rel="stylesheet">
<link 
	href="${app}/resources/manager/css/manager.css" rel="stylesheet">
<link
	href="${app}/resources/manager/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<h3>category</h3>
<ul id="category-box">
	<li class="main-category"><a>카1</a></li>
	<li class="main-category"><a>카2</a></li>
	<li class="main-category"><a>카3</a></li>
	<li class="main-category"><a>카4</a></li>
	<li class="main-category"><a>카5</a></li>
	<li class="main-category"><a>카6</a></li>
	<li class="main-category"><a>카7</a></li>
</ul>
</body>
</html>