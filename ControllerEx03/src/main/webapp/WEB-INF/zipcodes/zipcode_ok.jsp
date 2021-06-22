<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model1.ZipcodeTO"%>
<%@page import="java.util.ArrayList"%>

<%
	//ArrayList<String> lists = (ArrayList)request.getAttribute("lists");
	ArrayList<ZipcodeTO> lists = (ArrayList)request.getAttribute("lists");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	out.println("데이터 갯수 : " + lists.size() + "<br><br>");
	for(ZipcodeTO to : lists){
		out.println(to.getSido() +"<br>");
	}
%>

</body>
</html>