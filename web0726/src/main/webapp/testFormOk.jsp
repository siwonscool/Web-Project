<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String path="c:/upload";
	int size=10*1024*1024;
	String name="";
	String title="";
	String[] upload = null;
	int fileCount=0;
	try{
		MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		fileCount = Integer.parseInt(multi.getParameter("fileCount"));
		name=multi.getParameter("name");
		title=multi.getParameter("title");
		upload = new String[fileCount];
		Enumeration e = multi.getFileNames();
		int i =0;
		while(e.hasMoreElements()){
			String fname = (String)e.nextElement();
			upload[i]=fname;
			i++;
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	<label>작성자: <%=name %></label><br>
	<label>제목: <%=title %></label>
	<br><br>
	<%for(int j =0;j<fileCount;j++){ %>
		<label>업로드된 파일명: <%=upload[j] %></label> <br>
	<%} %>
</body>
</html>