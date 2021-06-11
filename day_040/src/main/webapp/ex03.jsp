<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 지역 변수
	int num1 = 10;
	out.println("Hello JSP 1<br>");
	out.println("Hello JSP : " +num1 + "<br>");
%>

<!-- 함축 버전 -->
<%= "Hellow JSP 2<br>" %>
<%= "Hello JSP 2 : " +num1 + "<br>" %>
</body>
</html>