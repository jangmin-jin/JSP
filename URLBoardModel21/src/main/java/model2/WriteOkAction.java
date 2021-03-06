package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class WriteOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("WriteOkAction url 호출");
		
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
		
		request.setAttribute("flag", flag);
	}
}