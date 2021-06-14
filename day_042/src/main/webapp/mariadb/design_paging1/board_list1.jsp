<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.NamingException" %>

<%@page import="javax.sql.DataSource" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>	
<%
	request.setCharacterEncoding("utf-8");

	int cpage = 1;
	
	// 데이터가 넘어오면 cpage에 페이지 값을 받는데 그게 아니면 무조건 1이다.
	if(request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")){
		cpage = Integer.parseInt(request.getParameter("cpage"));
	}
	
	// 페이지당 표시 개수
	int recordPerPage = 10;
	int totalRecode = 0;
	
	// 총 페이지 개수
	int totalPage = 1;
	
	// 페이지당 출력 개수
	int viewPageNo = 5;
	int divpage = 0;

	
	// 페이지 나눔 기준
	//int startViewPage[] = new int[divViewPage];
	//for(int i=0; i<divViewPage; i++){
	//	startViewPage[i] = (i * viewPageNo) + 1;
	//}
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	StringBuilder sbHtml = new StringBuilder();
	
	try{
		// 연결
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
		
		conn = dataSource.getConnection();
		
		// 데이터 삽입
		String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate,"
		+ " hit from board1 order by seq desc";
		
		// 게시글을 카운트 하기 위한 추가 선언
		pstmt = conn.prepareStatement
				(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		rs = pstmt.executeQuery();
		
		// 커서를 맨 마지막 데이터로 이동시킴
		rs.last();
		totalRecode = rs.getRow();
		// 커서를 맨 처음 데이터로 이동시킴
		rs.beforeFirst();
		
		totalPage = ( ( totalRecode - 1 ) / recordPerPage ) + 1;
		
		// 총 페이지수에 따른 페이지 나눔 설정
		divpage = ( totalPage / viewPageNo ) - 1 ;
		if( totalPage % viewPageNo > 0){
			divpage ++;
		}
		
		// 읽을 데이터의 위치
		int skip = ( cpage - 1 ) * recordPerPage;
		if( skip != 0 ) rs.absolute( skip );
		
		for(int i=0; i<recordPerPage && rs.next(); i++){
			String seq = rs.getString("seq");
			String subject = rs.getString("subject");
			String writer = rs.getString("writer");
			String wdate = rs.getString("wdate");
			String hit =rs.getString("hit") ;
			
			sbHtml.append("<tr>");
			sbHtml.append("<td>&nbsp;</td>");
			sbHtml.append("<td>" + seq + "</td>");
			sbHtml.append("<td class='left'><a href='board_view1.jsp?seq=" + seq +"'>" + subject 
					+ "</a>&nbsp;<img src='../../images/icon_new.gif' alt='NEW'></td>");
			sbHtml.append("<td>" + writer + "</td>");
			sbHtml.append("<td>" + wdate + "</td>");
			sbHtml.append("<td>" + hit + "</td>");
			sbHtml.append("<td>&nbsp;</td>");
		}
		
	} catch (NamingException e){
		System.out.println("[에러] : " + e.getMessage());
	} catch (SQLException e){
		System.out.println("[에러] : " + e.getMessage());
	} finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		if(rs != null) rs.close();
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board_list.css">
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
			<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
		</div>
		
				<!--페이지넘버-->
		<div class="paginate_regular">
			<div align="absmiddle">
				<!-- << 버튼 -->
				<%
					if(cpage <= viewPageNo && cpage > 1){
						out.println("<span><a href='board_list1.jsp?cpage="+ 1 +"'>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}else if(cpage <= 1){
						out.println("<span><a>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}else{
						out.println("<span><a href='board_list1.jsp?cpage="+ (cpage - 5) +"'>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}
				%>

				<!-- < 버튼 -->
				<%
					if(cpage <= 1){
						out.println("<span><a>&lt;</a></span>");
						out.println("&nbsp;&nbsp;");
					}else{
						out.println( "<span><a href='board_list1.jsp?cpage="+ (cpage - 1) +"'>&lt;</a></span>" );
						out.println("&nbsp;&nbsp;");
					}
				%>
	
				<!-- 페이지 번호 선택 -->
				<%
					for( int i=0; i<=divpage; i++ ){
						int startPage = (i*viewPageNo) + 1;
						int endPage = (i*viewPageNo) + 5;
						
						// 마지막 페이지를 totalPage까지만 표시하게 하고싶은데...
						/*
							if( endPage >= totalPage){
							for(int j = startPage; j <= totalPage; j++){
								if( j == cpage ){
									out.println( "<span><a><b>["+ j +"]</b></a></span>" );
								}else{
									out.println( "<span><a href='board_list1.jsp?cpage="+ j +"'>"+ j +"</a></span>" );
								}
							}
						}
						*/
						
						// 현재페이지가 1~5, 6~10, 11~15, 16~20 등 5개 단위로 끊어져있는 영역중 어디에 있는지를 기준으로
						 if( startPage <= cpage && cpage <= endPage ){
							for( int j = startPage; j <= endPage; j++){
								if( j == cpage ){
									out.println( "<span><a><b>["+ j +"]</b></a></span>" );
								}else{
									out.println( "<span><a href='board_list1.jsp?cpage="+ j +"'>"+ j +"</a></span>" );
								}
							}
						}
					}
				%>
					
					<!-- 
					else if(cpage > totalPage){
									out.println( "<span><a>"+ j +"</a></span>" );
								}
					 -->
				<!-- > 버튼 -->
				<%
					if(cpage >= totalPage){
						out.println("&nbsp;&nbsp;");
						out.println("<span><a>&gt;</a></span>");
					}else{
						out.println("&nbsp;&nbsp;");
						out.println( "<span><a href='board_list1.jsp?cpage="+ (cpage + 1) +"'>&gt;</a></span>" );
					}
				%>

				<!-- >> 버튼 -->
				<%
					if(cpage >= totalPage - viewPageNo && cpage < totalPage){
						out.println("&nbsp;");
						out.println("<span><a href='board_list1.jsp?cpage="+ totalPage +"'>&gt;&gt;</a></span>");
					}else if(cpage >= totalPage){
						out.println("&nbsp;");
						out.println("<span><a>&gt;&gt;</a></span>");
					}else{
						out.println("&nbsp;");
						out.println("<span><a href='board_list1.jsp?cpage="+ (cpage + 5) +"'>&gt;&gt;</a></span>");
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
