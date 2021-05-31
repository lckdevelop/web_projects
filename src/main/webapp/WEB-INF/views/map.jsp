<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="kakaokey" value="d5d4850376504cbcd111fa1f434f605e"/>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="hash" value="${hash }"></c:set>
<c:set var="CvstoreDTO" value="${CvstoreDTO }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="" href="">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet">
<!-- accordion css -->
<link 
	href="${app}/resources/customer/css/accordion.css" rel="stylesheet">
	
<link 
	href="${app}/resources/customer/css/categoryaccordion.css" rel="stylesheet">
	
	
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
<!--내 위주 편의점보기 버튼 이벤트-->
window.onload = function () {
	document.getElementById("searchBtn").onclick = function () {
		  var cvStoreCnt = document.getElementById("cvStoreCnt").value;
		  cvsStoreCntAjax(cvStoreCnt);
		};
	};
<!--내 위주 편의점보기 버튼 이벤트 END-->	
	
<!--아코디언 JS -->
$(document).ready(function(){
	var acc = document.getElementsByClassName("accordion");
	
	for (var i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    }
	  });
}
});
<!--아코디언 JS END-->
</script>

	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>

<style>
<!-- 기본 CSS -->
	<!--body{background-color :lightyellow;}-->
	#container_1{text-align: center;}
	#container_2{text-align: center;}
	#map{display: inline-block;}
	#headline_1{text-align: center;}
	#headline_2{text-align: center;}
<!-- 기본 CSS END -->


<!-- 카카오 CSS -->
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 5px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {max-width: 100%;; height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
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
    .info .link {color: #5085BB; }
<!-- 카카오 CSS END -->

<!-- 아코디언 CSS -->
	  #ac_ul .menu_1 a{
         background-color: #000;
         color:#fff;
      }
      #ac_ul .menu_1.on{
         background-color:red;
      }
      #ac_ul .menu_2{
         display:none;
      }
      #ac_ul .menu_2 a{
         background-color:#ccc;
         color:blue;
      }
      #ac_ul .menu_2 a:hover{
         background-color:rgba(0, 0, 0, 0.500);
      }
<!-- 아코디언 CSS END-->     
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaokey }"></script>
<body>
	<div id="mainContainer">
		<div id=container_1>
			<div id="map" style="width:100%; height:600px;"></div>
		</div>
		<div id="contaniner_2">
			<p>
			    <button  onclick="hideMarkers()">편의점 감추기</button>
			    <button  onclick="showMarkers()">검색했던 편의점 모두 보기</button>
			    <br/>
			    <br/>
			    
				  <label for="cvStore">편의점 개수 지정:</label>
				  <select name="cvStoreCnt" id="cvStoreCnt">
				    <option value="10">10</option>
				    <option value="30">30</option>
				    <option value="50">50</option>
				    <option value="100">100</option>
				  </select>
				  
				  <button id ="searchBtn" >내 위주 편의점보기</button>
			</p> 
		</div>
		
		<div id="container_3">
			<div id="cvsProductList">
				
				
			</div>
		</div>
	</div>

</body>
</html>


<!--===================================================================================
										JS영역
====================================================================================-->
<!-- 카카오api 기본 설정 -->

<script>

<!-- 변수 선언 영역 -->
//위도
var lat ;
//경도
var lon ;
// 나한테 제일 가까운 10개 편의점 배열
var cvsArr = new Array();
// positions 배열
var positions  = [];
// contents
var contents = [];
// 커스텀오버레이 담는배열
var  overlayArr = new Array();
//marker 담는 배열
var  markerArr = new Array();
<!-- 변수 선언 영역 END -->

	// 지도의 확대 레벨 여기서 조정 할 것!
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
		//내위치로 지도 표시 할 것
	    center: new kakao.maps.LatLng(0,0), // 지도의 중심좌표
	    level: 5// 지도의 확대 레벨
	};

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        	lat = position.coords.latitude; // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:10px;  background-color: #ff8a3d;"><strong>여기에 계시는군요?</strong></div>'; // 인포윈도우에 표시될 내용입니다
		        	
		            console.log("lat : " + lat);
		        	console.log("lon : " + lon);
		        	console.log("cvStoreCnt : " + cvStoreCnt);
		        	
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
			});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = '현재 위치를 받아올 수 없습니다.'
		    displayMarker(locPosition, message);
		}

	var imageSrc = 'https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678111-map-marker-512.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(45, 50), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        position: markerPosition,
	        image: markerImage // 마커이미지 설정 
	    }); 
		    
	 	// 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);  
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);   
	}    

	//커스텀 오버레이에 표시할 컨텐츠 입니다
	//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	//별도의 이벤트 메소드를 제공하지 않습니다 
	
	//contents 생성영역
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
<!--makeMap함수 -->
function makeCvsInfo(){
	
	//실행될때 기존에 떠 있던 마커 숨기기
	hideMarkers();
	
	//실행될때 기존에 떠 있던 오버레이 숨기기
	for(var i=0; i<overlayArr.length; i++){
		overlayArr[i].setMap(null);   
	}
	
	//positions생성 영역
	//positions값 가공
	for(var i=0; i<positions.length; i++){
		positions[i].InfoContent = "<div>"+ positions[i].name +"</div>";
		positions[i].latlng	= new kakao.maps.LatLng(positions[i].latitude, positions[i].longitude);
	}
	
	// 마커
	for (var i = 0; i < positions.length; i ++) {
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    map: map, // 마커를 표시할 지도
		    position: positions[i].latlng // 마커의 위치
		});
		
		//마커를 배열에 삽입
		markerArr[i] = marker;
		
		//인포 윈도우에 들어갈 content 생성
		var Infocontent = positions[i].brand + positions[i].InfoContent;
		
		// 마커에 표시할 인포윈도우를 생성합니다 
		var infowindow = new kakao.maps.InfoWindow({
		    content: Infocontent // 인포윈도우에 표시할 내용
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
	
	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다

	for(var i = 0; i < contents.length; i++){
		var content = '<div class="wrap">' + 
	    '    <div class="info">' + 
	    '        <div class="title">' + 
	                   contents[i].brand +" "+ contents[i].name  + 
	    '            <div class="close" onclick="closeOverlay('+ i +')" title="닫기"></div>' + 
	    '        </div>' + 
	    '        <div class="body">' + 
	    '            <div class="img">' +
	    '                <img src="https://cdn1.iconfinder.com/data/icons/set-4/92/shop-512.png" width="73" height="70">' +
	    '           </div>' + 
	    '            <div class="desc">' + 
	    '                <div class="ellipsis">'+ contents[i].address +'</div>' + 
	    '                <div> 나로 부터 거리 : '+ contents[i].distance +' KM</div>' + 
	    '                <div><a onclick="productListAjax(\''+ contents[i].storecode +'\')" class="link">상품바로가기</a></div>' + 
	    '            </div>' + 
	    '        </div>' + 
	    '    </div>' +    
	    '</div>';
	    
	    var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: null,
		    position: markerArr[i].getPosition()       
		});
	    
	  	//커스텀오버레이 배열에 삽입 
		overlayArr[i] = overlay;
	    
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(markerArr[i],'click',openOverlay(overlay,map))
	}
} 
	
	<!--searchCvStore함수 END -->
	
	<!--etc -->

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

	<!--etc END -->
	
