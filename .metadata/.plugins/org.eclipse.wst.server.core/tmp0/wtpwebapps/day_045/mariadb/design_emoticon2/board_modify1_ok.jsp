<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.emoticon.BoardDAO"%>
<%@page import="model.emoticon.BoardTO"%>

<%
	request.setCharacterEncoding( "utf-8" );

	String seq = request.getParameter("seq");

	// to에 현재 정보 전달
	BoardTO to = new BoardTO();
	to.setSeq(request.getParameter( "seq" ));
	to.setSubject(request.getParameter( "subject" ));
	to.setMail("");
	if(!request.getParameter( "mail1" ).equals( "" ) && !request.getParameter( "mail2" ).equals( "" )) {
		to.setMail(request.getParameter( "mail1" ) + "@" + request.getParameter( "mail2" ));
	}
	to.setPassword(request.getParameter( "password" ));
	to.setContent(request.getParameter( "content" ));
	to.setEmot(request.getParameter( "emot" ).replaceAll( "emot", "" ));
	
	// 함수 실행을 위한 dao 선언
	BoardDAO dao = new BoardDAO();
	int flag = dao.boardModifyOk(to);
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('글수정에 성공했습니다.');" );
		out.println( "location.href='board_view1.jsp?seq=" + seq + "';" );
	} else if( flag == 1 ) {
		out.println( "alert('비밀번호가 잘못되었습니다.');" );
		out.println( "history.back();" );
	} else if( flag == 2 ) {
		out.println( "alert('글수정에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
