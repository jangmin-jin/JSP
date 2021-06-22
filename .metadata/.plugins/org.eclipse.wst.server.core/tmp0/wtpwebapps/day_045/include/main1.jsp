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

<%
	int i = 10;
%>

Hello.jsp 1 <br>
<!-- sub로 데이터를 보내는 방법 -->
<jsp:include page="sub.jsp">
	<jsp:param value="value1" name="data1"/>
	<jsp:param value="<%=i %>" name="data2"/>
</jsp:include>
<!-- 
	Hello.jsp 2 <br>
	Hello.jsp 3 <br>
 -->
Hello.jsp 4 <br>
<%="i : " + i %>

</body>
</html>