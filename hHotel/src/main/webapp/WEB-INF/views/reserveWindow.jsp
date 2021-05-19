<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="raList" value="${resvAvaiList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약창2</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/hHotel/resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
	<%-- <jsp:include page="/WEB-INF/views/fragments/header2.jsp" flush="true" /> --%>
	<div class="container">
		<form action="reserveAction" method="post">
			<div class="container-fluid">
					<h3><p>객실 예약</p></h3>
			</div>
			<hr width = "100%" size = "3">
			<c:forEach var="dto" items="${raList}">
				<div class="row">
					<div class='col-sm-6'>
						<div class="roomInfoRight">
						<%-- ${dto.id} --%>
						<a href="reserveDetail?id=${dto.id}&checkIn=${checkIn}&checkOut=${checkOut}">
							${dto.kinds}</a><br />
						<img src="/hHotel/resources/images/delux-double.jpg" class="resvWindow-img" alt="delux" />
						</div>
					</div>
					<div class='col-sm-6'>
						<div class="roomInfoRight">
							수용 가능 인원 : ${dto.pcapacity}<br /> 면적 : ${dto.areasize}<br />
							층 : ${dto.floor}f<br /> 전망 : ${dto.prospect}<br /> 
							와이파이 : 
							<c:choose>
							  	<c:when test="${dto.wifi == 1}">있음</c:when>
							  	<c:when test="${dto.wifi == 0}">없음</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				<hr width = "100%" size = "3">
			</c:forEach>
		<input type="hidden" name="checkIn" value="${checkIn}" />
		<input type="hidden" name="checkOut" value="${checkOut}" />
	</form>
	</div>
</body>
</html>