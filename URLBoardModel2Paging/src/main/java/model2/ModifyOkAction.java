package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardListTO;
import model1.BoardTO;

public class ModifyOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ModifyOkAction url 호출");
		
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
		
		BoardListTO listTO = new BoardListTO();
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		listTO.setCpage(cpage);
		
		System.out.println(cpage);
		
		// dao 를 통한 함수 실행
		BoardDAO dao = new BoardDAO();
		int flag = dao.boardModifyOk(to);
		
		request.setAttribute("flag", flag);
		request.setAttribute("to", to);
		request.setAttribute("listTO", listTO);
	}
}