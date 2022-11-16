<%@page import="kr.co.farmstory.vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserVO sessUser = (UserVO) session.getAttribute("sessUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::메인</title>
    <link rel="stylesheet" href="/FarmStory/css/style.css">
    <link rel="stylesheet" href="/FarmStory/user/css/style.css">
    <link rel="stylesheet" href="/FarmStory/board/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <header>
            <a href="/FarmStory/index.jsp" class="logo">
                <img src="/FarmStory/img/logo.png" alt="로고">
            </a>
            <p>
                <a href="/FarmStory/">HOME |</a>
                <% if (sessUser == null){ %>
                <a href="/FarmStory/user/login.jsp">로그인 |</a>
                <a href="/FarmStory/user/terms.jsp">회원가입 |</a>
                <% }else{ %>
                <a href="/FarmStory/user/proc/logout.jsp">로그아웃 |</a>
                <% } %>
                <a href="#">고객센터</a>
            </p>
            <img src="/FarmStory/img/head_txt_img.png" alt="3만원 이상 무료배송">
            <ul class="gnb">
                <li><a href="/FarmStory/introduction/hello.jsp">팜스토리소개</a></li>
                <li><a href="/FarmStory/board/list.jsp?group=market&cate=market"><img src="/FarmStory/img/head_menu_badge.png" alt="30%">장보기</a></li>
                <li><a href="/FarmStory/board/list.jsp?group=croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/FarmStory/board/list.jsp?group=event&cate=event">이벤트</a></li>
                <li><a href="/FarmStory/board/list.jsp?group=community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>
        