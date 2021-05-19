<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#btnIdDupl').click(function(){
		var loginid = $("#loginId").val();
		
		if (loginid == '') {
			alert("아이디를 입력하세요");
			return;
		}
		$.ajax({
			type:'post',
			url: "idcheck",
			dataType: "text",
			data: {id: loginid},
			success: function (data, textStatus) {
				if (data == 'usable') {
					$('#idCheckMessage').text("사용할 수 있는 아이디입니다.");
					$('#btnIdDupl').prop("disabled", true);
				} else {
					$('#idCheckMessage').text("사용할 수 없는 아이디입니다.");
				}
			}
		})
	});
	
	$('#btnEmailDupl').click(function(){
		var email = $("#email").val();
		
		if (email == '') {
			alert("이메일을 입력하세요");
			return;
		}
		$.ajax({
			type:'post',
			url: "emailcheck",
			dataType: "text",
			data: {email: email},
			success: function (data, textStatus) {
				if (data == 'usable') {
					$('#emailCheckMessage').text("사용할 수 있는 이메일입니다.");
					$('#btnEmailDupl').prop("disabled", true);
				} else {
					$('#emailCheckMessage').text("사용할 수 없는 이메일입니다.");
				}
			}
		})
	});
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
<div class="container">
	<div class="center-block">
		<form action="join" method="post">
			<h3>회원가입</h3>
			<div class="center-block">
			<p>회원 정보 입력</p>
			<p>*필수 입력</p>
				<div class="join-box">
				<table>
					<tr>
						<td>아이디*</td>
							<td><input type="text" id = "loginId" name="loginId" required="required"
								autofocus="autofocus" /></td>
							<td><input type="button" id="btnIdDupl" value="아이디 중복체크" class="btn btn-warning"/></td>
						<td><div id="idCheckMessage" style="width:200px"></div></td>
					</tr>
					<tr>
						<td>비밀번호*</td>
						<td><input type="password" name="loginPassword" required="required" /></td>
					</tr>
					<tr>
						<td>이메일*</td>
						<td><input type="text" id="email" name="email" required="required" /></td>
						<td><input type="button" id="btnEmailDupl" value="이메일 중복체크" class="btn btn-warning"/></td>
						<td><div id="emailCheckMessage"></div></td>
					</tr>
					<tr>
						<td>국가*<td>
						<select name="country" style="width:200px;height:34px;">
							<option value="">국가선택</option>
							<option value="korea">대한민국</option>
							<option value="usa">미국</option>
							<option value="china">중국</option>
							<option value="japan">일본</option>
						</select>
					</tr>
					<tr>
						<td>이름*</td>
						<td><input type="text" name="name" required="required" /></td>
					</tr>
					<tr>
						<td>생년월일*</td>
						<td><input type="text" name="birthdate" placeholder="yyyy-mm-dd"
							required="required" /></td>
					</tr>
					<tr>
						<td>연락처*</td>
						<td><input type="text" name="tel"
							placeholder="010-0000-0000" required="required" /></td>
					</tr>		
				</table>		
				<button type="submit" class="join-btn">확인</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>