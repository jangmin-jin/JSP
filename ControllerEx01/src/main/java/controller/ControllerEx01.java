package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.View1Model;
import model1.View2Model;
import model1.ViewModel;

/**
 * Servlet implementation class ControllerEx01
 */
@WebServlet("/controller")
public class ControllerEx01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doProcess(request, response);
	}

	// try catch 하게 Exception 전부 제거 해줘야함.
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String action = request.getParameter("action");
			
			ViewModel model = null;
			
			String url = "";
			
			// action에 따라 url의 값을 바꾼다.
			if( action == null || action.equals("") || action.equals("view1") ) {
				// 모델 호출
				// View1Model model = new View1Model();
				model = new View1Model();
				// model.execute();
				model.execute(request, response);
				
				url = "./WEB-INF/views/view1.jsp";
				
			} else if( action.equals("view2") ) {
				// 모델 호출
				// View2Model model = new View2Model();
				model = new View2Model();
				// model.execute();
				model.execute(request, response);
				
				url = "./WEB-INF/views/view2.jsp";
			}
			
			// forward
			RequestDispatcher dispatcher =request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		} catch (UnsupportedEncodingException e) {
			System.out.println("[에러] : " + e.getMessage());
		} catch (ServletException e) {
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("[에러] : " + e.getMessage());
		}
		
	}
}