package model1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class View2Model implements ViewModel{

	@Override
	public void execute() {
		// TODO Auto-generated method stub
		System.out.println("View2Model execute() 호출");
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("View2Model execute(HttpServletRequest request, HttpServletResponse response) 호출");
	}
}