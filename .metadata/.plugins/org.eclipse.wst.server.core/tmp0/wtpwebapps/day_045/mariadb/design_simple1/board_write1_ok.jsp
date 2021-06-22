<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>

<%
	request.setCharacterEncoding("utf-8");
	
	BoardTO to = new BoardTO();
	to.setSubject(request.getParameter("subject"));
	to.setWriter(request.getParameter("writer"));
	
	// 메일은 양쪽칸에 전부다 입력했을 때만 값을 받는다.
	to.setMail("");
	if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
		to.setMail(request.getParameter("mail1")+"@"+request.getParameter("mail2"));
	}
	to.setPassword(request.getParameter("password"));
	to.setContent(request.getParameter("content"));
	
	// 아이피 주소는 getRemoteAddr로 받아온다.
	to.setWip(request.getRemoteAddr());
	
	BoardDAO dao = new BoardDAO();
	int flag = dao.boardWriteOk(to);
	
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