<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키의 생성과 추가
	Cookie cookie1 = new Cookie("data1", "value1");
	response.addCookie(cookie1);
	
	Cookie cookie2 = new Cookie("data2", "value2");
	response.addCookie(cookie2);
	
	// 확인
	out.println( cookie1.getName() + "<br>" );
	out.println( cookie1.getValue() + "<br>" );
%>