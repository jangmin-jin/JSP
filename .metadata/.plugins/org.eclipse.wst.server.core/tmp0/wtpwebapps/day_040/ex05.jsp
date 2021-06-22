<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바 라이브러리 선언 -->
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- JSP내부 주석하는 방법 --%>
<%
	// 자바 라이브러리 사용
	Date date = new java.util.Date();
	out.println(date.toLocaleString());
%>
</body>
</html>