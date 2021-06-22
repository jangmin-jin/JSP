<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main2.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% int i = 5; %>

Hello.jsp 5 <br>
<!-- sub.jspf의 내용을 가져와서 합친다음 실행한다. -->
<%@ include file="sub.jspf" %>
Hello.jsp 6 <br>

</body>
</html>