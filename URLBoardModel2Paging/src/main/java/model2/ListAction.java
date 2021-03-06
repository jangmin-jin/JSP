package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardListTO;

public class ListAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ListAction url 호출");
		
		// BoardListTO 에 현제 cpage값 전달
		BoardListTO listTO = new BoardListTO();
		listTO.setCpage(1);
		if( request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			listTO.setCpage(Integer.parseInt( request.getParameter("cpage") ));
		}
		
		// 함수 실행을 위한 DAO 선언
		BoardDAO dao = new BoardDAO();
		// DAO에서 함수가 실행되면 BoardListTO의 값들이 변경된다.
		listTO = dao.boardList(listTO);
		
		request.setAttribute("listTO", listTO);
	}
}