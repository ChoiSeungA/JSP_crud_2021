<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="DAO.PostDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	PrintWriter writer = response.getWriter();
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	System.out.println(title);
	System.out.println(content);
	
	if (title == null || content == null) {
		writer.println("<script>");
		writer.println("alert('제목과 내용을 모두 입력해주세요!')");
		writer.println("history.back()");
		writer.println("</script>");
	} else {
		PostDAO dao = new PostDAO();
		int result = dao.write(title, content);
		
		if (result == -1) {
			writer.println("<script>");
			writer.println("alert('글쓰기에 실패했습니다.')");
			writer.println("history.back()");
			writer.println("</script>");
		}
		else {
			writer.println("<script>");
			writer.println("location.href='read.jsp'");
			writer.println("</script>");
		}
	}
	
	%>
</body>
</html>