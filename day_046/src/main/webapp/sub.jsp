<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.println( "sub.jsp <br>" );

	// pageContext는 문서끼리 공유되지 않는다.
	out.println( (String)pageContext.getAttribute("data1") + "<br>" );
	
	//request 값은 연결된 문서끼리 공유한다.
	out.println( (String)request.getAttribute("data2") + "(sub)<br>" );
%>