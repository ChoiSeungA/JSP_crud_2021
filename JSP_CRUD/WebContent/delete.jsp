<%@page import="java.util.ArrayList"%>
<%@page import="DAO.PostDAO"%>
<%@page import="DTO.Post"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./assets/css/semantic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/style.css">
	<script
	  src="https://code.jquery.com/jquery-3.1.1.min.js"
	  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	  crossorigin="anonymous"></script>
	<script src="./assets/js/semantic.js"></script>
	<script src="./assets/js/semantic.min.js"></script>
    <title>게시물 작성하기</title>
</head>
<body>
	<div class="container">
		<div class="ui three item menu">
			<a class="item" href="./index.jsp">메인페이지</a>
			<a class="item" href="./read.jsp">글목록</a>
			<a class="active item" href="./write.jsp">글쓰기</a>
		</div>
		
		<%	
			int id = 0;
			PrintWriter writer = response.getWriter();
		
			if (request.getParameter("id") != null)
				id = Integer.parseInt(request.getParameter("id"));
			
			if (id == 0) {
				writer.println("<script>");
				writer.println("alert('유효하지 않은 글입니다.')");
				writer.println("location.href='read.jsp'");
				writer.println("</script>");
			}
			
			int result = new PostDAO().delete(id);
			if(result == -1) {
				writer.println("<script>");
				writer.println("alert('글 삭제에 실패했습니다.')");
				writer.println("'history.back()'");
				writer.println("</script>");
			} else {
				writer.println("<script>");
				writer.println("location.href='read.jsp'");
				writer.println("</script>");	
			}
			
		%>
		
	</div>
</body>
</html>