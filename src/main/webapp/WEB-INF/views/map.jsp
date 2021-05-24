<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="kakaokey" value="d5d4850376504cbcd111fa1f434f605e"/>
<c:set var="quizboardDTO" value="${quizboardDTO }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="" href="">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>

<style>
	body{background-color :lightyellow;}
	#container_1{text-align: center;}
	#container_2{text-align: center;}
	#map{display: inline-block;}
	#headline_1{text-align: center;}
	#headline_2{text-align: center;}



<!--닫기 css 테스트 --> 
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaokey }"></script>
<body>
	<h1 id="headline_1">카카오맵</h1>
	<div id=container_1>
		<div id="map" style="width:100%; height:400px;"></div>
	</div>
	<div id="container_2">
		<div id="cvsProductList">
			<h1 id="headline_2">cvsProductList</h1>
			
		</div>
	</div>
	
	<div>
		<p>
		    <button onclick="hideMarkers()">마커 감추기</button>
		    <button onclick="showMarkers()">마커 보이기</button>
		</p> 
	</div>
	
	<div>
		<button onclick="myGeoLocation()" >내 위치받기</button>
	    <ul>
	        <li>위도:<span id="latitude"></span></li>
	        <li>경도:<span id="longitude"></span></li>
	    </ul>
	</div>

</body>
</html>


<!--===================================================================================
										JS영역
====================================================================================-->
<!-- 카카오api 기본 설정 -->
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
			//내위치로 지도 표시 할 것
	    center: new kakao.maps.LatLng(37.65465,	127.04563), // 지도의 중심좌표
	    level: 6// 지도의 확대 레벨
	};

	//커스텀 오버레이에 표시할 컨텐츠 입니다
	//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	//별도의 이벤트 메소드를 제공하지 않습니다 

	         
     var contents=[
    	 {
    		 name : 'GS25 방학효성점',
    		 address : '도봉구 방학로 171'
    		 
    	 },
    	 {
    		 name :'GS25 도봉북서울점',
    		 address : '도봉구 도봉로177길 26'
    		 
    	 },
    	 {
    		 name :'GS25 도봉창동점',
    		 address : '도봉구 노해로 269'
    		 
    	 },
    	 {
    		 name :'GS25 방학로',
    		 address : '도봉구 방학로 33'
    		 
    	 },
    	 {
    		 name :'GS25 쌍문선덕점',
    		 address : '도봉구 해등로 255'
    		 
    	 },
    	 {
    		 name :'GS25 창동그린',
    		 address : '도봉구 노해로63다길 41'
    		 
    	 },
    	 {
    		 name :'GS25 창동시티점',
    		 address : '도봉구 덕릉로 250'
    		 
    	 },
    	 {
    		 name :'GS25 창동사랑점',
    		 address : '도봉구 노해로69길 26' 
    	 }
     ];
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	//cvsotre에서 데이터를 가져와 
	var positions = [
		{
		    content: '<div>GS25 방학효성점</div>', 
		    latlng: new kakao.maps.LatLng(37.66213, 127.03323)
		},
		{
		    content: '<div>GS25 도봉북서울점</div>', 
		    latlng: new kakao.maps.LatLng(37.68181, 127.04474)
		},
		{
		    content: '<div>GS25 도봉창동점	</div>', 
		    latlng: new kakao.maps.LatLng(37.65162,	127.03798)
		},
		{
		    content: '<div>GS25 방학로	</div>', 
		    latlng: new kakao.maps.LatLng(37.6621,	127.04855)
		},
		{
		    content: '<div>GS25 쌍문선덕점	</div>', 
		    latlng: new kakao.maps.LatLng(37.65733,	127.02821)
		},
		{
		    content: '<div>GS25 쌍문한솔점	</div>', 
		    latlng: new kakao.maps.LatLng(37.65231,	127.03453)
		},
		{
		    content: '<div>GS25 창동그린	</div>', 
		    latlng: new kakao.maps.LatLng(37.65465,	127.04563)
		},
		{
		    content: '<div>GS25 창동사랑점	</div>', 
		    latlng: new kakao.maps.LatLng(37.6397,	127.03934)
		}
	];
	
	
	
	// 마커
	
	//marker 담는 배열
	var  markerArr = new Array();

	for (var i = 0; i < positions.length; i ++) {
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    map: map, // 마커를 표시할 지도
		    position: positions[i].latlng // 마커의 위치
		});
		
		//마커를 배열에 삽입
		markerArr[i] = marker;
		
		
		// 마커에 표시할 인포윈도우를 생성합니다 
		var infowindow = new kakao.maps.InfoWindow({
		    content: positions[i].content // 인포윈도우에 표시할 내용
		});
		
		// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		// 이벤트 리스너로는 클로저를 만들어 등록합니다 
		// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	 
	
	
	
	// 인포윈도우

	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
		return function() {
		    infowindow.open(map, marker);
		};
	}

	//인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
		return function() {
		    infowindow.close();
		};
	}
	
	
	// 커스텀오버레이
	
	// 커스텀오버레이 담는배열
	var  overlayArr = new Array();
	
	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다

	for(var i = 0; i < contents.length; i++){
		
	 	var content = '<div class="wrap">' + 
	    '    <div class="info">' + 
	    '        <div class="title">' + 
	                   contents[i].name  + 
	    '            <div class="close" onclick="closeOverlay('+ i +')" title="닫기"></div>' + 
	    '        </div>' + 
	    '        <div class="body">' + 
	    '            <div class="img">' +
	    '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
	    '           </div>' + 
	    '            <div class="desc">' + 
	    '                <div class="ellipsis">'+ contents[i].address +'</div>' + 
	    '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">상품바로가기</a></div>' + 
	    '            </div>' + 
	    '        </div>' + 
	    '    </div>' +    
	    '</div>';
	    
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: markerArr[i].getPosition()       
		});
		
		//커스텀오버레이 배열에 삽입 
		overlayArr[i] = overlay;
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(markerArr[i],'click',openOverlay(overlay,map))
		
	}
	
	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	function openOverlay(overlay,map){
		return function(){
			overlay.setMap(map);
		}
		
	}
	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay(idx) {
	    overlayArr[idx].setMap(null);     
	}
	
	
	<!-- 마커 보이기/감추기 -->
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markerArr.length; i++) {
	    	markerArr[i].setMap(map);
	    }            
	}
	
	//"마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(map)    
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	    setMarkers(null);    
	}

