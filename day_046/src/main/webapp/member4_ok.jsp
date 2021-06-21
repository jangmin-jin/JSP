<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member3_ok -->
<!-- TO의 선언과 to 값 이용하기 -->
<!-- to 출력하기 -->
<jsp:useBean id="to" class="pack.MemberTO"></jsp:useBean>
<jsp:setProperty property="id" name="to" value="tester"/>
<jsp:setProperty property="password" name="to" value="1234"/>
<jsp:getProperty property="id" name="to"/><br>
<jsp:getProperty property="password" name="to"/><br>