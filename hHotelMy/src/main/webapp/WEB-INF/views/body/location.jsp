<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>오시는 길</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/main.css">
<style>
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
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
<div align=center>
<div id="map" style="width:60%;height:350px"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91ec1122017b3cce2bf3cdf5b5cadfe3"></script>
<script>
var mapContainer = document.getElementById('map'),
    mapOption = { 
        center: new kakao.maps.LatLng(37.50705, 127.06255),
        level: 3
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption);

var marker = new kakao.maps.Marker({
    map: map, 
    position: new kakao.maps.LatLng(37.50705, 127.06255)
});

var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            hHotel' + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="resources/images/hLogo.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 강남구 테헤란로</div>' + 
            '                <div class="jibun ellipsis">98길 12</div>' + 
            '                <div><a href="http://www.hyundai-ite.com/">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

var overlay = new kakao.maps.CustomOverlay({
    content: content,
    map: map,
    position: marker.getPosition()       
});

kakao.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map);
});

function closeOverlay() {
    overlay.setMap(null);     
}
</script>
</div>
<div align=center>
	<table style="margin-top:50px;">				
		<tr>
			<td rowspan=4>
				<img src="resources/images/bus.png" width=220 height=180>
			</td>
			<td align=center width=520>
				<font size="5em" color="#5993ff">
					By Bus
				</font>
			</td>
		<tr>
			<td>
			<ul>
				<li>
					운영 시간 : 24 시간 / 7 일
				</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<ul>
				<li>
					비용 : 무료
				</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<ul>
				<li>
					정류장 : 호텔 앞
				</li>
			</ul>
			</td>
		</tr>
	</table>
	<div align=center style="margin-top:85px;">
	<table>
		<tr>
			<td rowspan=3>
				<img src="resources/images/car.png" width=220 height=180>
			</td>
			<td align=center width=520>
				<font size="5em" color="#5993ff">
					By Car
				</font>
			</td>
		<tr>
			<td>
			<ul>
				<li>
					주차장 : 투숙객은 주차가 가능합니다.
				</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>
			<ul>
				<li>
					비용 : 무료
				</li>
			</ul>
			</td>
		</tr>
		
	</table>
	</div>
</div>
</body>
</html>
