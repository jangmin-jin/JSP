<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.NamingException" %>

<%@page import="javax.sql.DataSource" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>

<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="java.io.File"%>

<%
	String uploadPath = "C:/JSP/eclipse-workspace/day_047/src/main/webapp/upload";

	int maxFileSize = 1024*1024*2;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest( request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy() ) ;

	String seq = multi.getParameter("seq");
	String cpage = multi.getParameter("cpage");
	
	String subject = multi.getParameter("subject");
	String password = multi.getParameter("password");
	String content = multi.getParameter("content");
	String mail = "";
	if(!multi.getParameter("mail1").equals("") || !multi.getParameter("mail2").equals("")){
		mail = multi.getParameter("mail1") + "@" +multi.getParameter("mail2");
	};
	// 기존파일
	String oldFilename = null;
	
	// 새롭게 업로드 된 파일명과 크기
	String newFilename = multi.getFilesystemName("upload");
	File newFile = multi.getFile("upload");
	long newfilesize = 0;
	if(newFile != null){
		newfilesize = newFile.length();
	}
	
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
		
		// 이미 등록되어 있던 파일에 대한 정보를 가져옴
		String sql = "select filename from pds_board1 where seq=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		rs = pstmt.executeQuery();
		
		// 읽었을때 oldFilename에 값이 있으면 받아온다.
		if( rs.next() ){
			oldFilename = rs.getString("filename");
		}
		
		if( newFilename != null ){
			// 새로 파일을 넣어주는 경우에는 새로운 파일 정보도 갱신
			sql = "update pds_board1 set subject=?, content=?, mail=?, filename=?, filesize=? where seq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, mail);
			pstmt.setString(4, newFilename);
			pstmt.setLong(5, newfilesize);
			pstmt.setString(6, seq);
			pstmt.setString(7, password);
		}else{
			// 새로 파일을 안넣었을 때는 나머지만 바꿔줄거임
			sql = "update pds_board1 set subject=?, content=?, mail=? where seq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, mail);
			pstmt.setString(4, seq);
			pstmt.setString(5, password);
		}
		
		// 0: 비밀번호 틀림, 1: 수정 성공, 2: 에러
		int result = pstmt.executeUpdate();
		if( result == 0){
			flag = 1;
		}else if( result == 1 ){
			flag = 0;
		}
		
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
		out.println("alert('게시글 수정에 성공하였습니다.');");
		
		// 새로운 파일 데이터가 있어야 하고, 이전 파일이 존재해야 이전파일을 삭제할 수 있음.
		if( newFilename != null && oldFilename != null ){
			File file = new File( uploadPath + "/" + oldFilename);
			file.delete();
		}
		out.println("location.href='board_view1.jsp?cpage=" + cpage + "&seq=" + seq + "';");
		
	}else if(flag == 1){
		out.println("alert('비밀번호가 일치하지 않습니다!');");
		
		// 비밀번호가 일치하지 않았을때에도 무조건 업로드 되어버리는 파일 삭제
		if( newFilename != null){
			File file = new File( uploadPath + "/" + newFilename);
			file.delete();
		}
		out.println("history.back();");
	}else{
		out.println("alert('게시글 수정에 실패하였습니다. 관리자에게 문의해주세요.');");rk todaud
		
		// 오류가 발생했을 때에도 무조건 업로드 되어버리는 파일 삭제
		if( newFilename != null){
			File file = new File( uploadPath + "/" + newFilename);
			file.delete();
		}
		out.println("history.back();");
	}
	out.println("</script>");
%>