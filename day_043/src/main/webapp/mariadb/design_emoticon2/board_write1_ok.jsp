<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.NamingException" %>

<%@page import="javax.sql.DataSource" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<%

	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String mail = "";
	if(!mail1.equals("") && !mail2.equals("")){
		mail = request.getParameter("mail1") +"@"+ request.getParameter("mail2");
	}
	String emot = request.getParameter("emot").replaceAll("emot", "");
	String wip = request.getRemoteAddr();

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int flag = 1;
	try{
		// 연결
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
				
		conn = dataSource.getConnection();
		
		String sql ="insert into emot_board1 values(0, ?, ?, ?, ?, ?, ?, 0, ?, now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, writer);
		pstmt.setString(3, mail);
		pstmt.setString(4, password);
		pstmt.setString(5, content);
		pstmt.setString(6, emot);
		pstmt.setString(7, wip);
		
		if(pstmt.executeUpdate() == 1){
			flag = 0;
		};
		
	}catch(NamingException e){
		System.out.println("[에러] :" + e.getMessage());
	}catch(SQLException e){
		System.out.println("[에러] :" + e.getMessage());
	}finally{
		if( conn != null ) conn.close();
		if( pstmt != null ) pstmt.close();
	}
	
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('성공적으로 게시되었습니다.');");
		out.println("location.href='board_list1.jsp';");
	}else{
		out.println("alert('게시글 작성에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>