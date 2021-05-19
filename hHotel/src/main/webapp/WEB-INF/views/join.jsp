<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hHotel/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/hHotel/resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="/hHotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="/hHotel/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header1.jsp" flush="true" />
<div class="container">
	<div class="center-block">
		<form action="joinAction" method="post">
			<h3>회원가입</h3>
			<div class="center-block">
			<p>회원 정보 입력</p>
			<p>*필수 입력</p>
				<div class="join-box">
				<table>
					<tr>
						<td>아이디*</td>
						<td><input type="text" name="id" required="required"
							autofocus="autofocus" /></td>
					</tr>
					<tr>
						<td>비밀번호*</td>
						<td><input type="password" name="password" required="required" /></td>
					</tr>
					<tr>
						<td>이메일*</td>
						<td><input type="text" name="email" required="required" /></td>
					</tr>
					<tr>
						<td>국가*<td>
							<select name="country">
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
							placeholder="010-0000-0000형식으로 입력하세요." required="required" /></td>
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