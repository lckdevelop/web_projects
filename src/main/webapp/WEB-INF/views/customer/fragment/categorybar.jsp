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
<link 
	href="${app}/resources/customer/css/categoryaccordion.css" rel="stylesheet">

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
	<input type="hidden" name="mainCategory" value="${searchDTO.mainCategory }"/>
	<input type="hidden" name="subCategory" value="${searchDTO.subCategory }"/>
	<div class="col-md-3">
	<input type="text" id="searchKeyword" name="searchKeyword" class="form-control" value="${searchDTO.searchKeyword}" placeholder="Search" />
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
	
	
	
</form>

 <div class="col">
    <h2>Open <b>one</b></h2>
    <div class="tabs">
      <div class="tab">
        <input type="radio" id="rd1" name="rd">
        <label class="tab-label" for="rd1">김밥류</label>
        <div class="tab-content">
          <button class="accordionbutton" name="subCategory" value="삼각김밥">삼각김밥</button>
          <button name="subCategory" value="줄김밥">줄김밥</button>
	      <button name="subCategory" value="주먹밥">주먹밥</button>
        </div>
      </div>
	      
	  <div class="tab">
        <input type="radio" id="rd1" name="rd">
        <label class="tab-label" for="rd1">도시락류</label>
        <div class="tab-content">
          <button name="subCategory" value="도시락일반">도시락일반</button>
          <button name="subCategory" value="도시락샐러드">도시락샐러드</button>
        </div>
      </div>
      
      <div class="tab">
        <input type="radio" id="rd1" name="rd">
        <label class="tab-label" for="rd1">빵류</label>
        <div class="tab-content">
          <button name="subCategory" value="일반빵">일반빵</button>
          <button name="subCategory" value="핫도그">핫도그</button>
          <button name="subCategory" value="샌드위치">샌드위치</button>
        </div>
      </div>
      
      <div class="tab">
        <input type="radio" id="rd1" name="rd">
        <label class="tab-label" for="rd1">즉석요리</label>
        <div class="tab-content">
          <button name="subCategory" value="튀김">튀김</button>
        </div>
      </div>
      
      <div class="tab">
        <input type="radio" id="rd1" name="rd">
        <label class="tab-label" for="rd1">완제품</label>
        <div class="tab-content">
          <button name="subCategory" value="박스류">박스류</button>
        </div>
      </div>
      
      <div class="tab">
        <input type="radio" id="rd1" name="rd">
        <label class="tab-label" for="rd1">유제품류</label>
        <div class="tab-content">
          <button name="subCategory" value="우유">우유</button>
          <button name="subCategory" value="요거트">요거트</button>
          <button name="subCategory" value="요구르트">요구르트</button>
        </div>
      </div>
      
      
      <div class="tab">
        <input type="radio" id="rd3" name="rd">
        <label for="rd3" class="tab-close">닫기 &times;</label>
      </div>
    </div>
  </div>

<!--
		<button class="accordion" name="maincategory">빵</button>
	         <div class="panel">
	           <button name="subCategory" value="일반빵">일반빵</button>

	           <button name="subCategory" value="핫도그">핫도그</button>

	           <button name="subCategory" value="샌드위치">샌드위치</button>
	         </div>
		
		<button class="accordion" name="maincategory">즉석요리</button>
			<div class="panel">
	           <button name="subCategory" value="튀김">튀김</button>
	         </div>
	         
		<button class="accordion" name="maincategory">완제품</button>
	         <div class="panel">
	           <button name="subCategory" value="박스류">박스류</button>
	         </div>
	         	         	         	 
		<button class="accordion" name="maincategory">유제품류</button>
	         <div class="panel">
	           <button name="subCategory" value="우유">우유</button>

	           <button name="subCategory" value="요거트">요거트</button>

	           <button name="subCategory" value="요구르트">요구르트</button>
	         </div>	  -->  
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