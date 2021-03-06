package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardListTO;
import model1.BoardTO;

public class DeleteAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("DeleteAction url 호출");
		
		// to를 통한 변수 선언
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		
		BoardListTO listTO = new BoardListTO();
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		listTO.setCpage(cpage);
		
		// dao를 통한 함수 실행
		BoardDAO dao = new BoardDAO();
		to = dao.boardDelete(to);
		
		request.setAttribute("to", to);
		request.setAttribute("listTO", listTO);
	}
}