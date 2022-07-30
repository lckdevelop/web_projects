<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="raList" value="${resvAvaviList}" />
<c:set var="nraList" value="${nResvAvaviList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약창2</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/fragments/header2.jsp" flush="true" />
<div class="container-fluid">
	<form action="reserveAction" method="post">
		<div class="container-align-box">
			<table border="1">
			<caption>예약 가능 객실 리스트</caption>
				<tr>
					<th>번호</th>
					<th>객실이름</th>
					<th>객실번호</th>
					<th>수용인원</th>
					<th>객실크기</th>
					<th>층</th>
					<th>전망</th>
					<th>와이파이</th>
				</tr>
				<c:forEach var="dto" items="${raList}">
					<tr>
						<td>${dto.id}</td>
						<td><a href="detail?no=${dto.id}">${dto.kinds}</a></td>
						<td>${dto.roomNo}</td>
						<td>${dto.pcapacity}</td>
						<td>${dto.areasize}</td>
						<td>${dto.floor}</td>
						<td>${dto.prospect}</td>
						<td>${dto.wifi}</td>
					</tr>
				</c:forEach>
				<c:forEach var="dto" items="${nraList}">
					<tr>
						<td>${dto.id}</td>
						<td><a href="detail?no=${dto.id}">${dto.kinds}</a></td>
						<td>${dto.roomNo}</td>
						<td>${dto.pcapacity}</td>
						<td>${dto.areasize}</td>
						<td>${dto.floor}</td>
						<td>${dto.prospect}</td>
						<td>${dto.wifi}</td>
					</tr>
				</c:forEach>
			</table>		
		</div>
	</form>
</div>
</body>
</html> --%>