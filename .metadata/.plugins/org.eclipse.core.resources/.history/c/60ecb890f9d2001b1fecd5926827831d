<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.simple.BoardDAO"%>
<%@page import="model.simple.BoardTO"%>

<%
	request.setCharacterEncoding("utf-8");
	
	// to 를 통한 변수 선언
	BoardTO to = new BoardTO();
	to.setSubject(request.getParameter("subject"));
	to.setPassword(request.getParameter("password"));
	to.setContent(request.getParameter("content"));
	to.setSeq(request.getParameter("seq"));
	to.setMail("");
	if(!request.getParameter("mail1").equals("") || !request.getParameter("mail2").equals("")){
		to.setMail(request.getParameter("mail1") + "@" +request.getParameter("mail2"));
	};
	
	// dao 를 통한 함수 실행
	BoardDAO dao = new BoardDAO();
	int flag = dao.boardModifyOk(to);
	
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