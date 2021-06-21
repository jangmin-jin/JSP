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
	
	// 변경해야하는 데이터set
	// 제목
	// 내용
	// 이메일
	String subject = request.getParameter("subject");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String seq = request.getParameter("seq");
	String mail = "";
	if(!request.getParameter("mail1").equals("") || !request.getParameter("mail2").equals("")){
		mail = request.getParameter("mail1") + "@" +request.getParameter("mail2");
	};
	
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
		String sql = "update rep_board1 set subject=?, content=?, mail=? where seq=? and password=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, content);
		pstmt.setString(3, mail);
		pstmt.setString(4, seq);
		pstmt.setString(5, password);
		
		// 데이터 확인
		System.out.println(subject);
		System.out.println(content);
		System.out.println(mail);
		System.out.println(seq);
		System.out.println(password);
		
		// 0: 비밀번호 틀림, 1: 수정 성공, 2: 에러
		int result = pstmt.executeUpdate();
		if( result == 0){
			flag = 1;
		}else if( result == 1 ){
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
	
	// html 처리하기 위해 script 파트 선언
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('게시글 수정에 성공하였습니다.');");
		out.println("location.href='board_list1.jsp';");
	}else if(flag == 1){
		out.println("alert('비밀번호가 일치하지 않습니다!');");
		out.println("history.back();");
	}else{
		out.println("alert('게시글 수정에 실패하였습니다. 관리자에게 문의해주세요.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>