<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
버퍼 사이즈를 따로 정의해도 되고 1번줄에 추가해도 된다.

-->

<!-- 
autoFlush="false" 자동 비워줌 비활성화 : 4kb다 차면 에러남
autoFlush="true" 자동 비워줌 비활성화 : 4kb다 차면 자동으로 비워줌
-->
<%@ page buffer="4kb" autoFlush="true"%>

<%
	// 버퍼 사이즈는 기본 8kb임
	out.println("버퍼 사이즈 :" + out.getBufferSize() +"<br>");
	out.println("남은 공간 :" + out.getRemaining() +"<br>");
	
	for( int i=1; i<1000; i++){
		out.println(i + "Hello Jsp<br>");
		if(i%100 ==0){
			out.println("남은 공간 :" + out.getRemaining() +"<br>");
		}
	}
%>