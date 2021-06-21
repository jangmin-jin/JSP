<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.NamingException" %>

<%@page import="javax.sql.DataSource" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException" %>

<%@page import="java.io.File"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String password = request.getParameter("password");
	String seq = request.getParameter("seq");
	String cpage = request.getParameter("cpage");
	
	String uploadPath = "C:/JSP/eclipse-workspace/day_047/src/main/webapp/upload";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int flag = 2;
	try{
		// 연결
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
		
		conn = dataSource.getConnection();
		
		// 파일 삭제 를 위한 파일명 받아오기
		String sql = "select filename from pds_board1 where seq=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		rs = pstmt.executeQuery();
		
		String filename = null;
		if(rs.next()){
			filename = rs.getString("filename");
		}
		
		// 데이터 삽입
		sql = "delete from pds_board1 where seq=? and password=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		pstmt.setString(2, password);
		
		// 0: 비밀번호 틀림, 1: 삭제 성공, 2: 에러
		int result = pstmt.executeUpdate();
		if( result == 0){
			flag = 1;
		}else if( result == 1 ){
			flag = 0;
			
			// 삭제할때 파일이 있으면 파일도 삭제시킴
			if( filename != null ){
				File file = new File( uploadPath + "/" + filename);
				file.delete();
			}
		};
		
	} catch (NamingException e){
		System.out.println("[에러] : " + e.getMessage());
	} catch (SQLException e){
		System.out.println("[에러] : " + e.getMessage());
	} finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		if(rs != null) rs.close();
	}
	
	// html 처리하기 위해 script 파트 선언
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('게시글이 삭제되었습니다.');");
		out.println("location.href='board_list1.jsp?cpage=" + cpage + "';");
	}else if(flag == 1){
		out.println("alert('비밀번호가 일치하지 않습니다!');");
		out.println("history.back();");
	}else{
		out.println("alert('게시글삭제에 실패하였습니다. 관리자에게 문의해주세요.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>