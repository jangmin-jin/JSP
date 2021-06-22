<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="model1.BoardTO" %>
<%@page import="java.util.ArrayList" %>

<%
	ArrayList<BoardTO> datas = (ArrayList)request.getAttribute("datas");
	
	// 총 글 개수는 datas의 size와 같다.
	int totalRecode = datas.size();
	
	// html 출력을 위한 StringBuilder
	StringBuilder sbHtml = new StringBuilder();
	
	// to를 이용하여 출력 변수에 값을 저장
	// sbHtml에 append 한다.
	// 하단 html 본문에서 변수 출력
	for(BoardTO to : datas){
		String seq = to.getSeq();
		String subject = to.getSubject();
		String writer = to.getWriter();
		String wdate = to.getWdate();
		String hit = to.getHit();
		int wgap = to.getWgap();
		
		sbHtml.append("<tr>");
		sbHtml.append("<td>&nbsp;</td>");
		sbHtml.append("<td>" + seq + "</td>");
		sbHtml.append("<td class='left'><a href='./view.do?seq=" + seq +"'>" + subject); 
		if( wgap == 0 ){
			sbHtml.append("</a>&nbsp;<img src='./images/icon_new.gif' alt='NEW'>");
		}
		sbHtml.append("</td>");
		sbHtml.append("<td>" + writer + "</td>");
		sbHtml.append("<td>" + wdate + "</td>");
		sbHtml.append("<td>" + hit + "</td>");
		sbHtml.append("<td>&nbsp;</td>");
		sbHtml.append("</tr>");
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board_list.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
	<div class="contents_sub">
		<div class="board_top">
			<div class="bold">총 <span class="txt_orange">
				<%=totalRecode %>
			</span>건</div>
		</div>

		<!--게시판-->
		<div class="board">
			<table>
			<tr>
				<th width="3%">&nbsp;</th>
				<th width="5%">번호</th>
				<th>제목</th>
				<th width="10%">글쓴이</th>
				<th width="17%">등록일</th>
				<th width="5%">조회</th>
				<th width="3%">&nbsp;</th>
			</tr>
			<!-- 글 시작 -->
			<%= sbHtml.toString() %>
			<!--  글 끝 -->
			</table>
		</div>	
		<!--//게시판-->

		<div class="align_right">
			<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='./write.do'" />
		</div>
	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>
