<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var deleteConfirm = confirm('${msg}')

if (deleteConfirm != true) {
	location.href='${url1}';
} else {
	location.href='${url2}?resvId=${resvId}';
}
</script>
</head>
<body>
</body>
</html>