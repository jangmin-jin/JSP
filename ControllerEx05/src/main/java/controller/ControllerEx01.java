package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerEx01
 */
@WebServlet("*.do")
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

	protected void doProcess(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		//System.out.println(request.getRequestURI()); // ControllerEx05/*.do
		//System.out.println(request.getContextPath()); // ControllerEx05
	
		try {
			request.setCharacterEncoding("utf-8");
			
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			//ControllerEx05만 쏙 잡아서 지운다.
			
			// 가상의 디렉토리 / 파일명
			// 현재 경로 요청은 이런데
			// http://localhost:8080/ControllerEx05/view1.do
			// http://localhost:8080/ControllerEx05/view2.do
			
			// 경로 중간에 넣고 싶단 말이지.
			// http://localhost:8080/ControllerEx05/{{board}}/view1.do
			// http://localhost:8080/ControllerEx05/{{board}}/view2.do
			
			String url = "";
			if(path.equals("") || path.equals("/*.do") || path.equals("/view1.do")) {
				url = "/WEB-INF/views/view1.jsp";
			}else if(path.equals("/view2.do")) {
				url = "/WEB-INF/views/view2.jsp";
				
			}else if(path.equals("/board/view1.do")) {
				url = "/WEB-INF/views/view3.jsp";
			}else if(path.equals("/board/view2.do")) {
				url = "/WEB-INF/views/view4.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		} catch (UnsupportedEncodingException e) {
			System.out.println("에러 : " + e.getMessage());
		} catch (ServletException e) {
			System.out.println("에러 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
		
	}
}