<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	
	// html 처리하기 위해 script 파트 선언
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('성공적으로 게시되었습니다.');");
		out.println("location.href='./list.do';");
	}else{
		out.println("alert('게시글 작성에 실패했습니다 관리자에게 문의해주세요');");
		out.println("history.back();");
	}
	out.println("</script>");
%>