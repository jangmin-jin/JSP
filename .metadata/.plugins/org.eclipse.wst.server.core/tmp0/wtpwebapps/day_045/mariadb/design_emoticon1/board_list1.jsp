<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	StringBuilder sbHtml = new StringBuilder();
	
	int totalRecord = 0;
	
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb" );
		
		conn = dataSource.getConnection();
		
		String sql = "select seq, subject, writer, emot, date_format(wdate, '%Y-%m-%d') wdate, hit from emot_board1 order by seq desc";
		pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
		
		rs = pstmt.executeQuery();
		
		rs.last();
		totalRecord = rs.getRow();
		rs.beforeFirst();
		
		while( rs.next() ) {
			String seq = rs.getString( "seq" );
			String subject = rs.getString( "subject" );
			String writer = rs.getString( "writer" );
			String emot = rs.getString( "emot" );
			String wdate = rs.getString( "wdate" );
			String hit = rs.getString( "hit" );
			
			sbHtml.append( "<tr>" );
			sbHtml.append( "	<td><img src='../../images/emoticon/emot" + emot + ".png' width='15' /></td>" );
			sbHtml.append( "	<td>" + seq + "</td>" );
			sbHtml.append( "	<td class='left'><a href='board_view1.jsp?seq=" + seq + "'>" + subject + "</a>&nbsp;<img src='../../images/icon_new.gif' alt='NEW'></td>" );
			sbHtml.append( "	<td>" + writer + "</td>" );
			sbHtml.append( "	<td>" + wdate + "</td>" );
			sbHtml.append( "	<td>" + hit + "</td>" );
			sbHtml.append( "	<td>&nbsp;</td>" );
			sbHtml.append( "</tr>" );			
		}
		
	} catch( NamingException e ) {
		System.out.println( "[??????] " + e.getMessage() );
	} catch( SQLException e ) {
		System.out.println( "[??????] " + e.getMessage() );
	} finally {
		if( rs != null ) rs.close();
		if( pstmt != null ) pstmt.close();
		if( conn != null ) conn.close();
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
<!-- ?????? ????????? -->
<div class="con_title">
	<h3>?????????</h3>
	<p>HOME &gt; ????????? &gt; <strong>?????????</strong></p>
</div>
<div class="con_txt">
	<div class="contents_sub">
		<div class="board_top">
			<div class="bold">??? <span class="txt_orange"><%=totalRecord %></span>???</div>
		</div>

		<!--?????????-->
		<div class="board">
			<table>
			<tr>
				<th width="3%">&nbsp;</th>
				<th width="5%">??????</th>
				<th>??????</th>
				<th width="10%">?????????</th>
				<th width="17%">?????????</th>
				<th width="5%">??????</th>
				<th width="3%">&nbsp;</th>
			</tr>
<!-- ?????? -->
<%=sbHtml %>
<!-- ??? -->
			</table>
		</div>	
		<!--//?????????-->

		<div class="align_right">
			<input type="button" value="??????" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
		</div>
	</div>
</div>
<!--//?????? ????????? -->

</body>
</html>
