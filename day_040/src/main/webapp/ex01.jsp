<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	주석 쓰는 방법
<%
	// 자바 코드
	// 주석
	// 출력
	// 객체 변수 만들때 new가 필요가 없음
	// out.println은 html을 출력한다.
	// 그말은 즉슨 안쪽에 html 코드를 넣어도 된다는 말.
	out.println("<b>Hello JSP</b><br>");
	out.println("<h1>Hello JSP</h1>");
	
	// 디버깅용(이클립스 서버쪽에 나옴)
	System.out.println("Hello JSP");
%>
<%
	out.println("Hello JSP2<br>");
	out.println("<h2>Hello JSP2</h2>");
	
	// 디버깅용(이클립스 서버쪽에 나옴)
	System.out.println("Hello JSP2");
%>
</body>
</html>