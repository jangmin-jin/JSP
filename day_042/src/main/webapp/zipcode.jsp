<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 접속한 이름들이 다르니께 그걸 구분해주는 녀석들 -->
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<!-- xml 파일에 기술된 Datasource와 같음 -->
<%@ page import="javax.sql.DataSource" %>
    
<!-- 기존 DriverManager 임포트가 빠진다 -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

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
		// input text 박스에 입력한 동 값
		String inputDong = sDong;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		try{
			// Context를 이용한 연결 
			Context initCtx = new InitialContext();
			// 자바의 환경에서 찾는다
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
			
			// 연결
			conn = dataSource.getConnection();
	
			String sql = "select zipcode, sido, gugun, dong, ri, bunji from zipcode where dong like (?)";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, inputDong +"%");
			
			rs=pstmt.executeQuery();

			sb.append("<table>");
			while(rs.next()){
				sb.append("<tr>");
				sb.append("<td>").append(rs.getString("zipcode")).append("</td>");
				sb.append("<td>").append(rs.getString("sido")).append("</td>");
				sb.append("<td>").append(rs.getString("gugun")).append("</td>");
				sb.append("<td>").append(rs.getString("dong")).append("</td>");
				sb.append("<td>").append(rs.getString("ri")).append("</td>");
				sb.append("<td>").append(rs.getString("bunji")).append("</td>");
				sb.append("</tr>");
			}
			sb.append("</table>");
			
			out.println(sb.toString());
		// Exception도 맞게 바꾸어 준다.
		}catch(NamingException e){
			System.out.println("에러 : " + e.getMessage());
		// sql구문 에러 발견신 에러메세지
		}catch(SQLException e){
			System.out.println("에러 : " + e.getMessage());
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
%>
	
</body>
</html>