<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member1_ok -->
<%
	// pack.을 통해 접근하여 src/main/java에 있는 문서를 가져다 쓸 수 있다.
	pack.MemberTO to = new pack.MemberTO();

	to.setId("tester");
	to.setPassword("1234");
	
	out.println(to.getId() + "<br>");
	out.println(to.getPassword() + "<br>");
%>