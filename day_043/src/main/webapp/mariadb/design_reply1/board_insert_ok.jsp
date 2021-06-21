<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.NamingException" %>

<%@page import="javax.sql.DataSource" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int flag = 1;
	try{
		// 연결
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
		
		conn = dataSource.getConnection();
		
		// 데이터 삽입
		String sql = "insert into board1 values (0, ?, ?, ?, ?, ?, 0, ?, now())";
		pstmt = conn.prepareStatement(sql);
		
		// 100개의 데이터 삽입
		for(int i=1; i<=30; i++){
			pstmt.setString(1, "제목" + i);
			pstmt.setString(2, "글쓴이" + i);
			pstmt.setString(3, "test@test.com");
			pstmt.setString(4, "1234");
			pstmt.setString(5, "제목" + i);
			pstmt.setString(6, "000.000.000.000");
			
			int result = pstmt.executeUpdate();
		}
		
	} catch (NamingException e){
		System.out.println("[에러] : " + e.getMessage());
	} catch (SQLException e){
		System.out.println("[에러] : " + e.getMessage());
	} finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}

	// html 처리하기 위해 script 파트 선언
	out.println("<script type='text/javascript'>");
		out.println("alert('성공적으로 게시되었습니다.');");
		out.println("location.href='board_list1.jsp';");
	out.println("</script>");
%>