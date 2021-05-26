<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${managerDTO}" />
<c:set var="list" value="${enrolledList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>등록된 임박 상품</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/manager/css/manager.css" rel="stylesheet">
<link
	href="${app}/resources/manager/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${app}/resources/manager/js/jquery-3.6.0.min.js"></script>
</head>
</head>
<body>
<!-- 전체 컨테이너 입니다.  -->
<div id='container'>
	<!-- 카테고리 바입니다. -->
    <div id='box-left'>
		<jsp:include page="/WEB-INF/views/manager/fragment/categorybar.jsp" flush="true" />
    </div>
    <!-- 프로필 바입니다. -->
    <div id='box-center'>
		<jsp:include page="/WEB-INF/views/manager/fragment/profilebar.jsp" flush="true" />
    </div>
    <div id='box-right'>
   	<form>
 		<div id="product-search-box">
   			<div class="row">
	   			<div class="col-md-5">
	    			<h3>등록된 상품 리스트</h3>
	       		</div>
	       		<div class="col-md-2">
	       		<select name="searchCondition">
				<option value="name"
					<c:if test="${searchDTO.searchCondition == 'name'}"> selected </c:if>
				>상품명</option>
				<option value="maincategory"
					<c:if test="${searchDTO.searchCondition == 'maincategory'}"> selected </c:if>
				>대분류</option>
				<option value="subcategory"
					<c:if test="${searchDTO.searchCondition == 'subcategory'}"> selected </c:if>
				>세분류</option>
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
   		<hr style="border: solid 3px #1b4af5;">
  		<c:forEach var="product" items="${list}" varStatus="status">
	    	<div id="list-box">
	    		<div class="row">
	    			<div class='col-sm-4'>
	  					<img src='${app}/resources/manager/img/favicon.png' alt='havetochange' />
	  				</div>
	  				<div class='col-sm-6'>
		    				<h6>상품명 : ${product.name}<br/></h6>
		    				<h6>상품코드 : ${product.productcode}<br/></h6>
		    				<h6 style="color:blue">등록여부 : o<br/></h6>
		    				<h6>제조날짜 : <f:formatDate value="${product.warehousingdate}" pattern="yyyy-MM-dd HH:00:00" /><br/></h6>
		    				<h6>유통만료기한 : <f:formatDate value="${product.expirationdate}" pattern="yyyy-MM-dd HH:00:00" /><br/></h6>
		    				<h6 style="color:blue">등록 시점 남은시간 : ${product.enrolledlefttime}시간<br/></h6>
		    				<h6 style="color:red">현재 남은시간 : ${product.countTime}시간<br/></h6>
		    				<h6>원가 : ${product.price}원<br/></h6>
		    				<h6 style="color:blue">등록가 : ${product.enrolledprice}원<br/></h6>
		    				<h6 style="color:red">현재 할인가 : ${product.discountPrice}원<br/></h6>
		    				<h6 style="color:red">현재 할인률 : ${product.discountRate}%<br/></h6>
		    		</div>
		    		<div class='col-sm-2'>
	    				<a href="cancelAction?pg=${pagingDTO.pg}&no=${product.no}&discountPrice=${product.discountPrice}&countTime=${product.countTime}&from=enrolledPage" class="btn_cancel">취소</a>
		    		</div>
	    		</div>
	   		</div>
    		<hr>
    	</c:forEach>
    	<div class="row">
    		<div class='col-md-5'></div>
   			<div class='col-md-5'>
				<c:if test="${pagingDTO.startPage == 1}">
				<a class="btn btn-default">Previous</a>
				</c:if>
				<c:if test="${pagingDTO.startPage != 1}">
				<a href="enrolled?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${pagingDTO.startPage-1}" class="btn btn-default">Previous</a>
				</c:if>
				
				<c:forEach var="i" begin="${pagingDTO.startPage}" end="${pagingDTO.endPage}">
				<c:if test="${pagingDTO.pg == i}">
				<a href="#" class="btn btn-warning">${i}</a>
				</c:if>
				<c:if test="${pagingDTO.pg != i}">
				<a href="enrolled?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${i}" class="btn btn-warning">${i}</a>
				</c:if>
				</c:forEach>
				
				
				<c:if test="${pagingDTO.endPage == pagingDTO.totalPage}">
				<a class="btn btn-default">Next</a>
				</c:if>
				<c:if test="${pagingDTO.endPage != pagingDTO.totalPage}">
				<a href="enrolled?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${pagingDTO.endPage+1}" class="btn btn-default">Next</a>
				</c:if>
			</div>
		</div>
   		
    </div>
</div>
</body>
</html>