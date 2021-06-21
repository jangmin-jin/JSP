package servlet1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEx03 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// get이 불리면 doProcess로 넘김
		this.doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// post가 불리면 doProcess로 넘김
		this.doProcess(req, resp);
	}
	
	// doGet 과 doPost를 통합 처리한다.
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		
		String data = req.getParameter("data");
		
		resp.setContentType("text/html;charset=utf-8");
		
		StringBuilder sbHtml = new StringBuilder();
		
		sbHtml.append( "<!DOCTYPE html>" );
		sbHtml.append("<html>");
		sbHtml.append("<head>");
		sbHtml.append("<meta charset=\"UTF-8\">");
		sbHtml.append("<title>Insert title here</title>");
		sbHtml.append("</head>");
		sbHtml.append("<body>");
		sbHtml.append("Hello doProcess : " + data + "<br>");
		sbHtml.append("</body>");
		sbHtml.append("</html>");
		
		PrintWriter out = resp.getWriter();
		
		out.println( sbHtml );
		out.close();
	}
}
