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
    <title>게시물 작성하기</title>
</head>
<body>
	<div class="container">
		<div class="ui three item menu">
			<a class="item" href="./index.jsp">메인페이지</a>
			<a class="item" href="./read.jsp">글목록</a>
			<a class="active item" href="./write.jsp">글쓰기</a>
		</div>
		
		<h2>게시물 작성하기</h2>
		<div class="ui divider"></div>
		<form class="ui form" action="./writeAction.jsp">
		  <div class="field">
		    <label>제목</label>
		    <input type="text" name="title" placeholder="글 제목을 입력하세요.">
		  </div>
		  <div class="field">
		    <label>내용</label>
		    <textarea name="content" rows="5" placeholder="글 내용을 입력하세요."></textarea>
		  </div>
		  <button class="ui primary button" type="submit">
		  	글쓰기
		  </button>
		  <button class="ui button" onClick="location.href='./read.jsp'">
		    취소
		  </button>r
		</form>
	</div>
</body>
</html>