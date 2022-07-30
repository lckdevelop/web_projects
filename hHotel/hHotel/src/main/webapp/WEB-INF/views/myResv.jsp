<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
	<form method="post" action="reserveCancel">
	<div class="container">
		<div class="container-fluid">
			<h3><p>나의 예약 현황</p></h3>
		</div>
		<hr width = "100%" size = "3">
		<c:forEach var="dto" items="${myResvList}">
			<div class="row">
				<div class='col-sm-6'>
					<div class="roomInfoRight">
					<%-- ${dto.id} --%>
						${dto.kinds}<br />
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
				<div class="row">
					<div class='col-sm-6'>
						<div class="div-date">
							<strong>체크인 : ${dto.strdate} ~</strong>
							<strong> 체크아웃 : ${dto.enddate}</strong>
						</div>
					</div>
					<div class='col-sm-6'>
						<input type="submit" value="예약 취소" class="reserveCancelBtn"/>
					</div>
				</div>
			</div>
			<hr width = "100%" size = "3">
			<input type="hidden" name="resvId" value="${dto.id}" />
		</c:forEach>
		<input type="hidden" name="checkIn" value="${checkIn}" />
		<input type="hidden" name="checkOut" value="${checkOut}" />
	</div>
	</form>
</body>
</html>