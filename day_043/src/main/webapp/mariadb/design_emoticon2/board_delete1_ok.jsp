<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.NamingException" %>

<%@page import="javax.sql.DataSource" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String seq = request.getParameter("seq");
	String password = request.getParameter("password");
	
	out.println(seq);
	out.println(password);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int flag = 2;
	try{
		// 연결
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
		
		conn = dataSource.getConnection();
		
		// 데이터 삽입
		String sql = "delete from emot_board1 where seq=? and password=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		pstmt.setString(2, password);
		
		int result = pstmt.executeUpdate();
		if(result == 0){
			flag = 0;
		}else if(result == 1){
			flag = 1;
		};
		
		//out.println(result);
		//out.println(flag);
		
	} catch (NamingException e){
		System.out.println("[에러] : " + e.getMessage());
	} catch (SQLException e){
		System.out.println("[에러] : " + e.getMessage());
	} finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	
	// html 처리
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('비밀번호가 일치하지 않습니다.');");
		out.println("history.back();");
	}else if(flag == 1){
		out.println("alert('게시글이 삭제되었습니다');");
		out.println("location.href='board_list1.jsp'");
	}else{
		out.println("alert('게시글 삭제에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>