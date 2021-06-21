<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member3_ok -->
<!-- TO의 선언과 to 값 이용하기 -->
<jsp:useBean id="to" class="pack.MemberTO"></jsp:useBean>
<jsp:setProperty property="id" name="to" value="tester"/>
<jsp:setProperty property="password" name="to" value="1234"/>
<%
	out.println(to.getId() + "<br>");
	out.println(to.getPassword() + "<br>");
%>