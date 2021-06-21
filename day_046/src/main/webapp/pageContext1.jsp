<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String value1 = "value1";

	pageContext.setAttribute("data1", value1);
	out.println( (String)pageContext.getAttribute("data1") + "<br>" );
%>