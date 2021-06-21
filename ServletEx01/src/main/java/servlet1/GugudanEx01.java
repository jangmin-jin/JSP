package servlet1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GugudanEx01 extends HttpServlet {
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
		String data1  = (req.getParameter("data1")) == null ? "" : (req.getParameter("data1"));
		String data2  = (req.getParameter("data2")) == null ? "" : (req.getParameter("data2"));
		
		resp.setContentType("text/html;charset=utf-8");
		
		StringBuilder sbHtml = new StringBuilder();
		
		sbHtml.append( "<!DOCTYPE html>" );
		sbHtml.append("<html>");
		sbHtml.append("<head>");
		sbHtml.append("<meta charset='UTF-8'>"); 
		sbHtml.append("<title>Insert title here</title>");
		sbHtml.append("</head>");
		sbHtml.append("<body>");
		
		sbHtml.append("<form action='./gugudan01' method='post'>");
		sbHtml.append("시작단 <input type='text' name='data1'>");
		sbHtml.append("끝단 <input type='text' name='data2'>");
		sbHtml.append("<input type='submit' value='전송'>");
		sbHtml.append("</form>");
		
		// 데이터가 없으면 출력 안함
		if(!data1.equals("") && !data2.equals("")) {
			int startDan = Integer.parseInt(data1);
			int endDan = Integer.parseInt(data2);
			
			sbHtml.append("<hr>");
			sbHtml.append("<table border='1' >");
			for(int i=startDan-1; i<=endDan; i++){
				sbHtml.append("<tr>");
				for(int j=0; j<=9; j++){
					if(i==startDan-1 && j == 0){
						sbHtml.append("<td>");
						sbHtml.append("</td>");
					} else if( i == startDan-1){
						sbHtml.append("<td>").append(" X ").append(j).append("</td>");
					} else if( j == 0){
						sbHtml.append("<td>").append(i).append(" 단").append("</td>");
					} else {
						sbHtml.append("<td>").append(i).append(" X ").append(j).append(" = ").append(i*j).append("</td>");
					}
				}
				sbHtml.append("</tr>");
			}
			sbHtml.append("</table>");
		}

		sbHtml.append("</body>");
		sbHtml.append("</html>");
		
		PrintWriter out = resp.getWriter();
		
		out.println( sbHtml );
		out.close();
	}
}