<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int flag = 1;
	
	Cookie[] cookies = request.getCookies();
	
	if( cookies != null && cookies.length > 0 ){
		for( int i=0; i<cookies.length; i++ ){
			// 아이디가 정상적으로 들어갔는지 쿠키에서 체크한다.
			// 쿠키가 들어갔으면 login_id가 존재할테니 그것을 기준으로 한다.
			if( cookies[i].getName().equals("login_id") ){
				flag = 0;
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if ( flag ==1 ){
		out.println( "<script type='text/javascript'>" );
		out.println( "alert( '로그인하셔야 합니다' );" );
		out.println( "location.href='loginForm.jsp';" );
		out.println( "</script>" );
	} else {
		out.println( "로그인 되었습니다. <br>" );
		out.println( "<a href='logoutCheck.jsp'>로그아웃</a>" );
	}
%>

</body>
</html>