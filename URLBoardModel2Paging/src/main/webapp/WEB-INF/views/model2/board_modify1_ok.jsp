<%@page import="model1.BoardListTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="model1.BoardTO"%>

<%
	int flag = (Integer)request.getAttribute("flag");

	BoardTO to = (BoardTO)request.getAttribute("to");
	String seq = to.getSeq();
	
	BoardListTO listTO = (BoardListTO)request.getAttribute("listTO");
	int cpage = listTO.getCpage();
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('글수정에 성공했습니다.');" );
		out.println( "location.href='./view.do?seq=" + seq + "&cpage=" + cpage + "';" );
	} else if( flag == 1 ) {
		out.println( "alert('비밀번호가 잘못되었습니다.');" );
		out.println( "history.back();" );
	} else if( flag == 2 ) {
		out.println( "alert('글수정에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
