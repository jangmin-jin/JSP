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
	// 생략되어 있는 구문
	// JspWriter out = new JspWriter();
	out.println("Hello JSP<br>");

	// getOut()의 리턴값이 writer임
	JspWriter writer = pageContext.getOut();
	writer.println("Hello JSP2<br>");
	
	// out과 writer는 선언은 달랐지만 같은 놈임.
	out.println("out : " + out + "<br>");
	// out : org.apache.jasper.runtime.JspWriterImpl@19344a51
	out.println("writer : " + writer + "<br>");
	// writer : org.apache.jasper.runtime.JspWriterImpl@19344a51
%>
</body>
</html>