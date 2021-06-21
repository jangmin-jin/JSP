<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 파일업로드를 위해선 반드시 post형식의 method를 사용해야 한다.
	2. form 안에 enctype = "multipart/form-data" 를 넣어줘야한다.
	3. input type은 무조건 file이다.
 -->
	<form action="form_ok.jsp" method="post" enctype="multipart/form-data">
		파일 1 <input type="file" name="upload1"><br>
		아이디 <input type="text" name="id"><br>
		<input type="submit" value="파일 업로드"><br>
		
	</form>
</body>
</html>