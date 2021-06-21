<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hello JSP<br>
	<%
		// web.xml에 내가 추가해준 뇨속들을 가지고 온다.
		java.util.Enumeration<String> initParamEnum = application.getInitParameterNames();
		while( initParamEnum.hasMoreElements() ){
			String initParamName = initParamEnum.nextElement();
			out.println( initParamName + "<br>" );
		}
	%>
</body>
</html>