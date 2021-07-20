<%@page import="java.util.ArrayList"%>
<%@page import="DAO.PostDAO"%>
<%@page import="DTO.Post"%>
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
    <title>게시물 보기</title>
</head>
<body>
	<div class="container">
		<div class="ui three item menu">
			<a class="item" href="./index.jsp">메인페이지</a>
			<a class="active item" href="./read.jsp">글목록</a>
			<a class="item" href="./write.jsp">글쓰기</a>
		</div>
		<h2>게시물 보기</h2>
		<div class="ui divider"></div>
		<button class="ui primary button" onClick="location.href='./write.jsp'">
		  글쓰기
		</button>
		<table class="ui celled table">
		  <thead>
		    <tr>
			    <th>NO.</th>
			    <th>제목</th>
			    <th>작성일</th>
			    <th></th>
		 	</tr>
		  </thead>
		  <tbody>
		   <% 
		   PostDAO dao = new PostDAO();
		   ArrayList<Post> list = dao.read();
		   
		   for(int i=0 ; i<list.size() ; i++) {
			%>
			<tr>
		      <td data-label="NO"><%= i+1 %></td>
		      <td data-label="title"><a href="./detail.jsp?id=<%= list.get(i).getId() %>"><%= list.get(i).getTitle() %></a></td>
		      <td data-label="content"><%= list.get(i).getReg_date() %></td>
		      <td><button class="ui button" onClick="location.href='./delete.jsp?id=<%= list.get(i).getId() %>'">삭제</button></td>
		      <td><button class="ui button" onClick="location.href='./update.jsp?id=<%= list.get(i).getId() %>'">수정</button></td>
		    </tr>
			<%   
		   }
		   %>
		  </tbody>
		</table>
	</div>
</body>
</html>