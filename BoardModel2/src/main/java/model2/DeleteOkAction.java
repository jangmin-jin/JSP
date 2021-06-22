package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class DeleteOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("DeleteOkAction 호출");
		
		//to를 통한 변수 선언
		BoardTO to = new BoardTO();
		to.setPassword(request.getParameter("password"));
		to.setSeq(request.getParameter("seq"));
		
		// dao를 통한 함수 실행
		BoardDAO dao = new BoardDAO();
		int flag = dao.boardDeleteOk(to);
		
		request.setAttribute("flag", flag);
	}
}