package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class ListAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ListAction 호출");
		
		// dao 를 통한 함수 실행
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardTO> datas = dao.boardList();
		
		request.setAttribute("datas", datas);
	}
}