<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main1.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% int i = 10; %>

Hello.jsp 1 <br>
<!-- sub.jspf의 내용을 가져와서 합친다음 실행한다. -->
<%@ include file="sub.jspf" %>
Hello.jsp 4 <br>

</body>
</html>