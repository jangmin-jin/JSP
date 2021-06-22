<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 바로 다음 홈페이지로 이동한다
	// response.sendRedirect("https://www.daum.net");
	// 수행위치 : 요청 - 서버 -> 이동시킴
	
	// 자바스크립트를 바로 넣어줘도 된다.
	out.println("<script type='text/javascript'>");
	out.println("alert('페이지 이동')");
	out.println("location.href = 'https://www.daum.net' ;");
	out.println("</script>");
%>

<!-- 
	자바스크립트 버전
	수행위치가 다르다
	수행위치 : 요청 - 서버 - 클라이언트 -> 이동시킴
 -->
 <!--
	<script type="text/javascript">
		 location.href = "https://www.daum.net"; 
	</script>
-->