package model1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FormOkModel implements FormModel {

	@Override
	public void execute() {
		// TODO Auto-generated method stub
		System.out.println("excute() 호출");
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("excute(HttpServletRequest request, HttpServletResponse response) 호출");
		
		String data = request.getParameter("data");
		
		System.out.println("data : " + data);
	}
}