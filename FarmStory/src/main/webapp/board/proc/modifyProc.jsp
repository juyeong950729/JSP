<%@page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	ArticleDAO.getInstance().updateArticle(no, content, title);
	
	response.sendRedirect("/FarmStory/view.jsp?no="+no+"&pg="+pg+"&result=201");

%>