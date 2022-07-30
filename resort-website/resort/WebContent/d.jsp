<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
	<meta charset="utf-8">
	</head>
	<body>
	<!-- iframe: 한 페이지에 원하는 만큼 분할을 시켜주는 태그 -->
    <!-- src : 프레임에 어더한 것을 보여줄지 경로지정 -->
    <!-- 왼쪽 화면에 메뉴 리스트 출력 -->
	<iframe src="d_01.jsp" height="100%"
        width="700px" name="left"></iframe>
    <!-- 오른쪽 화면은 초기설정은 intro 출력 -->
	<iframe src="d_02.jsp" height="100%"
		width="550px" name="main"></iframe>
	</body>
</html>