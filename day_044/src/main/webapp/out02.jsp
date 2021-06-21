<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	out.println(out.getRemaining() + "<br>");
	out.println("1<br>");
	out.println("2<br>");
	out.println("3<br>");
	
	// 버퍼 비우기, IOException은 발생하지 않는다.
	out.clearBuffer();
	out.println( out.getRemaining() + "<br>");
	
	out.println("4<br>");
	out.println("5<br>");
	out.println("6<br>");
	
	// 클라이언트에게 전송하고 버퍼 초기화
	out.flush();
	out.println( out.getRemaining() + "<br>");
	
	out.println("7<br>");
	out.println("8<br>");
	out.println("9<br>");
	
	out.println( out.getRemaining() + "<br>");
	
	// 강제로 닫아버린다.
	out.close();
	
	out.println("10<br>");
	
%>