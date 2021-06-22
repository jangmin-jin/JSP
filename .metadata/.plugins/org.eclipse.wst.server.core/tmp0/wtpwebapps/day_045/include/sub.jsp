<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sub.jsp -->
<%
	String data1 = request.getParameter("data1");
	String data2 = request.getParameter("data2");
%>
Hello.jsp 2 <br>
Hello.jsp 3 <br>
<!-- 값을 넘기지 않고 i를 선언하면 에러남 -->
<!-- data1은 만들어서 넘겨주었기 때문에 에러가 나지 않음 -->
<%= "data1 : " + data1 %><br>
<%= "data2 : " + data2 %><br>