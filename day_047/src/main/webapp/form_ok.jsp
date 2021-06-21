<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	// 1. 경로
	// 2. 용량제한(byte)
	// 3. 인코딩
	String uploadPath = "C:/JSP/eclipse-workspace/day_047/src/main/webapp/upload";

	int maxFileSize = 1024*1024*2;
	String encType = "utf-8";
	
	// new DefaultFileRenamePolicy는 파일 중복처리를 해주는 역할을 한다.
	MultipartRequest multi = new MultipartRequest( request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy() ) ;
	
	out.println("전송 완료<br>");
	
	// 파일 이름, 오리지널 데이터 출력
	//out.println(multi.getFilesystemName("upload1") + "<br>");
	//out.println(multi.getOriginalFileName("upload1") + "<br>");
	
	// 파일 사이즈, 최근 수정날짜 출력
	File file = multi.getFile("upload1");
	out.println(file.length() + "<br>");
	out.println(file.lastModified() + "<br>");
	
	// multi로 request를 감쌋기 때문에 multi로 해야함
	//out.println(request.getParameter("id") + "<br>");
	out.println(multi.getParameter("id") + "<br>");
	
	// 특정 뇨속들은 request로 선언해야함
	// 특히 시스템에서 넣어주는 값들의 경우가 이에 해당
	out.println(request.getRemoteAddr() + "<br>");
%>