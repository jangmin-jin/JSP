package servlet1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEx01 extends HttpServlet {
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println(" init(ServletConfig config) 호출");
	}
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println(" init() 호출");
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println(" destroy() 호출");
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청에 대한 처리 메소드
		
		response.setContentType("text/html;charset=utf-8");
		
		StringBuilder sbHtml = new StringBuilder();
		
		sbHtml.append( "<!DOCTYPE html>" );
		sbHtml.append("<html>");
		sbHtml.append("<head>");
		sbHtml.append("<meta charset=\"UTF-8\">");
		sbHtml.append("<title>Insert title here</title>");
		sbHtml.append("</head>");
		sbHtml.append("<body>");
		sbHtml.append("Hello Servlet ^^ ㅗ");
		sbHtml.append("</body>");
		sbHtml.append("</html>");
		
		PrintWriter out = response.getWriter();
		
		out.println( sbHtml );
		out.close();
	}
}