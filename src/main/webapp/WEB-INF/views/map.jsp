<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="kakaokey" value="d5d4850376504cbcd111fa1f434f605e"/>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="hash" value="${hash }"></c:set>
<c:set var="CvstoreDTO" value="${CvstoreDTO }"></c:set>
<c:set var="dto" value="${customerDTO }"></c:set>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="" href="">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="${app}/resources/customer/css/bootstrap.min.css" rel="stylesheet">

<!-- accordion css -->
<link  href="${app}/resources/customer/css/accordion.css" rel="stylesheet">

<!-- Custom Stylesheet -->
<link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
<link href="${app}/resources/manager/css/manager.css" rel="stylesheet">
    	
<!-- jquery 경로 -->
<script type="text/javascript" src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript"  src="${app}/resources/customer/js/accordion.js"></script>	

<script type="text/javascript">
<!--아코디언 JS -->


 // 전체 체크 버튼 클릭시 전체 체크 및 해제
 function checkFunc(){	 
	 var temp = $("ul[id='acc_ordion']");
	 if(($("ul[id='acc_ordion']").attr("class")) === 'Accordion'){
		 console.log("ture클릭")
		 $("ul[id='acc_ordion']").prop("class","collapse")
		 
	}else{
		console.log("false클릭");
		$("ul[id='acc_ordion']").prop("class","Accordion")
	}
 }

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
    .wrap .info {max-width: 100%;; height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden; background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .ti_tle {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB; }
    .info .dist {position: absolute; }
    .info .visitStore {position: relative; top:25px; left:25%;}
<!-- 카카오 CSS END -->

<!--html map button-->
	#showMarkers{
		
	}
	#hideMarkers{
	}

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
		<div class="row">
			<div class="col-sm">
				 <div class="btn-group btn-group-lg">
					    <button id="hideMarkers" type="button" class="btn btn-primary" style="background-color:#ff8a3d;" onclick="hideMarkers()">편의점 감추기</button>
					    <button id="showMarkers" type="button" class="btn btn-success" style="position:absolute; left:93%;"  onclick="showMarkers()">검색했던 편의점 모두 보기</button>
			   
		    	</div>
		    </div>
		    
		    <div class="col-sm">
			    <div style="display:flex;margin:auto;">
			    	
					  <select class="form-select" name="cvStoreCnt" id="cvStoreCnt">
					   <strong><label for="cvStore">편의점 개수 지정:</label></strong>
					    <option value="10">10개</option>
					    <option value="30">30개</option>
					    <option value="50">50개</option>
					    <option value="100">100개</option>
					  </select>
					  <div class="btn-group btn-group-lg">
					  <button onclick="nearbyCvStore()"  id ="searchBtn"  type="button"  class="btn btn-primary" style="background-color:#ff8a3d;" >내 위주 편의점보기</button>
				   </div>
			  </div>
		  </div>
		  
		</div>
		</div>
		<br/>
		<br/>
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


var endNum;
var code;
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
		            message = '<div style="padding:12px;  background-color: #ff8a3d;"><strong>여기에 계시는군요?</strong></div>'; // 인포윈도우에 표시될 내용입니다
		        	
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
		
		//위치 거리 조건에 맞춰 M로 환산
		var dist = contents[i].distance;
		var dist_String = "";
		if(dist < 1){
			dist *= 1000;
			dist_String = dist + "M";
		}else{
			dist_String = dist + "KM";
		}
		
		
		
		var content = '<div class="wrap">' + 
	    '    <div class="info">' + 
	    '        <div class="ti_tle">' + 
	    			contents[i].brand +" "+ contents[i].name  + 
	    '            <div class="close" onclick="closeOverlay('+ i +')" title="닫기"></div>' + 
	    '        </div>' + 
	    '        <div class="body">' + 
	    '            <div class="img">' +
	    '                <img src="https://cdn1.iconfinder.com/data/icons/set-4/92/shop-512.png" width="73" height="70">' +
	    '           </div>' + 
	    '            <div class="desc">' + 
	    '                <div class="ellipsis">'+ contents[i].address +'</div>' + 
	    '                <div class="dist"> 내 위치로 부터 거리 : <a style="color:#ff8a3d;">'+ dist_String + '</a></div>' + 
	    '                <div class="visitStore"><a onclick="productListAjax(\''+ contents[i].storecode +'\',0)" class="link" style="color:blue">상품바로가기</a></div>' + 
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
	    for(var i=0; i<overlayArr.length; i++){
			overlayArr[i].setMap(null);   
		}
	}
	
	<!--내 위주 편의점보기 버튼 이벤트-->

	<!--내 위주 편의점보기 버튼 이벤트 END-->

	<!--etc END -->
	
