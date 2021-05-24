<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${managerDTO}" />
<c:set var="list" value="${allList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>지점 관리 화면</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/manager/css/manager.css" rel="stylesheet">
<link
	href="${app}/resources/manager/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/manager/js/jquery-3.6.0.min.js"></script>
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
	    			<h3>마이 점포 전상품 리스트</h3>
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
   		<hr style="border: solid 3px #1b4af5;">
  		<c:forEach var="product" items="${list}">
	    	<div id="list-box">
	    		<div class="row">
	    			<div class='col-sm-4'>
	  					<img src='${app}/resources/manager/img/favicon.png' alt='havetochange' />
	  				</div>
	  				<div class='col-sm-5'>
		    				상품명 : ${product.name}<br/>
		    				상품코드 : ${product.productcode}<br/>
		    				등록여부 : ${product.enrollment}<br/>
		    				제조날짜 : <f:formatDate value="${product.warehousingdate}" pattern="yyyy/MM/dd" /><br/>
		    				유통만료기한 : <f:formatDate value="${product.expirationdate}" pattern="yyyy/MM/dd" /><br/>
		    				남은일수/남은시간 : ${product.leftDay}일 / ${product.leftTime}시간<br/>
		    				원가 : ${product.price}<br/>
		    		</div>
		    		<div class='col-sm-3'>
		    			<c:if test='${product.enrollment == 1}'>
		    				<input type="submit" name="btn_enrollment" value="등록"/>
		    			</c:if>
		    		</div>
	    		</div>
	   		</div>
    		<hr>
    	</c:forEach>
    	<div class="row">
    		<div class='col-md-5'></div>
   			<div class='col-md-5'>
				<c:if test="${pagingDTO.startPage == 1}">
				<a>Previous</a>
				</c:if>
				<c:if test="${pagingDTO.startPage != 1}">
				<a href="home?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${pagingDTO.startPage-1}">Previous</a>
				</c:if>
				
				<c:forEach var="i" begin="${pagingDTO.startPage}" end="${pagingDTO.endPage}">
				<c:if test="${pagingDTO.pg == i}">
				<a href="#">${i}</a>
				</c:if>
				<c:if test="${pagingDTO.pg != i}">
				<a href="home?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${i}">${i}</a>
				</c:if>
				</c:forEach>
				
				
				<c:if test="${pagingDTO.endPage == pagingDTO.totalPage}">
				<a>Next</a>
				</c:if>
				<c:if test="${pagingDTO.endPage != pagingDTO.totalPage}">
				<a href="home?searchCondition=${searchDTO.searchCondition}&searchKeyword=${searchDTO.searchKeyword}&pg=${pagingDTO.endPage+1}">Next</a>
				</c:if>
			</div>
		</div>
   	</form>
    </div>
</div>
</body>
</html>