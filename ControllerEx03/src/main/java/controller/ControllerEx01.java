package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ZipcodeModel;
import model1.ZipcodeOkModel;

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
		// TODO Auto-generated method stub
		this.doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String action = request.getParameter("action");
			
			ZipcodeModel zipcodeModel = null;
			
			String url = "";
			
			// action에 따라 url의 값을 바꾼다.
			if( action == null || action.equals("") || action.equals("zipcode") ) {
				
				url = "/WEB-INF/zipcodes/zipcode.jsp";
				
			} else if( action.equals("zipcode_ok") ) {
				// 모델 호출
				zipcodeModel = new ZipcodeOkModel();
				// model.execute();
				zipcodeModel.execute(request, response);
				
				url = "/WEB-INF/zipcodes/zipcode_ok.jsp";
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
