<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- gugudan_ok.jsp -->
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	int startDan = Integer.parseInt(request.getParameter("startdan"));
	int endDan = Integer.parseInt(request.getParameter("enddan"));
	
	StringBuilder sb = new StringBuilder();
	
	sb.append("<table border='1' >");
	for(int i=startDan-1; i<=endDan; i++){
		sb.append("<tr>");
		for(int j=0; j<=9; j++){
			if(i==startDan-1 && j == 0){
				sb.append("<td>");
				sb.append("</td>");
			} else if( i == startDan-1){
				sb.append("<td>").append(" X ").append(j).append("</td>");
			} else if( j == 0){
				sb.append("<td>").append(i).append(" 단").append("</td>");
			} else {
				sb.append("<td>").append(i).append(" X ").append(j).append(" = ").append(i*j).append("</td>");
			}
		}
		sb.append("<br>");
		sb.append("</tr>");
	}
	sb.append("</table>");
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 입력 받아 처리</title>
</head>
<body>

<%=sb.toString() %>

</body>
</html>