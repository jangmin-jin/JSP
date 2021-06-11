<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 연결을 위한 jdbc 드라이버 임포트 -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "jdbc:mysql://localhost:3306/sample";
	String user = "root";
	String password = "123456";
	
	// try catch 가 안들어가도 괜찮다.
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
		String sql = "select deptno, dname, loc from dept";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		out.println("<table border='1' width='1'>");
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>" + rs.getString("deptno") + "</td>");
			out.println("<td>" + rs.getString("dname") + "</td>");
			out.println("<td>" + rs.getString("loc") + "</td>");
			out.println("</tr>");
		}
		out.println("</tabel>");
		
		
	// 드라이버 잘못 로딩된 경우 에러메세지
	}catch(ClassNotFoundException e){
		System.out.println("에러 : " + e.getMessage());
	// sql구문 에러 발견신 에러메세지
	}catch(SQLException e){
		System.out.println("에러 : " + e.getMessage());
	}finally{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	//conn.close();
%>
</body>
</html>