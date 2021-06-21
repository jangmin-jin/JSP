<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_form_ok -->

<%
	request.setCharacterEncoding("utf-8");

	//String id = request.getParameter("id");
	//String password = request.getParameter("password");
%>
<!-- form에서 넘어온 값 받아서 출력하기 -->
<jsp:useBean id="to" class="pack.MemberTO"></jsp:useBean>
<%-- <jsp:setProperty property="id" name="to" value="<%=id %>"/> --%>
<%-- <jsp:setProperty property="password" name="to" value="<%=password %>"/> --%>
<!-- 직접 받을 수도 있다. -->
<%-- <jsp:setProperty property="id" name="to" value='<%=request.getParameter("id") %>'/> --%>
<%-- <jsp:setProperty property="password" name="to" value='<%=request.getParameter("password") %>'/> --%>

<!-- *을 이용해 자동으로 다 받아올 수 있다. -->
<jsp:setProperty property="*" name="to"/>
<jsp:getProperty property="id" name="to"/><br>
<jsp:getProperty property="password" name="to"/><br>