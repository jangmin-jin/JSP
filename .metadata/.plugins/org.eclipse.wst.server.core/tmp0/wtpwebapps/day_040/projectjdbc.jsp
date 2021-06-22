<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 연결을 위한 jdbc 드라이버 임포트 -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%
	String url = "jdbc:mysql://localhost:3306/sample";
	String user = "root";
	String password = "123456";
	
	// try catch 가 안들어가도 괜찮다.
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuilder sb = new StringBuilder();
		
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
		String sql = "select name, stuno, classno from student";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		out.println("<table border='1' width='200'>");
		
		sb.append( "<tr>" );
		sb.append( "<td>" ).append( "이름" ).append( "</td>" );
		sb.append( "<td>" ).append( "번호" ).append( "</td>" );
		sb.append( "<td>" ).append( "반" ).append( "</td>" );
		sb.append( "</tr>" );
		while(rs.next()){
			sb.append( "<tr>" );
			sb.append( "<td>" ).append( rs.getString("name") ).append( "</td>" );
			sb.append( "<td>" ).append( rs.getString("stuno") ).append( "</td>" );
			sb.append( "<td>" ).append( rs.getString("classno") ).append( "</td>" );
			sb.append( "</tr>" );
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=sb.toString() %>
</body>
</html>