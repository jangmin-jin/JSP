<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%> 

<%
	request.setCharacterEncoding("utf-8");
	
	//to를 통한 변수 선언
	BoardTO to = new BoardTO();
	to.setPassword(request.getParameter("password"));
	to.setSeq(request.getParameter("seq"));
	
	// dao를 통한 함수 실행
	BoardDAO dao = new BoardDAO();
	int flag = dao.boardDeleteOk(to);
	
	// html 처리하기 위해 script 파트 선언
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('게시글이 삭제되었습니다.');");
		out.println("location.href='board_list1.jsp';");
	}else if(flag == 1){
		out.println("alert('비밀번호가 일치하지 않습니다!');");
		out.println("history.back();");
	}else{
		out.println("alert('게시글삭제에 실패하였습니다. 관리자에게 문의해주세요.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>