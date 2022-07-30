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
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
	<div class="container-fluid">
	<form action="reserveDetail" method="post">
		<div class="row">
			<h3><p>객실예약 상세</p></h3>
		</div>
		<div class="row">
			<div class="borderContainer">
				<hr width = "100%" size = "3">
				<div class="col-sm-12"><p class="roomKind"><strong>${detailRoom.kinds}</strong></p>
				<div class="col-sm-12">
					<c:choose>
					  	<c:when test="${detailRoom.id == 1 || detailRoom.id == 2 || detailRoom.id == 3}">
							<img src="resources/images/deluxDouble.jpg" class="resvWindow-img" alt="delux" />
						</c:when>
						<c:when test="${detailRoom.id == 4 || detailRoom.id == 5 || detailRoom.id == 6}">
							<img src="resources/images/premiumDouble.jpg" class="resvWindow-img" alt="delux" />
						</c:when>
						<c:when test="${detailRoom.id == 7 || detailRoom.id == 8 || detailRoom.id == 9}">
							<img src="resources/images/premiumTwin.jpg" class="resvWindow-img" alt="delux" />
						</c:when>
						<c:when test="${detailRoom.id == 10 || detailRoom.id == 11 || detailRoom.id == 12}">
							<img src="resources/images/deluxSweetDouble.jpg" class="resvWindow-img" alt="delux" />
						</c:when>
						<c:when test="${detailRoom.id == 13 || detailRoom.id == 14 || detailRoom.id == 15}">
							<img src="resources/images/koreanSweet.jpg" class="resvWindow-img" alt="delux" />
						</c:when>
					</c:choose>
				</div>
				<div class="col-sm-12">
					<div class="innerContent">
					  객실이름 : ${detailRoom.kinds}<br/>수용인원 : ${detailRoom.pcapacity}<br/>
					  객실크기 : ${detailRoom.areasize}<br/>층 : ${detailRoom.floor}f<br/>전망 : ${detailRoom.prospect}<br/>
					  와이파이 :
					  <c:choose>
					  	<c:when test="${detailRoom.wifi == 1}">있음</c:when>
					  	<c:when test="${detailRoom.wifi == 0}">없음</c:when>
					  </c:choose>
				  </div>
			  </div>
			<input type="hidden" name="id" value="${detailRoom.id}" />
			<input type="hidden" name="checkIn" value="${resvCalendarDTO.checkIn}" />
			<input type="hidden" name="checkOut" value="${resvCalendarDTO.checkOut}" />
			<input type="submit" value="예약 하기" class="reserveBtn"/>
		  </div>
		</div>
	</form>
	</div>
</body>
</html>