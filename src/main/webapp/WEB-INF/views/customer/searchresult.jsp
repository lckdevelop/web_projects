<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<c:set var="cvstoreList" value="${cvstoreList}" />
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
    	<div>
    		<label>${searchKeyword} 연관 리스트입니다.</label>
    	</div>
    	<div id="accordion">
    		<%-- <c:forEach var="cvstore" items="${cvstoreList}">
    			<h3>${cvstore.name}</h3>
				<div>
    				<p></p>
  				</div>
    		</c:forEach> --%>
    		<h3><a>CU</a></h3>
			<div>
    			<a>${searchKeyword}</a>
  			</div>
  			<h3><a>GS25</a></h3>
			<div>
    			<a>${searchKeyword}</a>
  			</div>
  			<h3><a>세븐일레븐</a></h3>
			<div>
    			<a>${searchKeyword}</a>
  			</div>
    	</div>
    </div>
</div>
</body>
</html>