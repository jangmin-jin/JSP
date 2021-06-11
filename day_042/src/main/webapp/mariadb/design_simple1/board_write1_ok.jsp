<%@page import="javax.naming.NameNotFoundException"%>
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
	
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String mail = "" ;
	// 메일은 양쪽칸에 전부다 입력했을 때만 값을 받는다.
	if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
		mail = request.getParameter("mail1")+"@"+request.getParameter("mail2");
	}
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	// 아이피 주소는 getRemoteAddr로 받아온다.
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
		
		// 데이터 삽입
		String sql = "insert into board1 values (0, ?, ?, ?, ?, ?, 0, ?, now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, writer);
		pstmt.setString(3, mail);
		pstmt.setString(4, password);
		pstmt.setString(5, content);
		pstmt.setString(6, wip);
		
		// 데이터 확인
		//System.out.println(subject);
		//System.out.println(writer);
		//System.out.println(mail);
		//System.out.println(password);
		//System.out.println(content);
		//System.out.println(wip);
		
		if( pstmt.executeUpdate() == 1 ){
			flag = 0;
		};
		
	} catch (NamingException e){
		System.out.println("[에러] : " + e.getMessage());
	} catch (SQLException e){
		System.out.println("[에러] : " + e.getMessage());
	} finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	/*
	if(flag == 0){
		response.sendRedirect("board_list1.jsp");
	}else{
		response.sendRedirect("board_write1.jsp");	
	}
	*/
	
	// html 처리하기 위해 script 파트 선언
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('성공적으로 게시되었습니다.');");
		out.println("location.href='board_list1.jsp';");
	}else{
		out.println("alert('게시글 작성에 실패했습니다 관리자에게 문의해주세요');");
		out.println("history.back();");
	}
	out.println("</script>");
%>