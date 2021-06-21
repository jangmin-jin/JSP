<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./controller" method="post">
	<input type="hidden" name="action" value="zipcode_ok">
		동입력 <input type="text" name="dong">
		<input type="submit" value="우편번호 검색">
	</form>
</body>
</html>