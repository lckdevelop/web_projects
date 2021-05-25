<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="searchDTO" value="${searchDTO}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>카테고리 바입니다.</title>

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/customer/css/customer.css" rel="stylesheet">
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
<h3>category</h3>

<!-- 검색기능 틀 -->

<form action="/store/customer/searchresult">
	<input type="hidden" name="mainCategory" value="${searchDTO.mainCategory }"/>
	<input type="hidden" name="subCategory" value="${searchDTO.subCategory }"/>
	<div class="col-md-3">
		<input type="text" id="searchKeyword" name="searchKeyword" class="form-control" value="${searchDTO.searchKeyword}" placeholder="Search"/>
	</div>
	<div class="col-md-2">
	    <input type="submit" class="btn btn-default" value="검색"></input>
	</div>
</form>
<form action="/store/customer/searchresult">
	<input type="hidden" name="mainCategory" value="${searchDTO.mainCategory }"/>
	<input type="hidden" name="subCategory" value="${searchDTO.subCategory }"/>
	<input type="hidden" name="searchKeyword" value="${searchDTO.searchKeyword}"/>
	<button class="maincategory" name="mainCategory" value="김밥류" >김밥류</button>
     	<div class="panel">
           <button class="subCategory" name="subCategory" value="삼각김밥" >삼각김밥</button>
         </div>
         <div class="panel">
           <button class="subCategory" name="subCategory" value="줄김밥">줄김밥</button>
         </div>
         <div class="panel">
           <p>Hello World!</p>
         </div>
       
       <button class="mainCategory">Section 2</button>
         <div class="panel">
           <p>Hello World~~~</p>
         </div>
	
	<!-- <ul id="category-box">
		<li class="main-category"><a href="/store/customer/searchresult">도시락</a></li>
		<li class="main-category"><a href="/store/customer/searchresult">김밥</a></li>
		<li class="main-category"><a href="/store/customer/searchresult">샌드위치</a></li>
		<li class="main-category"><a href="/store/customer/searchresult">햄버거</a></li>
		<li class="main-category"><a href="/store/customer/searchresult">샐러드</a></li>
		<li class="main-category"><a href="/store/customer/searchresult">유제품</a></li>
		<li class="main-category"><a href="/store/customer/searchresult">제과</a></li>
		<li class="main-category"><a href="/store/customer/searchresult">기타</a></li>
	</ul> -->
</form>
</body>
</html>