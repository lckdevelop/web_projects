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

<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" 
	src="${app}/resources/customer/js/accordion.js"></script>	

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/customer/css/customer.css" rel="stylesheet">
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet">
<link 
	href="${app}/resources/customer/css/accordion.css" rel="stylesheet">
	
<script type="text/javascript">
	function categorySearch(f){
		$("#searchKeyword").val("");
		f.submit();
		
	}
	
	/* 중분류 <option> 태그 */
	$(cateSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		cateSelect2.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>");
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
		
	});
</script>
</head>
<body>
<h3>category</h3>

<!-- 검색기능 틀 -->

<form action="/store/customer/searchresult">
	<div class="col-md-3">
		<input type="text" id="searchKeyword" name="searchKeyword" class="form-control" value="${searchDTO.searchKeyword}" placeholder="Search" />
	</div>
	<div class="col-md-2">
	    <input type="submit" class="btn btn-default" value="검색"></input>
	</div>
	
	<button class="accordion" name="maincategory" value="${searchDTO.mainCategory}">김밥류</button>
         <div class="panel">
           <button name="subCategory" value="삼각김밥" onclick="categorySearch(this.form)">삼각김밥</button>
         </div>
         <div class="panel">
           <button name="subCategory" value="줄김밥" onclick="categorySearch(this.form)">줄김밥</button>
         </div>
         <div class="panel">
           <p>Hello World!</p>
         </div>
       
       <button class="accordion">Section 2</button>
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

<button class="accordion">김밥</button>
			<div class="panel">
			  	<p>Hello World!</p>
			</div>
	    
	    <button class="accordion">샌드위치</button>
			<div class="panel">
			  	<p>Hello World~~~</p>
			</div>
			
	    <button class="accordion">햄버거</button>
			<div class="panel">
			  <p>왜안돼</p>
			</div>
		
		<button class="accordion">샐러드</button>
			<div class="panel">
			  <p>왜안돼</p>
			</div>
			
		<button class="accordion">유제품</button>
			<div class="panel">
			  <p>왜안돼</p>
			</div>
			
		<button class="accordion">제과</button>
			<div class="panel">
			  <p>왜안돼</p>
			</div>

		<button class="accordion">기타</button>
			<div class="panel">
			  <p>왜안돼</p>
			</div>
		
<!-- 
<ul id="category-box">
	<li class="main-category" name="maincategory" value="도시락류"><a href="./searchresult/${maincategory}">도시락</a></li>
	<li class="main-category"><a href="./searchresult/${maincategory}">김밥</a></li>
	<li class="main-category"><a href="./searchresult/${maincategory}">샌드위치</a></li>
	<li class="main-category"><a href="./searchresult/${maincategory}">햄버거</a></li>
	<li class="main-category"><a href="./searchresult/${maincategory}">샐러드</a></li>
	<li class="main-category"><a href="./searchresult/${maincategory}">유제품</a></li>
	<li class="main-category"><a href="./searchresult/${maincategory}">제과</a></li>
	<li class="main-category"><a href="./searchresult/${maincategory}">기타</a></li>
</ul>
-->
</body>
</html>