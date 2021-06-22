package service1;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ZipcodeDAO;
import model1.ZipcodeTO;

public class ZipcodeOkModel implements ZipcodeModel {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ZipcodeTO to = new ZipcodeTO();
		to.setDong( request.getParameter("dong") );
		
		//System.out.println( request.getParameter("dong") );
		
		ZipcodeDAO dao = new ZipcodeDAO();
		ArrayList<ZipcodeTO> lists = dao.zipcodeList(to);
		
		request.setAttribute("lists", lists);
	}
}