<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키의 유효 시간을 만료 시켜버린다.

	Cookie cookie1 = new Cookie("login_id", "");
	Cookie cookie2 = new Cookie("login_grade", "");

	// 0이나 -1 주면된다.
	cookie1.setMaxAge(0);
	cookie2.setMaxAge(0);
	
	response.addCookie(cookie1);
	response.addCookie(cookie2);
	
	out.println( "<script type='text/javascript'>" );
	out.println( "alert( '로그아웃 되었습니다.' );" );
	out.println( "location.href='loginForm.jsp';" );
	out.println( "</script>" );
%>