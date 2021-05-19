<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 예약창1</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 내가 쓰던 거 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/hHotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/hHotel/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/hHotel/resources/css/main.css">
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<!-- 내가 쓰던 거 -->

</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
<div><input type="hidden" id="alternateFrom" size="30"><input type="hidden" id="alternateTo" size="30"></div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.2/i18n/jquery.ui.datepicker-ko.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
$(function(){
	var option = {
	// datepicker 애니메이션 타입
	// option 종류 : "show" , "slideDown", "fadeIn", "blind", "bounce", "clip", "drop", "fold", "slide"
	showAnim : "slideDown",
	// 해당 월의 다른 월의 날짜가 보이는 여부, 예를 들면 10월이면 전후에 9월 마지막과 11월의 시작 일이 보이는 여부입니다. 즉, 달력이 꽉 차 보이게 하는 것
	showOtherMonths: true,
	// 선택 여부 (showOtherMonths 옵션과 같이 일치시키지 않으면 에러가 발생합니다.)
	selectOtherMonths: true,
	// 달력 밑에 오늘과 닫기 버튼이 보인다.
	showButtonPanel: true,
	// 년 월이 셀렉트 박스로 표현 되어서 선택할 수 있다.
	changeMonth: true,
	changeYear: true,
	// 한번에 보이는 개월 수
	numberOfMonths: 2,
	// 데이터 포멧
	dateFormat: "yy-mm-dd",
	// 텍스트 박스 옆의 달력 포시
	showOn: "button",
	//이미지 타입인지 버튼 타입인지 설정
	buttonImageOnly: true,
	// 이미지 경로
	buttonImage: "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	// 버튼 타입이면 버튼 값
	buttonText: "Select date",
	// alt 데이터 포멧
	altFormat: "yy/mm/dd DD",
	// 선택 가능한 날짜(수 형식) - 당일부터 가능
	minDate: 0,
	// 선택 가능한 최대 날짜(문자 형식) - 현재 기준 +1월 +20일
	maxDate: "+1M +20D",
	// 주 표시
	showWeek: true,
	// 오늘날짜에 하이라이트
	todayHighlight : true ,
	};

	var optionFrom = option;
	optionFrom.altField = "#alternateFrom";
	
	var signal = false;
	
	// 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없다.
	var from = $( "#from" )
		.datepicker(optionFrom)
		.on( "change", function() {
			var checkin = $('#alternateFrom').val()
		
		$('#l1').text(checkin)
		$('#hidIn').val(checkin)
	});
	
	var optionTo = option;
	optionTo.altField = "#alternateTo";
	// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
	var to = $( "#to" )
		.datepicker(optionTo)
		.on( "change", function() {
		var checkout = $('#alternateTo').val()
		
		$('#l2').text(checkout)
		$('#hidOut').val(checkout)
		
		from.datepicker( "option", "maxDate", getDate( this ) );
		});
	
		function getDate( element ) {
			return moment(element.value).toDate();
	}

});
</script>



<div class="container">
	<form action="reserveWindow" method="post">
	  	<div class="container-align-box">
			<div class="leftFrame">
				<h4><strong>체크인</strong></h4>
				<label id="l1"></label>
				<h4><strong>성인</strong></h4>
				<label id="adult"></label>
			</div>
				<div class="CenterFrame">
					<h4><strong>체크아웃</strong></h4>
					<label id="l2"></label>
					<h4><strong>어린이</strong></h4>
					<label id="child"></label>
				</div>
			<div class="RightFrame">
				<input type="submit"  value="다음" class="resvNextBtn"/>
			</div>
		</div>

		<div class="container-fluid">
			<div class="col-md-12">
					<h3><p>객실 예약</p></h3>
					<div class="container-inner">
						<div class="col-md-6"><p>체크인</p><p><input type="text" id="from"></p></div>
						<div class="col-md-6"><P>체크아웃</P><p><input type="text" id="to"></p></div>
					</div>
			</div>
		</div>
			<div><input type="hidden" id="hidIn" name="hidIn"></div>
			<div><input type="hidden" id="hidOut" name="hidOut"></div>
	</form>
</div>
<div class="col-md-6">
	<div class="row">
	
	</div>
</div>

</body>
</html>