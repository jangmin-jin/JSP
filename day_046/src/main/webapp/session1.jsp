<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- session을 인스턴스화 시키지 않는다. : false -->
<!-- session을 인스턴스화 시킨다. : true -->
<%-- <%@ page session="true" %> --%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	out.println( session.getId() + "<br>" );
	SimpleDateFormat formatter = new SimpleDateFormat( "yyy-MM-dd HH:mm:ss" );
	
	Date time = new Date();
	time.setTime( session.getCreationTime() ); // 처음 생성된 시간 출력
	out.println( formatter.format( time ) + "<br>" );
	
	time.setTime( session.getLastAccessedTime() ); // 가장 최근에 열린 시간 출력
	out.println( formatter.format( time ) + "<br>" );
	
	// 세션 유효시간 확인하기
	out.println( session.getMaxInactiveInterval() +"초" );
%>