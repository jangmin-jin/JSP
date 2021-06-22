<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- dept1.jsp 
dept 를 잡아와서 출력하는걸 만들어봐라
-->
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.NamingException" %>

<%@page import="javax.sql.DataSource" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");

	StringBuilder sb = new StringBuilder();

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		// 연결
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
				
		conn = dataSource.getConnection();
		
		String sql ="select deptno, dname, loc from dept";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		sb.append("<h2>dept</h2>");
		sb.append("<table border='1' width='1'>");
		while(rs.next()){
			sb.append("<tr>");
			sb.append("<td>").append(rs.getString("deptno")).append("</td>");
			sb.append("<td>").append(rs.getString("dname")).append("</td>");
			sb.append("<td>").append(rs.getString("loc")).append("</td>");
			sb.append("</tr>");
		}
		sb.append("</table>");
		
	}catch(NamingException e){
		System.out.println("[에러] :" + e.getMessage());
	}catch(SQLException e){
		System.out.println("[에러] :" + e.getMessage());
	}finally{
		if( conn != null ) conn.close();
		if( pstmt != null ) pstmt.close();
		if( rs != null ) rs.close();
	}
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