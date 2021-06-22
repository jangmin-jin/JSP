<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- gugudan.jsp -->
<%
	request.setCharacterEncoding("utf-8");

// 처음 로딩시 값을 이미 가지고있는지 검사 후 걸러준다.
	String sStartdan = request.getParameter("startdan") == null ? "" : request.getParameter("startdan");
	String sEnddan = request.getParameter("enddan") == null ? "" : request.getParameter("enddan");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 구하기</title>
<script type="text/javascript">

// dom과 함수를 이용한 방법
// 버튼을 누르면 요소에 값 추가후 submit실행
	window.onload = function() {
		document.getElementById("btn").onclick = function(){
			//alert("test");
			const startdan = document.frm.startdan.value;
			const enddan = document.frm.enddan.value;
			
			if (startdan.trim() == "" || enddan.trim() == "" ){
				alert("값을 입력해주세영");
				// 함수 종료
				document.frm.startdan.value="";
				document.frm.enddan.value="";
				return;
			} 
			
			document.frm.submit();
		}
	};
	
</script>
</head>
<body>
 <!-- 페이지명이 똑같아야함 -->
 <form action="./gugudan3.jsp" method="post" name="frm">
 
 시작단<input type="text" name="startdan">
 끝단<input type="text" name="enddan">
 
 <input type="button" id="btn" value="구구단 출력">
  </form>

<% 
	// 초기 실행
	if(sStartdan.equals("") || sEnddan.equals("")){
		out.println("처음실행때는 Null 값이라 여기에 걸린다.");
	// 버튼을 눌려 다시 로딩했을 경우
	}else{
		int iStartDan = Integer.parseInt(sStartdan);
		int iEndDan = Integer.parseInt(sEnddan);
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("<hr>");
		sb.append("<table border='1' >");
		for(int i=iStartDan-1; i<=iEndDan; i++){
			sb.append("<tr>");
			for(int j=0; j<=9; j++){
				if(i==iStartDan-1 && j == 0){
					sb.append("<td>");
					sb.append("</td>");
				} else if( i == iStartDan-1){
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
		
		out.println(sb.toString());
	}
%>
</body>
</html>