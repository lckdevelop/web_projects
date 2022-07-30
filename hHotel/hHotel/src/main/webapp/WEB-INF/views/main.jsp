<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%-- 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
</head>
<body>
<script type="text/javascript" src="/hHotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="/hHotel/resources/js/bootstrap.min.js"></script>
<div class="container">
  <div class="center-block">
  <div class="bg-primary center-block" style="width: 300px;padding:15px;">가운데 정렬하기</div>
  </div>
</div>
<div class="container">

	<h2>블록을 가운데로 정렬하기</h2>

	<div class="center-block" style="width: 300px;padding:15px;">너비가 픽스되지 않으면 너비가 100%가 기본으로 적용되어 정렬 안됨</div>
	<p class="bg-primary center-block" style="width: 300px;padding:15px;">가운데 정렬하기</p>
	<h1 class="text-hide">Custom heading</h1>

</div>

<span class="label label-default">Default</span>
<span class="label label-primary">Primary</span>
<span class="label label-success">Success</span>
<span class="label label-info">Info</span>
<span class="label label-warning">Warning</span>
<span class="label label-danger">Danger</span>
</body>
</html> --%>

<!-- <!DOCTYPE html>
<html>
    <head>
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
        <style type="text/css">
            .rolling_panel { position: relative; width: 625px; height: 150px; margin: 0; padding: 0; border: 1px solid #c7c7c7; overflow: hidden; }
            .rolling_panel ul { position: absolute; margin: 5px; padding: 0; list-style: none; }
            .rolling_panel ul li { float: left; width: 205px; height: 140px;}
        </style>
    </head>
    <body>
        <a href="javascript:void(0)" id="prev">이전</a>
        <a href="javascript:void(0)" id="next">다음</a>
        <div class="rolling_panel">
            <ul>
                <li><img src="/hHotel/resources/images/mainBanner1.jpg"></li>
                <li><img src="/hHotel/resources/images/mainBanner1.jpg"></li>
                <li><img src="/hHotel/resources/images/mainBanner1.jpg"></li>
                <li><img src="/hHotel/resources/images/mainBanner1.jpg"></li>
                <li><img src="/hHotel/resources/images/mainBanner1.jpg"></li>
            </ul>
        </div>
 
        <script type="text/javascript">
            $(document).ready(function() {
 
                var $panel = $(".rolling_panel").find("ul");
 
                var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
                var itemLength = $panel.children().length;      // 아이템 수
 
                // Auto 롤링 아이디
                var rollingId;
 
                auto();
 
                // 배너 마우스 오버 이벤트
                $panel.mouseover(function() {
                    clearInterval(rollingId);
                });
 
                // 배너 마우스 아웃 이벤트
                $panel.mouseout(function() {
                    auto();
                });
 
                // 이전 이벤트
                $("#prev").on("click", prev);
 
                $("#prev").mouseover(function(e) {
                    clearInterval(rollingId);
                });
 
                $("#prev").mouseout(auto);
 
                // 다음 이벤트
                $("#next").on("click", next);
 
                $("#next").mouseover(function(e) {
                    clearInterval(rollingId);
                });
 
                $("#next").mouseout(auto);
 
                function auto() {
 
                    // 2초마다 start 호출
                    rollingId = setInterval(function() {
                        start();
                    }, 2000);
                }
 
                function start() {
                    $panel.css("width", itemWidth * itemLength);
                    $panel.animate({"left": - itemWidth + "px"}, function() {
 
                        // 첫번째 아이템을 마지막에 추가하기
                        $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
 
                        // 첫번째 아이템을 삭제하기
                        $(this).find("li:first").remove();
 
                        // 좌측 패널 수치 초기화
                        $(this).css("left", 0);
                    });
                }
 
                // 이전 이벤트 실행
                function prev(e) {
                    $panel.css("left", - itemWidth);
                    $panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
                    $panel.animate({"left": "0px"}, function() {
                        $(this).find("li:last").remove();
                    });
                }
 
                // 다음 이벤트 실행
                function next(e) {
                    $panel.animate({"left": - itemWidth + "px"}, function() {
                        $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                        $(this).find("li:first").remove();
                        $(this).css("left", 0);
                    });
                }
            });
        </script>
    </body>
</html> -->

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
</head>
<body>
<script type="text/javascript" src="/hHotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="/hHotel/resources/js/bootstrap.min.js"></script>
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="/hHotel/resources/images/mainBanner1.jpg" style="width:100%">
  <div class="text">Caption One</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="/hHotel/resources/images/mainBanner1.jpg" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="/hHotel/resources/images/mainBanner1.jpg" style="width:100%">
  <div class="text">Caption Three</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

</body>
</html>

