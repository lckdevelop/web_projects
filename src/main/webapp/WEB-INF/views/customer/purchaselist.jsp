<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>ThankStore 메인</title>
<!-- Google Fonts -->

<!-- *************** CSS START *************** -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/customer/css/customer.css" rel="stylesheet">
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet">
<!-- accordion css -->
<link 
	href="${app}/resources/customer/css/accordion.css" rel="stylesheet">
	
<!-- *************** CSS END *************** -->

<!-- *************** JavaScript START *************** -->
<!-- jquery 경로 -->

<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" 
	src="${app}/resources/customer/js/accordion.js"></script>	

<!-- *************** JavaScript End *************** -->
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
    <div id='box-right'>
	    <button class="accordion" id="category1">Section 1</button>
			<div class="panel" >
				    <!-- chl={데이터}+{}+{} 이런식으로 수정하면 됨 -->
				<img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=customername+storecode+ProductName&choe=UTF-8"/>
			  	<p>Hello World!</p>
			</div>
	    
	    <button class="accordion" id="category2">Section 2</button>
			<div class="panel" id="category2">
			  	<p>Hello World~~~</p>
			</div>
			
	    <button class="accordion" id="category3">Section 3</button>
			<div class="panel" id="category3">
			  <p>왜안돼</p>
			</div>

	    
    </div>
</div>


</body>
</html>