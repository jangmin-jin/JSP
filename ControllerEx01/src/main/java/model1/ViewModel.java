package model1;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface ViewModel {
	public void execute();
	public void execute(HttpServletRequest request, HttpServletResponse response);
}