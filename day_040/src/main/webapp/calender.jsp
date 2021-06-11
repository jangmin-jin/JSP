<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	StringBuilder sbHtml = new StringBuilder();
	
	int year = 2021;
	int month = 6;
	
	// 시작요일
	int startDayOfWeek = 0;
	// 끝나는 날짜 27, 28, 30, 31
	int endDay = 0;
	
	Calendar startCalendar = Calendar.getInstance();
	Calendar endCalendar = Calendar.getInstance();
	
	startCalendar.set(year , month-1, 1); // 6월 1일
	endCalendar.set(year, month, 1-1); // 6월 31일
	startDayOfWeek = startCalendar.get(Calendar.DAY_OF_WEEK); // 시작요일
	endDay = endCalendar.get(Calendar.DATE); // 마지막 날짜. 30일까지면 30, 아니면 31
	
	sbHtml.append("<table border='1'>");
	sbHtml.append("<tr>").append("<td colspan='7'>");
	sbHtml.append(year).append("년&nbsp").append(month).append("월&nbsp").append("달력").append("<br>");
	sbHtml.append("</td>").append("</tr>");
	

	sbHtml.append("<tr>");
	sbHtml.append("<td>").append("SU").append("</td>");
	sbHtml.append("<td>").append("MO").append("</td>");
	sbHtml.append("<td>").append("TU").append("</td>");
	sbHtml.append("<td>").append("WE").append("</td>");
	sbHtml.append("<td>").append("TH").append("</td>");
	sbHtml.append("<td>").append("FR").append("</td>");
	sbHtml.append("<td>").append("SA").append("</td>");
	sbHtml.append("</tr>");
	
	int emptySpace = 1;
	for(int i=1, n=startDayOfWeek, count=1; i<=endDay; i++, n++, count++){
		
		// 시작 요일을 기준으로 앞에 공백을 넣어준다.
		if(n == startDayOfWeek && count == 1){
			sbHtml.append("<tr>");
			for(int j=1; j<startDayOfWeek; j++){
				sbHtml.append("<td>").append("&nbsp").append("</td>");
			}
			
		}else if(n%7 == 1){
			sbHtml.append("<tr>");
		}
		
		// 날짜 출력
		sbHtml.append("<td>");
		sbHtml.append("<b>").append( i ).append("</b>");
		sbHtml.append("</td>");
		
		// 7번째마다 줄바꿈
		if(n%7 == 0){
			sbHtml.append("</tr>");
		}
		
		// 날짜 출력이 끝에 도달하는 순간 뒤에 빈공간을 채워주기 위함
		if(count == endDay){
			if(endDay == 30){
				for(int j=1; j<=startDayOfWeek; j++){
					sbHtml.append("<td>").append("&nbsp").append("</td>");
				}
				sbHtml.append("</tr>");
			}else if(endDay == 31){
				for(int j=1; j<startDayOfWeek; j++){
					sbHtml.append("<td>").append("&nbsp").append("</td>");
				}
				sbHtml.append("</tr>");
			}
		}
	}
	sbHtml.append("</table>");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=sbHtml.toString() %>

</body>
</html>