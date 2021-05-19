<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cki" value="value" />
<c:set var="cki" value="value" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 상세보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/hHotel/resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
	<div class="container-fluid">
	<form action="reserveAction" method="post">
		<div class="row">
			<h1><p>객실예약 상세</p></h1>
		</div>
		
		<div class="row">
			<div class="borderContainer">
				<hr width = "100%" size = "3">
				<div class="col-sm-12"><h3><strong>${rmDTO.kinds}</strong></h3></div>
				<div class="col-sm-12"><img src="/hHotel/resources/images/delux-double.jpg" class="resvDetail-img" alt="delux" /></div>
				<div class="col-sm-12">
					<div class="innerContent">
					  객실이름 : ${rmDTO.kinds}<br/>수용인원 : ${rmDTO.pcapacity}<br/>
					  객실크기 : ${rmDTO.areasize}<br/>층 : ${rmDTO.floor}f<br/>전망 : ${rmDTO.prospect}<br/>
					  와이파이 :
					  <c:choose>
					  	<c:when test="${rmDTO.wifi == 1}">있음</c:when>
					  	<c:when test="${rmDTO.wifi == 0}">없음</c:when>
					  </c:choose>
				  </div>
			  </div>
			<input type="hidden" name="id" value="${rmDTO.id}" />
			<input type="hidden" name="checkIn" value="${checkIn}" />
			<input type="hidden" name="checkOut" value="${checkOut}" />
			<input type="submit" value="예약" class="reserveBtn"/>
		  </div>
		</div>
		
	</form>
	</div>
</body>
</html>