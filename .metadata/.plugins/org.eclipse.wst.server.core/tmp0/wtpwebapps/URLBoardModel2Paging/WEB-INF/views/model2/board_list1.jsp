<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardListTO"%>

<%
	BoardListTO listTO = (BoardListTO)request.getAttribute("listTO");
	
	// BoardListTO의 변경된 값들을 받아온다.
	int cpage = listTO.getCpage();
	int blockPerPage = listTO.getBlockPerPage();
	int totalPage = listTO.getTotalPage();
	int totalRecord = listTO.getTotalRecord();
	int totalDivPage = listTO.getTotalDivPerPage();
	
	// 변경된 BoardListTO의 값을 BoardeLists (ArrayList<BoardTO>형식)를 통해 가져온다.
	ArrayList<BoardTO> datas = listTO.getBoardLists();
	
	// 출력을 위한 StringBuilder 선언
	StringBuilder sbHtml = new StringBuilder();
	
	// BoardTO 에서 값을 추출.
	for( BoardTO to : datas ) {
		String seq = to.getSeq();
		String subject =to.getSubject();
		String writer = to.getWriter();
		String wdate = to.getWdate();
		String hit = to.getHit();
		int wgap = to.getWgap();
		
		// 출력
		sbHtml.append( "<tr>" );
		sbHtml.append( "	<td>&nbsp;</td>" );
		sbHtml.append( "	<td>" + seq + "</td>" );
		sbHtml.append( "	<td class='left'>" );
		sbHtml.append( "		<a href='./view.do?seq=" + seq + "&cpage="+ cpage +"'>" + subject + "</a>" );
		if( wgap == 0 ) {
			sbHtml.append( "	&nbsp;<img src='./images/icon_new.gif' alt='NEW'>" );
		}
		sbHtml.append( "	</td>" );
		sbHtml.append( "	<td>" + writer + "</td>" );
		sbHtml.append( "	<td>" + wdate + "</td>" );
		sbHtml.append( "	<td>" + hit + "</td>" );
		sbHtml.append( "	<td>&nbsp;</td>" );
		sbHtml.append( "</tr>" );			
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
			<div class="bold">총 <span class="txt_orange"><%=totalRecord %></span>건</div>
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
<!-- 시작 -->
<%=sbHtml %>
<!-- 끝 -->
			</table>
		</div>	
		<!--//게시판-->

		<div class="align_right">
			<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='./write.do?cpage=<%=cpage %>'" />
		</div>
		
		<!--페이지넘버-->
		<div class="paginate_regular">
			<div align="absmiddle">
				<!-- << 버튼 -->
				<%
					if(cpage <= blockPerPage && cpage > 1){
						out.println("<span><a href='./list.do?cpage="+ 1 +"'>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}else if(cpage <= 1){
						out.println("<span><a>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}else{
						out.println("<span><a href='./list.do?cpage="+ (cpage - blockPerPage) +"'>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}
				%>

				<!-- < 버튼 -->
				<%
					if(cpage <= 1){
						out.println("<span><a>&lt;</a></span>");
						out.println("&nbsp;&nbsp;");
					}else{
						out.println( "<span><a href='./list.do?cpage="+ (cpage - 1) +"'>&lt;</a></span>" );
						out.println("&nbsp;&nbsp;");
					}
				%>
	
				<!-- 페이지 번호 선택 -->
				<%
					for( int i=0; i<=totalDivPage; i++ ){
						int startPage = (i*blockPerPage) + 1;
						int endPage = (i*blockPerPage) + 5;
						
						// 현재페이지가 1~5, 6~10, 11~15, 16~20 등 5개 단위로 끊어져있는 영역중 어디에 있는지를 기준으로
						if(startPage <= cpage && cpage <= endPage && i == totalDivPage){
							for( int j = startPage; j <= totalPage; j++){
								if( j == cpage ){
									out.println( "<span><a><b>["+ j +"]</b></a></span>" );
								}else{
									out.println( "<span><a href='./list.do?cpage="+ j +"'>"+ j +"</a></span>" );
								}
							}
						}else if( startPage <= cpage && cpage <= endPage ){
							for( int j = startPage; j <= endPage; j++){
								if( j == cpage ){
									out.println( "<span><a><b>["+ j +"]</b></a></span>" );
								}else{
									out.println( "<span><a href='./list.do?cpage="+ j +"'>"+ j +"</a></span>" );
								}
							}
						}
					}
				%>

				<!-- > 버튼 -->
				<%
					if(cpage >= totalPage){
						out.println("&nbsp;&nbsp;");
						out.println("<span><a>&gt;</a></span>");
					}else{
						out.println("&nbsp;&nbsp;");
						out.println( "<span><a href='./list.do?cpage="+ (cpage + 1) +"'>&gt;</a></span>" );
					}
				%>

				<!-- >> 버튼 -->
				<%
					if(cpage >= totalPage - blockPerPage && cpage < totalPage){
						out.println("&nbsp;");
						out.println("<span><a href='./list.do?cpage="+ totalPage +"'>&gt;&gt;</a></span>");
					}else if(cpage >= totalPage){
						out.println("&nbsp;");
						out.println("<span><a>&gt;&gt;</a></span>");
					}else{
						out.println("&nbsp;");
						out.println("<span><a href='./list.do?cpage="+ (cpage + blockPerPage) +"'>&gt;&gt;</a></span>");
					}
				%>
			</div>
		</div>
		<!--//페이지넘버-->
		
	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>
