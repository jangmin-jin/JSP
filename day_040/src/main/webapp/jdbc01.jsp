<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 연결을 위한 jdbc 드라이버 임포트 -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>

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
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		//out.println("드라이버 로딩 성공");
		System.out.println("드라이버 로딩 성공");
				
		conn = DriverManager.getConnection(url, user, password);
		//out.println("데이터 베이스 로딩 성공");
		System.out.println("드라이버 로딩 성공");
	// 드라이버 잘못 로딩된 경우 에러메세지
	}catch(ClassNotFoundException e){
		System.out.println("에러 : " + e.getMessage());
	// sql구문 에러 발견시 에러메세지
	}catch(SQLException e){
		System.out.println("에러 : " + e.getMessage());
	}finally{
		if(conn != null) conn.close();
	}
	//conn.close();
%>
</body>
</html>