</script>
<!-- 카카오api 설정 end -->

<!-- ajax 영역 -->
<script type="text/javascript">
	function productListAjax(storecode){
		$(function() {
			$.ajax({
				type:"get",
		        url:"productList2",
		        //편의점상품리스트테이블 더미데이터생성되면 sql문 바꿔주라!
		        data:{"storecode" : storecode},
		        dataType:"json",
		        success:function (data){
		        	console.log(data);
		        	console.log(data.cvstoreDTO.cvsProductList.length);
		        	var v_loadPage ="";
		            	v_loadPage += "<div id='list-box'>"; 
		            	v_loadPage += "		<div class='tab'>"; 
		            	v_loadPage += "		<input class='accordion' type='radio'  id='storeProduct' name='cvstoreradio' value='편의점' checked/>"; 
	            		v_loadPage += "			<label class='tab-label' for='storeProduct'>"+ data.cvstoreDTO.brand +" "+ data.cvstoreDTO.name +" 상품 목록 </label>"; 
	            		v_loadPage += "			 <div class='tab-content panel' style='overflow:auto;'>"; 
		            	for(var i=0; i<data.cvstoreDTO.cvsProductList.length; i++){
	            				v_loadPage += "<div class='col-sm-5'>"; 
	            				v_loadPage += "<img src='${app}/resources/product/images/"+ data.cvstoreDTO.cvsProductList[i].name +".jpg'/><br>"; 
	            				v_loadPage += "상품명: " + data.cvstoreDTO.cvsProductList[i].name+"<br>"; 
	            				v_loadPage += "판매가: " + data.cvstoreDTO.cvsProductList[i].price+" 원 <br>"; 
	            				v_loadPage += "할인가: " + data.cvstoreDTO.cvsProductList[i].discountPrice + " 원 <br>"; 
	            				v_loadPage += "할인율: " + data.cvstoreDTO.cvsProductList[i].discountRate+" % <br>"; 
	            				v_loadPage += "남은시간: " + data.cvstoreDTO.cvsProductList[i].countTime + " 시간<br>"; 
	            				v_loadPage += "<input type='submit' />"; 
	            				v_loadPage += "</div>"; 
		            	}
		            	v_loadPage += "				</div>"; 
		            	v_loadPage += "			</div>"; 
		            	v_loadPage += "			<div class='tab'>"; 
		            	v_loadPage += "			 <input class='accordion' type='radio' id='acc_close' name='cvstoreradio'>"; 
		            	v_loadPage += "			<label for='acc_close' class='tab-close'>닫기 &times;</label>"; 
		            	v_loadPage += "			</div>"; 
		            	v_loadPage += "</div>"; 
		
		            	$("#cvsProductList").html(v_loadPage);
		        }
	        });
	    });
	}
	
	<!-- 지도에 받을 편의점 리스트 Ajax -->
	function cvsStoreCntAjax(cvStoreCnt){
    	$(function() {
    		if(typeof cvStoreCnt == "undefined" || cvStoreCnt == null || cvStoreCnt == ""){
        		cvStoreCnt = 0;
        	}
			$.ajax({
			type:"get",
	        url:"mapajax",
	        data:{"lat":lat,
	        	  "lon":lon,
	        	  "cvStoreCnt":cvStoreCnt  
	        },
	        async:"false",
	        datatype:"json",
	        success:function (data){
	        		// 사용할 배열 초기화
	        		positions  = [];
	        		contents   = [];
	        		cvsArr     = [];
					//데이터 전역변수에 담기
					for(var i = 0; i<data.list.length; i++){
						cvsArr[i]=data.list[i];
					}
					//데이터 positions, contents 배열에 담기
					for(var i=0; i<data.list.length; i++){
						positions.push(data.list[i]);
						contents.push(data.list[i]);
					}
					console.log(data);
					//makeCvsInfo 사용
					makeCvsInfo();
	            }
	            
				});
    	});
	
	}
	<!-- 지도에 받을 편의점 리스트 Ajax END -->
</script>



<!-- ajax 영역end -->
<!--===================================================================================
										JS영역 END
====================================================================================-->