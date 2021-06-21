package servlet1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalenderEx01 extends HttpServlet {
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
		resp.setContentType("text/html;charset=utf-8");
		
		StringBuilder sbHtml = new StringBuilder();
		// 년 월 일
		// 년/ 월 : 넘어온 값을 받는다.
		String year = req.getParameter("year") == null ? "" : req.getParameter("year");
		String month = req.getParameter("month") == null ? "" : req.getParameter("month");
		
		sbHtml.append( "<!DOCTYPE html>" );
		sbHtml.append("<html>");
		sbHtml.append("<head>");
		sbHtml.append("<meta charset='utf-8'>");
		sbHtml.append("<title>Insert title here</title>");
		sbHtml.append("</head>");
		sbHtml.append("<body>");
		
		sbHtml.append("<form action='./calender01' method='post' name='frm'>");
		sbHtml.append("<select name='year'>");
		sbHtml.append("<option> 2021</option>");
		sbHtml.append("<option> 2022</option>");
		sbHtml.append("<option> 2023</option>");
		sbHtml.append("</select>년");
		sbHtml.append("<select name='month'>");
		sbHtml.append("<option>1</option>");
		sbHtml.append("<option>2</option>");
		sbHtml.append("<option>3</option>");
		sbHtml.append("<option>4</option>");
		sbHtml.append("<option>5</option>");
		sbHtml.append("<option>6</option>");
		sbHtml.append("<option>7</option>");
		sbHtml.append("<option>8</option>");
		sbHtml.append("<option>9</option>");
		sbHtml.append("<option>10</option>");
		sbHtml.append("<option>11</option>");
		sbHtml.append("<option>12</option>");
		sbHtml.append("</select>월");
		sbHtml.append("<input type='submit' value='달력 보기'>");
		sbHtml.append("</form>");
		
		// 연, 월 값이 있을때만 출력할거임
		if(!year.equals("") && !month.equals("")) {
			int iYear = Integer.parseInt(year);
			int iMonth = Integer.parseInt(month);
			
			// 시작요일
			int startDayOfWeek = 0;
			int endDayOfWeek = 0;
			// 끝나는 날짜 27, 28, 30, 31
			int endDay = 0;
			
			Calendar sDay = Calendar.getInstance();
			Calendar eDay = Calendar.getInstance();
			
			sDay.set(iYear, iMonth-1, 1);
			eDay.set(iYear, iMonth, 1-1);
			
			startDayOfWeek = sDay.get(Calendar.DAY_OF_WEEK); // 시작요일
			endDayOfWeek = eDay.get(Calendar.DAY_OF_WEEK); // 끝나는 요일
			endDay = eDay.get(Calendar.DATE); // 마지막 날짜. 30일까지면 30, 아니면 31

			sbHtml.append("<table border='1' width='200'>");
			sbHtml.append("<tr>").append("<td colspan='7'>");
			sbHtml.append(iYear).append("년&nbsp").append(iMonth).append("월&nbsp").append("달력").append("<br>");
			sbHtml.append("</td>").append("</tr>");
			
			// 일요일 : 빨간색 / 토요일 : 파란색
			sbHtml.append("<tr>");
			sbHtml.append("<td>").append("<font color='red'>SU</font>").append("</td>");
			sbHtml.append("<td>").append("MO").append("</td>");
			sbHtml.append("<td>").append("TU").append("</td>");
			sbHtml.append("<td>").append("WE").append("</td>");
			sbHtml.append("<td>").append("TH").append("</td>");
			sbHtml.append("<td>").append("FR").append("</td>");
			sbHtml.append("<td>").append("<font color='blue'>SA</font>").append("</td>");
			sbHtml.append("</tr>");
			
			if(!year.equals("") && !month.equals("")) {
				// 시작 일까지 빈칸 추가
				sbHtml.append( "<tr>" );
				for( int i=1 ; i<startDayOfWeek ; i++ ) {
					sbHtml.append( "<td></td>" );
				}
				
				for( int i=1, n=startDayOfWeek ; i<=endDay ; i++, n++ ) {
					// 일요일 (한주의 시작) - 빨간색
					if( n % 7 == 1 ) {
						sbHtml.append( "<tr>" );
						sbHtml.append( "<td><b><font color='red'>" + i + "</font></b></td>" );
						
					// 월~금 - 검정색
					} else if(n%7 != 1 && n%7 != 0){
						sbHtml.append( "<td><b>" + i + "</b></td>" );
						
					// 토요일 - 파란색
					} else if(n%7 == 0){
						sbHtml.append( "<td><b><font color='blue'>" + i + "</font></b></td>" );
						sbHtml.append( "</tr>" );
					}
				}
				// 끝날짜에 맞춰 빈칸 추가하기
				for( int i=endDayOfWeek ; i<=6 ; i++ ) {
					sbHtml.append( "<td></td>" );
				}
				sbHtml.append( "</tr>" );
				sbHtml.append( "</table>" );
			}
		}
		
		sbHtml.append("</body>");
		sbHtml.append("</html>");
		
		PrintWriter out = resp.getWriter();
		
		out.println( sbHtml );
		out.close();
	}
} 