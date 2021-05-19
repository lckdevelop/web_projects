<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hHotel에 오신것을 환영합니다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script type="text/javascript">

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
});

</script>

<script type="text/javascript">
$(document).ready(function(){
	var nowNum = 0;
	var bannerObj = $('.slideUl li');
	var maxLength = bannerObj.length;
	var timer = 5000; // 자동 롤링되는 타임 설정
	var autoRun = setInterval(function(){rollingFn('right');},timer);
	bannerObj.eq(nowNum).fadeIn();
	$('.nextBtn').bind('click',function(){
		rollingFn('right');
	});
	$('.prevBtn').bind('click',function(){
		rollingFn('left');
	});
	function rollingFn(direction){
		if(direction=='right'){
			nowNum = nowNum+1;
			if(nowNum>maxLength-1){
				nowNum = 0;
			}
		}else{
			nowNum = nowNum-1;
			if(nowNum<0){
				nowNum = maxLength-1;
			}
		}
		bannerObj.hide().eq(nowNum).fadeIn();
	}
});
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/fragments/header2.jsp" flush="true" />
<!-- <div class="container-fluid">
	<img src="resources/images/main.jpg" class="background" alt="메인 이미지">
</div> -->
<div style="margin-top:30px"></div>
<div class="slideWrap">
	<a href="#" class="prevBtn">&lt;</a>
	<ul class="slideUl">
		<li class="banner1">Welcome to hHotel</li>
		<li class="banner2">Wedding</li>
		<li class="banner3">Infinity Pool</li>
	</ul>
	<a href="#" class="nextBtn">&gt;</a>
</div>
</body>
</html>