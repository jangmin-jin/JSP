/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.46
 * Generated at: 2021-06-22 07:32:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.mariadb.design_005fpaging2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import model.paging.BoardDAO;
import model.paging.BoardListTO;
import model.paging.BoardTO;

public final class board_005flist1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("model.paging.BoardListTO");
    _jspx_imports_classes.add("model.paging.BoardDAO");
    _jspx_imports_classes.add("model.paging.BoardTO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	request.setCharacterEncoding("utf-8");
	
	// BoardListTO 에 현제 cpage값 전달
	BoardListTO listTo = new BoardListTO();
	listTo.setCpage(1);
	if( request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
		listTo.setCpage(Integer.parseInt( request.getParameter("cpage") ));
	}
	
	// 함수 실행을 위한 DAO 선언
	BoardDAO dao = new BoardDAO();
	// DAO에서 함수가 실행되면 BoardListTO의 값들이 변경된다.
	listTo = dao.boardList(listTo);
	
	// BoardListTO의 변경된 값들을 받아온다.
	int cpage = listTo.getCpage();
	int blockPerPage = listTo.getBlockPerPage();
	int totalPage = listTo.getTotalPage();
	int totalRecord = listTo.getTotalRecord();
	int totalDivPage = listTo.getTotalDivPerPage();
	
	// 변경된 BoardListTO의 값을 BoardeLists (ArrayList<BoardTO>형식)를 통해 가져온다.
	ArrayList<BoardTO> datas = listTo.getBoardLists();
	
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
		sbHtml.append( "		<a href='board_view1.jsp?seq=" + seq + "&cpage="+ cpage +"'>" + subject + "</a>" );
		if( wgap == 0 ) {
			sbHtml.append( "	&nbsp;<img src='../../images/icon_new.gif' alt='NEW'>" );
		}
		sbHtml.append( "	</td>" );
		sbHtml.append( "	<td>" + writer + "</td>" );
		sbHtml.append( "	<td>" + wdate + "</td>" );
		sbHtml.append( "	<td>" + hit + "</td>" );
		sbHtml.append( "	<td>&nbsp;</td>" );
		sbHtml.append( "</tr>" );			
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/board_list.css\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<!-- 상단 디자인 -->\r\n");
      out.write("<div class=\"con_title\">\r\n");
      out.write("	<h3>게시판</h3>\r\n");
      out.write("	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"con_txt\">\r\n");
      out.write("	<div class=\"contents_sub\">\r\n");
      out.write("		<div class=\"board_top\">\r\n");
      out.write("			<div class=\"bold\">총 <span class=\"txt_orange\">");
      out.print(totalRecord );
      out.write("</span>건</div>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("		<!--게시판-->\r\n");
      out.write("		<div class=\"board\">\r\n");
      out.write("			<table>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th width=\"3%\">&nbsp;</th>\r\n");
      out.write("				<th width=\"5%\">번호</th>\r\n");
      out.write("				<th>제목</th>\r\n");
      out.write("				<th width=\"10%\">글쓴이</th>\r\n");
      out.write("				<th width=\"17%\">등록일</th>\r\n");
      out.write("				<th width=\"5%\">조회</th>\r\n");
      out.write("				<th width=\"3%\">&nbsp;</th>\r\n");
      out.write("			</tr>\r\n");
      out.write("<!-- 시작 -->\r\n");
      out.print(sbHtml );
      out.write("\r\n");
      out.write("<!-- 끝 -->\r\n");
      out.write("			</table>\r\n");
      out.write("		</div>	\r\n");
      out.write("		<!--//게시판-->\r\n");
      out.write("\r\n");
      out.write("		<div class=\"align_right\">\r\n");
      out.write("			<input type=\"button\" value=\"쓰기\" class=\"btn_write btn_txt01\" style=\"cursor: pointer;\" onclick=\"location.href='board_write1.jsp'\" />\r\n");
      out.write("		</div>\r\n");
      out.write("		\r\n");
      out.write("		<!--페이지넘버-->\r\n");
      out.write("		<div class=\"paginate_regular\">\r\n");
      out.write("			<div align=\"absmiddle\">\r\n");
      out.write("				<!-- << 버튼 -->\r\n");
      out.write("				");

					if(cpage <= blockPerPage && cpage > 1){
						out.println("<span><a href='board_list1.jsp?cpage="+ 1 +"'>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}else if(cpage <= 1){
						out.println("<span><a>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}else{
						out.println("<span><a href='board_list1.jsp?cpage="+ (cpage - blockPerPage) +"'>&lt;&lt;</a></span>");
						out.println("&nbsp;");
					}
				
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<!-- < 버튼 -->\r\n");
      out.write("				");

					if(cpage <= 1){
						out.println("<span><a>&lt;</a></span>");
						out.println("&nbsp;&nbsp;");
					}else{
						out.println( "<span><a href='board_list1.jsp?cpage="+ (cpage - 1) +"'>&lt;</a></span>" );
						out.println("&nbsp;&nbsp;");
					}
				
      out.write("\r\n");
      out.write("	\r\n");
      out.write("				<!-- 페이지 번호 선택 -->\r\n");
      out.write("				");

					for( int i=0; i<=totalDivPage; i++ ){
						int startPage = (i*blockPerPage) + 1;
						int endPage = (i*blockPerPage) + 5;
						
						// 현재페이지가 1~5, 6~10, 11~15, 16~20 등 5개 단위로 끊어져있는 영역중 어디에 있는지를 기준으로
						if(startPage <= cpage && cpage <= endPage && i == totalDivPage){
							for( int j = startPage; j <= totalPage; j++){
								if( j == cpage ){
									out.println( "<span><a><b>["+ j +"]</b></a></span>" );
								}else{
									out.println( "<span><a href='board_list1.jsp?cpage="+ j +"'>"+ j +"</a></span>" );
								}
							}
						}else if( startPage <= cpage && cpage <= endPage ){
							for( int j = startPage; j <= endPage; j++){
								if( j == cpage ){
									out.println( "<span><a><b>["+ j +"]</b></a></span>" );
								}else{
									out.println( "<span><a href='board_list1.jsp?cpage="+ j +"'>"+ j +"</a></span>" );
								}
							}
						}
					}
				
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<!-- > 버튼 -->\r\n");
      out.write("				");

					if(cpage >= totalPage){
						out.println("&nbsp;&nbsp;");
						out.println("<span><a>&gt;</a></span>");
					}else{
						out.println("&nbsp;&nbsp;");
						out.println( "<span><a href='board_list1.jsp?cpage="+ (cpage + 1) +"'>&gt;</a></span>" );
					}
				
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<!-- >> 버튼 -->\r\n");
      out.write("				");

					if(cpage >= totalPage - blockPerPage && cpage < totalPage){
						out.println("&nbsp;");
						out.println("<span><a href='board_list1.jsp?cpage="+ totalPage +"'>&gt;&gt;</a></span>");
					}else if(cpage >= totalPage){
						out.println("&nbsp;");
						out.println("<span><a>&gt;&gt;</a></span>");
					}else{
						out.println("&nbsp;");
						out.println("<span><a href='board_list1.jsp?cpage="+ (cpage + blockPerPage) +"'>&gt;&gt;</a></span>");
					}
				
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		<!--//페이지넘버-->\r\n");
      out.write("		\r\n");
      out.write("	</div>\r\n");
      out.write("</div>\r\n");
      out.write("<!--//하단 디자인 -->\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
