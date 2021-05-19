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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
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
		showAnim : "slideDown",
		showOtherMonths: true,
		selectOtherMonths: true,
		showButtonPanel: true,
		changeMonth: true,
		changeYear: true,
		numberOfMonths: 2,
		dateFormat: "yy-mm-dd",
		showOn: "button",
		buttonImageOnly: true,
		buttonImage: "https://jqueryui.com/"
		+ "resources/demos/datepicker/images/calendar.gif",
		buttonText: "Select date",
		altFormat: "yy/mm/dd DD",
		minDate: 0,
		maxDate: "+1M +20D",
		showWeek: true,
		todayHighlight : true
	};

	var optionFrom = option;
	optionFrom.altField = "#alternateFrom";
	
	var signal = false;
	// 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없습니다.
	var from = $("#from")
		.datepicker(optionFrom)
		.on( "change", function() {
			var checkin = $('#alternateFrom').val()
		
		$('#l1').text(checkin)
		$('#hidIn').val(checkin)
	});
	var optionTo = option;
	optionTo.altField = "#alternateTo";
	// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없습니다.
	var to = $("#to")
		.datepicker(optionTo)
		.on("change", function() {
		var checkout = $('#alternateTo').val()
		
		$('#l2').text(checkout)
		$('#hidOut').val(checkout)
		
		from.datepicker("option", "maxDate", getDate( this ));
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
			</div>
				<div class="CenterFrame">
					<h4><strong>체크아웃</strong></h4>
					<label id="l2"></label>
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