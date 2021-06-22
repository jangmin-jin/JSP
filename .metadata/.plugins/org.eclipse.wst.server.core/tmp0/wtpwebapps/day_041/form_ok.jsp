<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- form_ok.jsp -->
<% 
	// post방식에서 한글이 깨지는 것을 방식
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get, post 방식으로 데이터 전송하기</title>
</head>
<body>

<%
	java.util.Enumeration e = request.getParameterNames();
	while(e.hasMoreElements()){
		String key = (String)e.nextElement();
		out.println("키값 : " + key + "<br>");
	}
	
	out.println( request.getParameter("data1") + "<br>" );
	out.println( request.getParameter("data2") + "<br>" );
	out.println( request.getParameter("data3") + "<br>" );
%>
</body>
</html>