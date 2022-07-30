<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header2</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/hHotel/resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="/hHotel/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/hHotel/resources/js/home.js">

<script type="text/javascript">

var today = new Date();   

var year = today.getFullYear(); // 년도
var month = today.getMonth() + 1;  // 월
var date = today.getDate();  // 날짜
var day = today.getDay();  // 요일
var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
var bak = 1;
var adult = 1;
var child = 0;

$(document).ready(function() {
	$('#loginBtn').click(function() {
		$(location).attr('href', 'login');
	});
	
	$('#joinBtn').click(function() {
		$(location).attr('href', 'join');
	});
	
	$('#resvCkBtn').click(function() {
		$(location).attr('href', 'home');
		alert('로그인 하세요.');
	});

	$('#btnResv').click(function() {
		$(location).attr('href', 'reserve');
	});
	
	$('#resvBtn').click(function() {
		$('#resvWindow').html(
				+ '<table>'
				+ '<button id="btnRsev"><tr>'
				+ '<td>  체크인     |    체크아웃   <br/>'
				+ month +'.' + date + week[day] + '   ' + bak+'박   ' + month + '.' + (date + 1) + week[day + 1] + '</td>'
				+ '<td> 성인     |    어린이  <br/>'
				+ adult + '    ' + child
				+ '</td>'
				+ '<td><input type="datetime-local" id="currentDateTime"/></td>'
				+ '</tr></button>'
				+ '<table>');
	});

	$( "#btnRsev" ).click(function() {
		var resvWindow = $('resvWindow').val();
		$.ajax({
			type:'POST',
			url:'reserve',
			data:{adult : adult, child : child},
		})
/* 		var a = $('#ad').val();
		var b = $('#ch').val();
		  $.post( "reserve", 
		  	{adult : a, child : b}); */
	});
	 
});

/* document.getElementById('currentDateTime').value= new Date().toISOString().slice(0, 10); */
</script>

</head>
<body>
<script src="/hHotel/resources/js/bootstrap.min.js"></script>
<div class="container">
	<div id="div-align-center">
		<h2>hHotel</h2>
		<button type="button" id="resvBtn" class="btn btn-light">객실 예약</button>
		<button type="button" id="btnResv" class="btn btn-light">객실 예약</button>
		<button type="button" class="btn btn-light">객실 예약</button>
		<button type="button" class="btn btn-light">객실 예약</button>
	</div>
</div>
</body>
</html>