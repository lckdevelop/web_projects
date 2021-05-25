<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<c:set var="cvstoreList" value="${cvstoreList}" />
<c:set var="searchDTO" value="${searchDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>ThankStore 검색결과</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/customer/css/customer.css" rel="stylesheet">
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>

<!-- 아코디언  -->
<link rel="stylesheet" type="text/css" href="/META-INF/resources/webjars/jquery-ui/1.12.1/jquery-ui.min.css" />
<script type="text/javascript" src="/META-INF/resources/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<!-- 아코디언 끝 -->
	
<!-- accordion -->
<script>
  $( function() {
    $( "#accordion" ).accordion({
    	header: "> h3",
        collapsible: false,
        active: 0
    });
    	
    
  } );
  
  function mainCategoryChange(mainCategory){
	  
  }
</script>
</head>
<body>
<!-- 전체 컨테이너 입니다.  -->
<div id='container'>
	<!-- 카테고리 바입니다. -->
    <div id='box-left'>
		<jsp:include page="/WEB-INF/views/customer/fragment/categorybar.jsp" flush="true" />
    </div>
    <!-- 프로필 바입니다. -->
    <div id='box-center'>
		<jsp:include page="/WEB-INF/views/customer/fragment/profilebar.jsp" flush="true" />
    </div>
    <!-- 검색결과 입니다. -->
    <div id='box-right'>
    <form>
 		<div id="product-search-box">
   			<div class="row">
	   			<c:if test="${searchDTO.mainCategory != '' && searchDTO.mainCategory != null}">
	   			<div class="col-md-5">
	    			<h3>${searchDTO.mainCategory} 카테고리 조회</h3>
	       		</div>
	   			</c:if>
	   			<c:if test="${searchDTO.searchKeyword != '' && searchDTO.searchKeyword != null}">
	   			<div class="col-md-5">
	    			<h3>${searchDTO.searchKeyword} 연관 검색결과</h3>
	       		</div>
	   			</c:if>
	   			
	       		
	       		<!-- 대분류 -->
	       		<div class="col-md-2">
	       		<span>대분류</span>
	       		<select name="mainCategory">
	       		<option value=""
					<c:if test="${searchDTO.mainCategory == '' || searchDTO.mainCategory == null}"> selected </c:if>
				>전체</option>
				<option value="김밥류"
					<c:if test="${searchDTO.mainCategory == '김밥류'}"> selected </c:if>
				>김밥류</option>
				<option value="도시락류"
					<c:if test="${searchDTO.mainCategory == '도시락류'}"> selected </c:if>
				>도시락류</option>
				<option value="빵류"
					<c:if test="${searchDTO.mainCategory == '빵류'}"> selected </c:if>
				>빵류</option>
				<option value="즉석요리"
					<c:if test="${searchDTO.mainCategory == '즉석요리'}"> selected </c:if>
				>즉석요리</option>
				<option value="완제품"
					<c:if test="${searchDTO.mainCategory == '완제품'}"> selected </c:if>
				>완제품</option>
				<option value="유제품류"
					<c:if test="${searchDTO.mainCategory == '유제품류'}"> selected </c:if>
				>유제품</option>
				</select>
	       		</div>
	       		
	       		<!-- 세분류 -->
	       		<div class="col-md-2">
	       		<span>세분류</span>
	       		<select name="subCategory">
	       		<c:if test="${searchDTO.mainCategory == '' || searchDTO.mainCategory == null }">
	       			<option value=""
					<c:if test="${searchDTO.subCategory == '' || searchDTO.subCategory == null}"> selected </c:if>
					>전체</option>
					<option value="삼각김밥"
						<c:if test="${searchDTO.subCategory == '삼각김밥'}"> selected </c:if>
					>삼각김밥</option>
					<option value="줄김밥"
						<c:if test="${searchDTO.subCategory == '줄김밥'}"> selected </c:if>
					>줄김밥</option>
					<option value="주먹밥"
						<c:if test="${searchDTO.subCategory == '주먹밥'}"> selected </c:if>
					>주먹밥</option>
					<option value="도시락일반"
						<c:if test="${searchDTO.subCategory == '도시락일반'}"> selected </c:if>
					>도시락일반</option>
					<option value="도시락샐러드"
						<c:if test="${searchDTO.subCategory == '도시락샐러드'}"> selected </c:if>
					>도시락샐러드</option>
					<option value="일반빵"
						<c:if test="${searchDTO.subCategory == '일반빵'}"> selected </c:if>
					>일반빵</option>
					<option value="핫도그"
						<c:if test="${searchDTO.subCategory == '핫도그'}"> selected </c:if>
					>핫도그</option>
					<option value="샌드위치"
						<c:if test="${searchDTO.subCategory == '샌드위치'}"> selected </c:if>
					>샌드위치</option>
					<option value="튀김"
						<c:if test="${searchDTO.subCategory == '튀김'}"> selected </c:if>
					>튀김</option>
					<option value="박스류"
						<c:if test="${searchDTO.subCategory == '박스류'}"> selected </c:if>
					>박스류</option>
					<option value="우유"
						<c:if test="${searchDTO.subCategory == '우유'}"> selected </c:if>
					>우유</option>
					<option value="요거트"
						<c:if test="${searchDTO.subCategory == '요거트'}"> selected </c:if>
					>요거트</option>
					<option value="요구르트"
						<c:if test="${searchDTO.subCategory == '요구르트'}"> selected </c:if>
					>요구르트</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '김밥류'}">
	       			<option value="삼각김밥"
						<c:if test="${searchDTO.subCategory == '삼각김밥'}"> selected </c:if>
					>삼각김밥</option>
					<option value="줄김밥"
						<c:if test="${searchDTO.subCategory == '줄김밥'}"> selected </c:if>
					>줄김밥</option>
					<option value="주먹밥"
						<c:if test="${searchDTO.subCategory == '주먹밥'}"> selected </c:if>
					>주먹밥</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '도시락류'}">
	       			<option value="도시락일반"
						<c:if test="${searchDTO.subCategory == '도시락일반'}"> selected </c:if>
					>도시락일반</option>
					<option value="도시락샐러드"
						<c:if test="${searchDTO.subCategory == '도시락샐러드'}"> selected </c:if>
					>도시락샐러드</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '빵류'}">
	       			<option value="일반빵"
						<c:if test="${searchDTO.subCategory == '일반빵'}"> selected </c:if>
					>일반빵</option>
					<option value="핫도그"
						<c:if test="${searchDTO.subCategory == '핫도그'}"> selected </c:if>
					>핫도그</option>
					<option value="샌드위치"
						<c:if test="${searchDTO.subCategory == '샌드위치'}"> selected </c:if>
					>샌드위치</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '즉석요리'}">
	       			<option value="튀김"
						<c:if test="${searchDTO.subCategory == '튀김'}"> selected </c:if>
					>튀김</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '완제품'}">
	       			<option value="박스류"
						<c:if test="${searchDTO.subCategory == '박스류'}"> selected </c:if>
					>박스류</option>
	       		</c:if>
	       		<c:if test="${searchDTO.mainCategory == '유제품류'}">
	       			<option value="우유"
						<c:if test="${searchDTO.subCategory == '우유'}"> selected </c:if>
					>우유</option>
					<option value="요거트"
						<c:if test="${searchDTO.subCategory == '요거트'}"> selected </c:if>
					>요거트</option>
					<option value="요구르트"
						<c:if test="${searchDTO.subCategory == '요구르트'}"> selected </c:if>
					>요구르트</option>
	       		</c:if>
				</select>
	       		</div>
	       		
	       		<div class="col-md-3">
	    			<input type="text" name="searchKeyword" class="form-control" value="${searchDTO.searchKeyword}" placeholder="Search" />
	    		</div>
	    		<div class="col-md-2">
	       			<input type="submit" class="btn btn-default" value="submit"></input>
	     		</div>
     		</div>
   		</div>
 	</form>
    	
    	<div id="accordion">
    		
    	</div>
    </div>
</div>
</body>
</html>