<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- form.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get, post 방식으로 데이터 전송하기</title>
</head>
<body>

<!-- 
	action - 데이터를 처리할 페이지 
	method - 전송방식
-->
<form action="./form_ok.jsp" method="get">
data1 <input type="text" name="data1"><br>
data2 <input type="text" name="data2"><br>
data3 <input type="text" name="data3"><br>
<input type="submit" value="전송하기">
</form>

<hr>
<a href="./form_ok.jsp?data1=value1&data2=value2&data3=value3">바로가기</a>

<hr>
<form action="./form_ok.jsp" method="post">
data1 <input type="text" name="data1"><br>
data2 <input type="text" name="data2"><br>
data3 <input type="text" name="data3"><br>
<input type="submit" value="전송하기">
</form>

</body>
</html>