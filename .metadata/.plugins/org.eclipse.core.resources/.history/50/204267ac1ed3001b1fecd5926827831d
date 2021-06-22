<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	
	// html 처리하기 위해 script 파트 선언
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('게시글 수정에 성공하였습니다.');");
		out.println("location.href='./controller?action=list';");
	}else if(flag == 1){
		out.println("alert('비밀번호가 일치하지 않습니다!');");
		out.println("history.back();");
	}else{
		out.println("alert('게시글 수정에 실패하였습니다. 관리자에게 문의해주세요.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>