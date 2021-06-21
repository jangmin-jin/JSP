<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- dept1.jsp 
dept 를 잡아와서 출력하는걸 만들어봐라
-->

<%@page import="model1.DeptTO" %>
<%@page import="model1.DeptDAO" %>
<%@page import="java.util.ArrayList" %>

<%
	request.setCharacterEncoding("utf-8");
	
	// 연결
	DeptDAO dao = new DeptDAO();
	// select 문 실행
	ArrayList<DeptTO> datas = dao.listDept();

	StringBuilder sb = new StringBuilder();

	sb.append("<h2>dept</h2>");
	sb.append("<table border='1' width='1'>");
	for(DeptTO to : datas){
		sb.append("<tr>");
		sb.append("<td>").append(to.getDeptno()).append("</td>");
		sb.append("<td>").append(to.getDname()).append("</td>");
		sb.append("<td>").append(to.getLoc()).append("</td>");
		sb.append("</tr>");
	}
	sb.append("</table>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%= sb.toString() %>

</body>
</html>