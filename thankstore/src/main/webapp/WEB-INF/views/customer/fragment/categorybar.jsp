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
	
	
</script>

</head>
<body>
<h3>category</h3>

<!-- 검색기능 틀 -->

<form action="/store/customer/searchresult">
<div class="col">
	<input type="hidden" name="mainCategory" value=""/>
	<input type="hidden" name="subCategory" value=""/>
	<div class="col">
	<input type="text" id="searchKeyword" name="searchKeyword" class="form-control" value="${searchDTO.searchKeyword}" placeholder="Search" />
	</div>
	<div class="col">
	    <input type="submit" class="btn btn-primary" value="검색"></input>
	</div>
</div>
</form>

<form action="/store/customer/searchresult">
<input type="hidden" name="searchKeyword" value=""/>
 <div class="col">
    <div class="tabs">
      <div class="tab">
        <input class="mainCategoryradio" type="radio" id="maincategory1" name="mainCategory" value="김밥류">
        <label class="tab-label" for="maincategory1">김밥류</label>
        <div class="tab-content">
        	<!-- <a href="/store/customer/searchresult?mainCategory=김밥류&subCategory=삼각김밥&searchKeyword=">삼각김밥</a> -->
          <button class="accordionbutton" name="subCategory" value="삼각김밥">삼각김밥</button>
          <button class="accordionbutton" name="subCategory" value="줄김밥">줄김밥</button>
	      <button class="accordionbutton" name="subCategory" value="주먹밥">주먹밥</button>
        </div>
      </div>
	      
	  <div class="tab">
        <input class="mainCategoryradio" type="radio" id="maincategory2" name="mainCategory" value="도시락류">
        <label class="tab-label" for="maincategory2">도시락류</label>
        <div class="tab-content">
          <button class="accordionbutton" name="subCategory" value="도시락일반">도시락일반</button>
          <button class="accordionbutton" name="subCategory" value="도시락샐러드">도시락샐러드</button>
        </div>
      </div>
      
      <div class="tab">
        <input class="mainCategoryradio" type="radio" id="maincategory3" name="mainCategory" value="빵류">
        <label class="tab-label" for="maincategory3">빵류</label>
        <div class="tab-content">
          <button class="accordionbutton" name="subCategory" value="일반빵">일반빵</button>
          <button class="accordionbutton" name="subCategory" value="핫도그">핫도그</button>
          <button class="accordionbutton" name="subCategory" value="샌드위치">샌드위치</button>
        </div>
      </div>
      
      <div class="tab">
        <input class="mainCategoryradio" type="radio" id="maincategory4" name="mainCategory" value="즉석요리">
        <label class="tab-label" for="maincategory4">즉석요리</label>
        <div class="tab-content">
          <button class="accordionbutton" name="subCategory" value="튀김">튀김</button>
        </div>
      </div>
      
      <div class="tab">
        <input class="mainCategoryradio" type="radio" id="maincategory5" name="mainCategory" value="완제품">
        <label class="tab-label" for="maincategory5">완제품</label>
        <div class="tab-content">
          <button class="accordionbutton" name="subCategory" value="박스류">박스류</button>
        </div>
      </div>
      
      <div class="tab">
        <input class="mainCategoryradio" type="radio" id="maincategory6" name="mainCategory" value="유제품류">
        <label class="tab-label" for="maincategory6">유제품류</label>
        <div class="tab-content">
          <button class="accordionbutton" name="subCategory" value="우유">우유</button>
          <button class="accordionbutton" name="subCategory" value="요거트">요거트</button>
          <button class="accordionbutton" name="subCategory" value="요구르트">요구르트</button>
        </div>
      </div>
      
      
      <div class="tab">
        <input class="mainCategoryradio" type="radio" id="maincategory7" name="mainCategory">
        <label for="maincategory7" class="tab-close">닫기 &times;</label>
      </div>
    </div>
  </div>
</form>

</body>
</html>