<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 여러개의 쿠키를 받아온다.
	Cookie[] cookies = request.getCookies();

	if(cookies != null && cookies.length > 0){
		for(int i=0; i<cookies.length; i++){
			out.println( cookies[i].getName() + "<br>" );
			out.println( cookies[i].getValue() + "<br>" );
		}
	} else {
		out.println("쿠키가 없워요");
	}
%>
</body>
</html>