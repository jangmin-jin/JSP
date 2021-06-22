<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력 보기</title>
</head>
<body>

<form action="./calender_ok.jsp" method="post" name="frm">
	<select name="year">
		<option> 2021</option>
		<option> 2022</option>
		<option> 2023</option>
	</select>년
	<select name="month">
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		<option>7</option>
		<option>8</option>
		<option>9</option>
		<option>10</option>
		<option>11</option>
		<option>12</option>
	</select>월
	
	<input type="submit" value="달력 보기">
</form>

</body>
</html>