</script>
<!-- 카카오api 설정 end -->

<!-- ajax 영역 -->
<script type="text/javascript">
	function productListAjax(storecode, endNo){
		
		$(function() {
			endNum = endNo;
			code = storecode;
			
			$.ajax({
				type:"get",
		        url:"productList",
		        //편의점상품리스트테이블 더미데이터생성되면 sql문 바꿔주라!
		        data:{"storecode" : storecode,
		        	 "endNo" : endNo	
		        },
		        dataType:"json",
		        success:function (data){
		        	console.log(data);
		        	if(data.cvstoreDTO.cvsProductList.length == 0){
		        		Swal.fire(
		        				  '검색결과',
		        				  '편의점에 등록된 상품이 없습니다',
		        				  'question'
		        				);
		        		return;
		        	}
		        	console.log(data.cvstoreDTO.cvsProductList.length);
		        	console.log(data.cvstoreDTO.cvsProductList[0].warehousingdate );
		        	var v_loadPage ="";
						

	            		
	            		v_loadPage += "		<ul class='metismenu' id='menu'>"; // start metismenu
	            		v_loadPage += "				<li class='mega-menu mega-menu-sm'>"; // start mega-menu mega-menu-sm
	            		v_loadPage += "				<button type='button' class='btn btn-success' style='width:375px;position:relative; right:11px;' >"; // start mega-menu mega-menu-sm
	            		v_loadPage += "					<a onclick='checkFunc()' aria-expanded='false' style='font-size:16px;'>"; 
	            		v_loadPage += 						"<span>"+ data.cvstoreDTO.brand+" "+data.cvstoreDTO.name +" 상품목록"+"</span>";
	            		v_loadPage += "					</a>"; 
	            		v_loadPage += "				</button>"; // start mega-menu mega-menu-sm
	            		v_loadPage += "					<ul aria-expanded='false' id='acc_ordion' class='Accordion'>";  //start ul
         				
         				v_loadPage += "		<div id ='list_container_box' style='height: 700px; overflow-y: scroll;>"; // start list_container_box
         				v_loadPage += "			<hr class='list_hr'>"; 
         				v_loadPage += " 			<form>";  //start form
		            	for(var i=0; i<data.cvstoreDTO.cvsProductList.length; i++){
		            		endNum += 1;
	            				v_loadPage += "<div id='list-box'>"; //start list-box
	            				v_loadPage += "		<div class='row'>"; //start row
	            				v_loadPage += "			<div class='col-sm-3'>"; //start col-sm-3
	            				v_loadPage += "				<div class='img_resize'><img src='${app}/resources/product/images/"+ data.cvstoreDTO.cvsProductList[i].name +".jpg' class='product_img'/></div>"; 
	            				v_loadPage += "			</div>"; 	// //end col-sm-3
	            				v_loadPage += "			<div class='col-sm-6'>"; //start col-sm-6
	            				v_loadPage += "				<div class='control_size'>"; // start control_size
	            				v_loadPage += "					<span style='font-weight:bold'>"+ data.cvstoreDTO.cvsProductList[i].name+"<br/></span>"; 
	            				v_loadPage += "					<div class='enroll_margin_box'></div>"; 
	            				v_loadPage += "					<span>제조날짜 : "+ data.cvstoreDTO.cvsProductList[i].parseWarehousingdate +"<br/></span>"; 
	            				v_loadPage += "					<span>유통만료기한 : "+ data.cvstoreDTO.cvsProductList[i].parseExpirationdate + "<br/></span>"; 
	            				v_loadPage += "					<div class='enroll_margin_box'></div>"; 
	            				v_loadPage += "				</div>"; //end control_size
	            				v_loadPage += "			</div>"; //end col-sm-6
	            				v_loadPage += "			<div class='col-sm-3'>"; //start col-sm-3
	            				v_loadPage += "				<div class='dDay'>D-day : "+data.cvstoreDTO.cvsProductList[i].countTime+"시간</div>"; 
	            				
	            				v_loadPage +="				원가 : <span class='ori_price'>"+data.cvstoreDTO.cvsProductList[i].price+"원</span>";
	            				v_loadPage +="				<div class='discount'>"+data.cvstoreDTO.cvsProductList[i].discountRate+"% <span style='color:black;''>" + data.cvstoreDTO.cvsProductList[i].discountPrice + "원</span></div>";
	            				v_loadPage += "				<input type='button' value='결제' class='btn_enroll' onclick='buyBtn(\""+ data.cvstoreDTO.cvsProductList[i].no +"\")' />"; //결제버튼
	            				v_loadPage += "			</div>"; //end col-sm-3
	            				v_loadPage += "		</div>"; //end row
	            				v_loadPage += "</div>"; //end list-box
	            				v_loadPage += "<hr>"; 

		            	}
		            	v_loadPage += " 		 			</form>"; //end form
		            	v_loadPage += "					</div>"; // end list_container_box
	            		v_loadPage += " 		 	</ul>"; //start ul
	            		v_loadPage += "			</li>"; // start mega-menu mega-menu-sm
		            	v_loadPage += " 	</ul>"; // end metismenu

		            	$("#cvsProductList").html(v_loadPage);
		            	
		              	if(endNum == 3){
		            		console.log("endNum");
		            		$("#list_container_box").bind("scroll",infinityScrollFunction);
		            	}
		        }
	        });
	    });
	}
	
	function infinityScrollFunction() {
	console.log(code);
	console.log(endNum);
        //현재문서의 높이를 구함.
        var documentHeight  = $(document).height();
        console.log("documentHeight : " + documentHeight);
        
        //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
        //스크롤바가 맨 위쪽에 있을때 , 위치는 0
        console.log("window의 scrollTop() : " + $(window).scrollTop()); 
        //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
        console.log("window의 height() : " + $(window).height());
        
        //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
        //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
        var scrollHeight = $(window).scrollTop()+$(window).height();         
        console.log("scrollHeight : " + scrollHeight);
            
        if(scrollHeight == documentHeight) { //문서의 맨끝에 도달했을때 내용 추가 
        	$.ajax({
				type:"get",
		        url:"productList",
		        //편의점상품리스트테이블 더미데이터생성되면 sql문 바꿔주라!
		        data:{"storecode" : code,
		        	 "endNo" : endNum	
		        },
		        dataType:"json",
		        success:function (data2){
		        	console.log(data2);
		        	console.log(data2.cvstoreDTO.cvsProductList.length);
		        	console.log(data2.cvstoreDTO.cvsProductList[0].warehousingdate );
		        	var v_loadPage2 ="";
		            	for(var i=0; i<data2.cvstoreDTO.cvsProductList.length; i++){
		            			endNum += 1;
		            			v_loadPage2 += "<div id='list-box'>"; //start list-box
		            			v_loadPage2 += "		<div class='row'>"; //start row
		            			v_loadPage2 += "			<div class='col-sm-3'>"; //start col-sm-3
		            			v_loadPage2 += "				<div class='img_resize'><img src='${app}/resources/product/images/"+ data2.cvstoreDTO.cvsProductList[i].name +".jpg' class='product_img'/></div>"; 
		            			v_loadPage2 += "			</div>"; 	// //end col-sm-3
		            			v_loadPage2 += "			<div class='col-sm-6'>"; //start col-sm-6
		            			v_loadPage2 += "				<div class='control_size'>"; // start control_size
		            			v_loadPage2 += "					<span style='font-weight:bold'>"+ data2.cvstoreDTO.cvsProductList[i].name+"<br/></span>"; 
		            			v_loadPage2 += "					<div class='enroll_margin_box'></div>"; 
		            			v_loadPage2 += "					<span>제조날짜 : "+ data2.cvstoreDTO.cvsProductList[i].parseWarehousingdate +"<br/></span>"; 
		            			v_loadPage2 += "					<span>유통만료기한 : "+ data2.cvstoreDTO.cvsProductList[i].parseExpirationdate + "<br/></span>"; 
		            			v_loadPage2 += "					<div class='enroll_margin_box'></div>"; 
		            			v_loadPage2 += "				</div>"; //end control_size
		            			v_loadPage2 += "			</div>"; //end col-sm-6
		            			v_loadPage2 += "			<div class='col-sm-3'>"; //start col-sm-3
		            			v_loadPage2 += "				<div class='dDay'>D-day : "+data2.cvstoreDTO.cvsProductList[i].countTime+"시간</div>"; 
	            				
		            			v_loadPage2 +="				원가 : <span class='ori_price'>"+data2.cvstoreDTO.cvsProductList[i].price+"원</span>";
		            			v_loadPage2 +="				<div class='discount'>"+data2.cvstoreDTO.cvsProductList[i].discountRate+"% <span style='color:black;''>" + data2.cvstoreDTO.cvsProductList[i].discountPrice + "원</span></div>";
		            			v_loadPage2 += "				<input type='button' value='결제' class='btn_enroll' onclick='buyBtn(\""+ data2.cvstoreDTO.cvsProductList[i].no +"\")' />"; //결제버튼
		            			v_loadPage2 += "			</div>"; //end col-sm-3
		            			v_loadPage2 += "		</div>"; //end row
		            			v_loadPage2 += "</div>"; //end list-box
		            			v_loadPage2 += "<hr>"; 

		            	}
		            	$(v_loadPage2).appendTo("#list_container_box");
		            	alert("추가 업로드")
		            	
		        }
	        });
        }
    }//function infinityScrollFunction()

	
	
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
	
	<!-- 결제 ajax Start -->
	function buyBtn(no){
		var accountno = '${dto.accountno}';
		$.ajax({
	   		 url: "onecvsproduct",
	   		 method: "POST",
	   		 data: {"no":no},
	   		 datatype: "json",
	   		 success:function(cvsProductDTO){
	   			const swalWithBootstrapButtons = Swal.mixin({
					  customClass: {
					    confirmButton: 'btn btn-success',
					    cancelButton: 'btn btn-danger'
					  },
					  buttonsStyling: false
					})

					swalWithBootstrapButtons.fire({
					  title: "결제확인",
					  text: cvsProductDTO.name+'을(를) '+ cvsProductDTO.discountPrice+'원에 구입하시겠습니까?',
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonText: '결제요청',
					  cancelButtonText: '취소'
					}).then((result) => {
					  if (result.isConfirmed) {
						  
						  $.ajax({
				   				url: "purchaseproduct",
				   				method: "POST",
				   				data: {"no":no},
								datatype: "json",
								success:function(data){
									if(data == null || data==""){
										Swal.fire(
					    						  '잔액부족',
					  	    				      '포인트가 부족합니다. 충전 후에 재시도 부탁드립니다.',
					  	    				      'error'
					    						);
									}
									else{
										Swal.fire({
											  icon: 'success',
											  title: '성공적으로 물품을 구입했습니다.',
											  showConfirmButton: false,
											  timer: 100000
											});
						    			
						    			location.reload();									
									}
									
					    			 
					    		 },
					    		 error:function(){
					    			 Swal.fire(
				    						  '문제발생',
				  	    				      '오류가 발생했습니다. 다시 시도해주세요.',
				  	    				      'error'
				    						);
					    		 }
					    	 });
					  } else if (
	    				    /* Read more about handling dismissals below */
	    				    result.dismiss === Swal.DismissReason.cancel
	    				  ) {
	    				    swalWithBootstrapButtons.fire(
	    				      '결제취소',
	    				      '결제를 취소했습니다. 처음부터 다시 시도하세요.',
	    				      'error'
	    				    );
	    				  }
	    				});
	   			
	   			/* $.ajax({
	   				url: "purchaseproduct",
	   				method: "POST",
	   				data: {"no":no},
					datatype: "json",
					success:function(data){
						if(data == null || data == ""){
							alert("잔액부족");
						}
						else{
							alert("구매성공");
							location.reload();
						}
					},
					error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				       }
	   			});*/
	   		 },
	   		 error:function(){
	   		    alert("실패");
	   		 } 
	   	});
	}
	<!-- 결제 ajax end -->
	
	<!-- Map 뜰때 Start-->
	
	window.onload = function(){
		document.getElementById("searchBtn").onclick = function () {
			  var cvStoreCnt = document.getElementById("cvStoreCnt").value;
			  cvsStoreCntAjax(cvStoreCnt);
			};
		
		$.ajax({
			type:"get",
	        url:"sessionLoc",
	        data:{"lat":lat,
	        	  "lon":lon},
	        success:function(data){
	        	console.log("sessionLoc 성공");
	        }
        });
	};
	

	
	
	<!-- Map 뜰때 END-->
</script>



<!-- ajax 영역end -->
<!--===================================================================================
										JS영역 END
====================================================================================-->