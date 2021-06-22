<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="zipcodeModel.DeptTO" %>
<%@page import="zipcodeModel.DeptDAO" %>
<%@page import="java.util.ArrayList" %>

<% 	
	request.setCharacterEncoding("utf-8");
	
	String sDong = request.getParameter("searchZip") == null ? "" : request.getParameter("searchZip");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.searchZip{
		width:400px;
		height:20px;
	}
	div{
		border: 1px solid black;
		padding: 5px 100px;
		width:550px;
	}
	table{
		border: 1px solid black;
		border-collapse: collapse;
	}
	td{
		padding: 2px 5px;
		text-align: center;
		border: 1px solid black;
	}
</style>
</head>
<body>

<div>
	<form action="./zipcode.jsp" method="post" name="frm">
		<input type="text" class="searchZip" name="searchZip" placeholder="동이름 입력">
		<input type="submit" value="우편번호 검색">
	</form>
</div>
<hr>
	
<!-- 실행부 -->
<%
	if(sDong.equals("")){
		out.println("결과 :");
	}else if(sDong.length() < 2){
		out.println("두글자 이상 입력하세요");
	}else{
		request.setCharacterEncoding("utf-8");
		
		// input text 박스에 입력한 동 값
		String inputDong = sDong;
		
		DeptDAO dao = new DeptDAO();
		ArrayList<DeptTO> datas = dao.listZipcode(inputDong);
		
		StringBuilder sb = new StringBuilder();

		sb.append("<table>");
		for(DeptTO to : datas){
			sb.append("<tr>");
			sb.append("<td>").append(to.getZipcode()).append("</td>");
			sb.append("<td>").append(to.getSido()).append("</td>");
			sb.append("<td>").append(to.getGugun()).append("</td>");
			sb.append("<td>").append(to.getDong()).append("</td>");
			sb.append("<td>").append(to.getRi()).append("</td>");
			sb.append("<td>").append(to.getBunji()).append("</td>");
			sb.append("</tr>");
		}
		sb.append("</table>");
		
		out.println(sb.toString());
	}
%>
	
</body>
</html>