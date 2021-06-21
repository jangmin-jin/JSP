<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// String 뿐만이 아니라 다양한 데이터 형식도 가능하다.
	session.setAttribute("data1", "value1");
	session.setAttribute("data2", "value2");
	
	ArrayList<String> lists = new ArrayList();
	lists.add("사과");
	lists.add("사과하십시오");
	lists.add("사과는역시");
	lists.add("충주사과");
	lists.add("충주사과!!!");
	
	session.setAttribute("data3", lists);
%>