<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- gugudan.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 구하기</title>
<script type="text/javascript">

// dom과 함수를 이용한 방법
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

 <form action="./gugudan_ok.jsp" method="post" name="frm">
 시작단<input type="text" name="startdan">
 끝단<input type="text" name="enddan">
 
 <input type="button" id="btn" value="구구단 출력">
 
 </form>

</body>
</html>