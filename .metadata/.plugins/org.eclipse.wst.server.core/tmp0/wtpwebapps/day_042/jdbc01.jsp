<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jdbc01.jsp -->

<!-- 접속한 이름들이 다르니께 그걸 구분해주는 녀석들 -->
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<!-- xml 파일에 기술된 Datasource와 같음 -->
<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>

<%
	Connection conn = null;

	try{
		Context initCtx = new InitialContext();
		// 자바의 환경에서 찾는다
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		
		conn = dataSource.getConnection();
		System.out.println("데이터베이스 연결 성공");
	// 안써도 상관없음, 에러 보기위해서 적은거임, 끝나고 conn.close()만 해주면됨
	} catch(NamingException e){
		System.out.println("에러 : " + e.getMessage());
	} catch(SQLException e){
		System.out.println("에러 : " + e.getMessage());
	} finally {
		if(conn != null) conn.close();
	}

%>