</script>
<!-- 카카오api 기본 설정 end -->

<!-- 내 위치 받아오는 js -->
<script>
    function myGeoLocation() {        
        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition (function(pos) {
                $('#latitude').html(pos.coords.latitude);     // 위도
                $('#longitude').html(pos.coords.longitude); // 경도
            });
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
    }
</script>
<!-- 내 위치 받아오는 js end-->

<!-- ajax 영역 -->
<script type="text/javascript">
	$(function() {
		var productListAjax = $.ajax({
			type:"get",
	        datatype:"json",
	        url:"${app}/manager/allList/",
	        success:function (data){
	        	var v_loadPage ="";
	        	//document.getElementById('loadUrl').setAttribute("action", "${app}/manager/test");
	            for(var i in data){
		            v_loadPage += "<hr><div class='col-sm-5'>";
		            v_loadPage += "<img src='${app}/resources/manager/img/favicon.png' alt='havetochange' />";
			    	v_loadPage += "</div>";
			    	v_loadPage += "<div class='col-sm-5'>";
			    	v_loadPage += "상품명: " + data[i].name+"<br>";
			    	v_loadPage += "상풍코드: " + data[i].productcode+"<br>";
			    	v_loadPage += "세부분류: " + data[i].subcategory+"<br>";
			    	v_loadPage += "유통기간: " + data[i].productperiod+"<br>";
		    		v_loadPage += "할인가: " + data[i].price+"<br>";
		    		v_loadPage += "<input type='submit' />";
			    	v_loadPage += "</div>";
	            }
	            
	            $("#cvsProductList").html(v_loadPage);
	        }
		});
	});
</script>


<!-- ajax 영역end -->
<!--===================================================================================
										JS영역 END
====================================================================================-->