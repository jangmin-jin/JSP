<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@page import="java.util.Calendar"%>
<%
	StringBuilder sbHtml = new StringBuilder();

	Calendar nDay = Calendar.getInstance();

	// 년 월 일
	int year = nDay.get(Calendar.YEAR);
	int month = nDay.get(Calendar.MONTH) +1;
	int day = nDay.get(Calendar.DATE);
	
	// 시작요일
	int startDayOfWeek = 0;
	int endDayOfWeek = 0;
	// 끝나는 날짜 27, 28, 30, 31
	int endDay = 0;
	
	Calendar sDay = Calendar.getInstance();
	Calendar eDay = Calendar.getInstance();
	
	sDay.set(year, month-1, 1);
	eDay.set(year, month, 1-1);
	
	startDayOfWeek = sDay.get(Calendar.DAY_OF_WEEK); // 시작요일
	endDayOfWeek = eDay.get(Calendar.DAY_OF_WEEK); // 끝나는 요일
	endDay = eDay.get(Calendar.DATE); // 마지막 날짜. 30일까지면 30, 아니면 31
	
	sbHtml.append("<table border='1' width='200'>");
	sbHtml.append("<tr>").append("<td colspan='7'>");
	sbHtml.append(year).append("년&nbsp").append(month).append("월&nbsp").append("달력").append("<br>");
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
	
	// 시작 일까지 빈칸 추가
	sbHtml.append( "<tr>" );
	for( int i=1 ; i<startDayOfWeek ; i++ ) {
		sbHtml.append( "<td></td>" );
	}
	
	int sunday = 0;
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
	for( int i=startDayOfWeek ; i<6 ; i++ ) {
		sbHtml.append( "<td></td>" );
	}

	sbHtml.append( "</tr>" );
	sbHtml.append( "</table>" );
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