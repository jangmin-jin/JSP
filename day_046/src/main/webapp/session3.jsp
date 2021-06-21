<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data1 = (String)session.getAttribute("data1");
	String data2 = (String)session.getAttribute("data2");
	
	out.println(data1 + "<br>");
	out.println(data2 + "<br>");
	
	ArrayList<String> data3 = (ArrayList)session.getAttribute("data3");
	
	//out.println(data3.get(0) + "<br>");
	for(String lists : data3){
		out.println(lists +"<br>");
	}
%>